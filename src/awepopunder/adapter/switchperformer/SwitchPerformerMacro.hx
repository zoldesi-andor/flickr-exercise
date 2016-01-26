package awepopunder.adapter.switchperformer;

import awepopunder.adapter.bootstrap.controller.SetHlsStreamCommand;
import awepopunder.adapter.switchperformer.controller.ClearChatMessagesCommand;
import awepopunder.adapter.switchperformer.controller.LoadNextPerformerCommand;
import awepopunder.adapter.switchperformer.controller.ForcePerformerValidatorCommand;
import awepopunder.adapter.switchperformer.controller.MaxAutoPerformerSwitchValidatorCommand;
import awepopunder.adapter.switchperformer.controller.SetOfflineCommand;
import awepopunder.adapter.switchperformer.controller.SetOnlineCommand;
import awepopunder.adapter.switchperformer.controller.PlayHlsStreamCommand;
import awepopunder.adapter.switchperformer.controller.SetStreamRatioCommand;
import awepopunder.adapter.switchperformer.controller.SetPerformerIdCommand;
import awepopunder.adapter.switchperformer.controller.StopHlsStreamCommand;
import awepopunder.adapter.switchperformer.controller.SubscribeChatRoomCommand;
import awepopunder.adapter.switchperformer.controller.UnsubscripbeChatRoomCommand;
import awepopunder.module.performerprovider.IPerformerProviderModule;
import awepopunder.vo.performer.PerformerDataVO;
import hex.control.async.AsyncCommand;
import hex.control.async.AsyncHandler;
import hex.control.payload.ExecutionPayload;
import hex.event.MacroAdapterStrategy;

/**
 * ...
 * @author duke
 */
@:rtti
class SwitchPerformerMacro extends MacroAdapterStrategy
{
	@Inject("name=performerProviderModule")
	public var performerProviderModule:IPerformerProviderModule;
	
	var _previourPerformerData:PerformerDataVO;

	public function new(target:Dynamic, method:Dynamic) 
	{
		super(this, this.onAdapt);
		
	}
	
	override function _prepare():Void 
	{
		this.add(ForcePerformerValidatorCommand).withFailHandlers(new AsyncHandler(this, this._onForcePerformerValidatonFailed));
		//TODO: add manual switch support
		this.add(MaxAutoPerformerSwitchValidatorCommand).withFailHandlers(new AsyncHandler(this, this._onMaxSwitchPerformerValidationFailed));
		
		this.clonePerformerData( );
		
		this.add(LoadNextPerformerCommand).withCompleteHandlers(new AsyncHandler(this, this._onPerformerDataLoaded));
	}
	
	function clonePerformerData():Void
	{
		this._previourPerformerData = new PerformerDataVO();
		var performerData:PerformerDataVO = this.performerProviderModule.getActivePerformer();
		
		if ( performerData != null )
		{
			this._previourPerformerData.imageUrl = performerData.imageUrl;
			this._previourPerformerData.performerId = performerData.performerId;
			this._previourPerformerData.streamRatio = performerData.streamRatio;
			this._previourPerformerData.streamUrl = performerData.streamUrl;
		}
	}
	
	function _onForcePerformerValidatonFailed( command:AsyncCommand ):Void
	{
		this.setOffline();
	}
	
	function _onMaxSwitchPerformerValidationFailed( command:AsyncCommand ):Void
	{
		this.setOffline();
	}
	
	function setOffline():Void
	{
		trace("setOffline");
		this.add(StopHlsStreamCommand);
		this.add(SetOfflineCommand);
	}
	
	function _onPerformerDataLoaded( command:AsyncCommand ):Void
	{
		trace("SwitchPerformerMacro._onPerformerDataLoaded", command.getResult()[0]);
		
		var performerDataPayload:ExecutionPayload = new ExecutionPayload(command.getResult()[0], PerformerDataVO);
		
		if ( this._previourPerformerData != null && this._previourPerformerData.performerId != null )
		{
			this.add(StopHlsStreamCommand);
			this.add(UnsubscripbeChatRoomCommand).withPayloads([new ExecutionPayload(this._previourPerformerData, PerformerDataVO)]);
		}
		
		this.add(SetPerformerIdCommand).withPayloads([performerDataPayload]);
		this.add(SetHlsStreamCommand).withPayloads([performerDataPayload]);
		this.add(PlayHlsStreamCommand);
		this.add(SetStreamRatioCommand).withPayloads([performerDataPayload]);
		
		//TODO: don't care if we cannot subscribe to a room, ingore it and go ahead with the other thigns
		this.add(ClearChatMessagesCommand);
		this.add(SubscribeChatRoomCommand).withPayloads([performerDataPayload]);
		this.add(SetOnlineCommand);
	}
	
	
	public function onAdapt( ) : Void
	{
		
	}
}