package awepopunder.adapter.switchperformer;

import awepopunder.adapter.switchperformer.controller.PlayHlsStreamCommand;
import awepopunder.adapter.stream.check.StopCheckStreamMacro;
import awepopunder.adapter.switchperformer.controller.LoadNextPerformerCommand;
import awepopunder.adapter.switchperformer.controller.SetOfflineCommand;
import awepopunder.adapter.switchperformer.controller.SetOnlineCommand;
import awepopunder.adapter.switchperformer.controller.SetPerformerIdCommand;
import awepopunder.adapter.switchperformer.controller.SetPerformerProfilePictureCommand;
import awepopunder.adapter.switchperformer.controller.StopHlsStreamCommand;
import awepopunder.adapter.switchperformer.macro.SwitchChatMacro;
import awepopunder.adapter.switchperformer.marco.SwitchStreamMacro;
import awepopunder.module.performerprovider.IPerformerProviderModule;
import awepopunder.vo.performer.PerformerDataVO;
import awepopunder.vo.settings.application.InitialApplicationSettingsVO;
import com.service.net.chatwebsocket.IChatWebSocketService;
import hex.control.async.AsyncCommand;
import hex.control.async.AsyncHandler;
import hex.control.payload.ExecutionPayload;
import hex.di.ISpeedInjectorContainer;
import hex.event.MacroAdapterStrategy;

/**
 * ...
 * @author duke
 */
class SwitchPerformerMacro extends MacroAdapterStrategy
{
	@Inject("performerProviderModule")
	public var performerProviderModule:IPerformerProviderModule;

	@Inject("chatWebSocketService")
	public var webSocketService:IChatWebSocketService;
	
	@Inject("initialApplicationSettings")
	public var initialApplicationSettings:InitialApplicationSettingsVO;

	
	var _previousPerformerData:PerformerDataVO;

	public function new(target:Dynamic, method:Dynamic) 
	{
		super(this, this.onAdapt);
		
	}
	
	override function _prepare():Void 
	{
		this.clonePerformerData( );
		
		// Check if this is the first performer switch, unless we skip the validations
		if ( this._previousPerformerData.performerId != null )
		{
			this.add(StopCheckStreamMacro);
			
			//TODO: add manual switch support
			if ( this.initialApplicationSettings.filterSettings.forcePerformer ||
				this.performerProviderModule.isAutoPerformerSwitchLimitReached() )
			{
				this.setOffline();
				return;
			}
		}
		
		this.add(LoadNextPerformerCommand).withCompleteHandlers(new AsyncHandler(this, this._onPerformerDataLoaded));
	}
	
	function _onPerformerDataLoaded( command:AsyncCommand ):Void
	{

		var performerData:PerformerDataVO = command.getResult()[0];
		
		#if debug
			if ( performerData.streamUrl == null || performerData.streamUrl == "" )
			{
				performerData.streamUrl =  "http://109.71.162.112/live/hd.jasminchannel.stream/playlist.m3u8";
				performerData.streamRatio = 16/9;
			}
		#end
		
		#if debug
		hex.log.Logger.DEBUG("SwitchPerformerMacro._onPerformerDataLoaded performerData: " + performerData + ", PerformerDataVO : " + PerformerDataVO);
		#end

		var performerDataPayload = new ExecutionPayload(performerData, PerformerDataVO);
		var previousPerformerDataPayload = new ExecutionPayload(this._previousPerformerData, PerformerDataVO, "previous");


		this.add(SetPerformerIdCommand).withPayloads([performerDataPayload]);
		this.add(SetPerformerProfilePictureCommand).withPayloads([performerDataPayload]);

		if ( performerData.streamUrl == null || performerData.streamUrl == "" )
		{
			this.add(SwitchPerformerMacro); //switch to another performer if the current one doesn't have stream
			return;
		}
		
		//TODO: don't care if we cannot subscribe to a room, ingore it and go ahead with the other thigns
		this.add(SwitchStreamMacro).withPayloads([performerDataPayload, previousPerformerDataPayload]);

		if ( this._previousPerformerData.performerId != null || this.initialApplicationSettings.streamSettings.autoPlay )
		{
			this.add(PlayHlsStreamCommand);
		}

		//TODO implement guard injection
		///this.add(SwitchChatMacro).withPayloads([performerDataPayload, previousPerformerDataPayload]).withGuards([ConnectedToChatGuard]);
		if ( this.webSocketService.inUse() )
		{
			this.add(SwitchChatMacro).withPayloads([performerDataPayload, previousPerformerDataPayload]);
		}

		this.add(SetOnlineCommand);
	}
	
	function setOffline():Void
	{
		this.add(StopHlsStreamCommand);
		this.add(SetOfflineCommand);
		//TODO: disconnecft from chat server
	}
	
	function clonePerformerData():Void
	{
		this._previousPerformerData = new PerformerDataVO();
		var performerData:PerformerDataVO = this.performerProviderModule.getActivePerformer();
		
		if ( performerData != null )
		{
			this._previousPerformerData.imageUrl = performerData.imageUrl;
			this._previousPerformerData.performerId = performerData.performerId;
			this._previousPerformerData.streamRatio = performerData.streamRatio;
			this._previousPerformerData.streamUrl = performerData.streamUrl;
		}
	}
	
	
	public function onAdapt( ) : Void
	{
		
	}
}