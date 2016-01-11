package awepopunder.adapter.bootstrap;

import awepopunder.adapter.bootstrap.controller.InitHlsStreamCommand;
import awepopunder.adapter.bootstrap.controller.LoadApplicationSettingsCommand;
import awepopunder.adapter.bootstrap.controller.LoadPerformerDataCommand;
import awepopunder.adapter.bootstrap.controller.SetOnlineCommand;
import awepopunder.adapter.bootstrap.macro.InitChatWebSocketMacro;
import awepopunder.vo.performer.PerformerDataVO;
import awepopunder.vo.settings.application.ApplicationSettingsVO;
import hex.control.async.AsyncCommandEvent;
import hex.control.payload.ExecutionPayload;
import hex.event.MacroAdapterStrategy;

/**
 * ...
 * @author 
 */
@:rtti
class BootstrapMacro extends MacroAdapterStrategy
{
	
	private var _settings:ApplicationSettingsVO;

	public function new() 
	{
		super(this, this.onAdapt);
		
	}
	
	override function _prepare():Void 
	{
		this.add(LoadApplicationSettingsCommand).withCompleteHandlers([this.onApplicationSettingsLoaded]);
		this.add(LoadPerformerDataCommand).withCompleteHandlers([this.onPerformerDataLoaded]);
	}
	
	function onApplicationSettingsLoaded(e:AsyncCommandEvent):Void
	{
		this._settings = e.getAsyncCommand().getPayload()[0];
		
	}
	
	function onPerformerDataLoaded(e:AsyncCommandEvent):Void
	{
		var performerData:PerformerDataVO = e.getAsyncCommand().getPayload()[0];
		var settingsPayload:ExecutionPayload = new ExecutionPayload(this._settings, ApplicationSettingsVO);
		var performerDataPayload:ExecutionPayload = new ExecutionPayload(performerData, PerformerDataVO);
		
		this.add(InitHlsStreamCommand).withPayloads([performerDataPayload]);
		this.add(InitChatWebSocketMacro).withPayloads([settingsPayload, performerDataPayload]);
		this.add(SetOnlineCommand);
	}
	
	public function onAdapt( ) : Void
	{
		
	}
	
}