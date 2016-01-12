package awepopunder.adapter.bootstrap;

import awepopunder.adapter.bootstrap.controller.InitHlsStreamCommand;
import awepopunder.adapter.bootstrap.controller.LoadApplicationSettingsCommand;
import awepopunder.adapter.bootstrap.controller.LoadPerformerDataCommand;
import awepopunder.adapter.bootstrap.controller.SetOnlineCommand;
import awepopunder.adapter.bootstrap.macro.InitChatWebSocketMacro;
import awepopunder.vo.performer.PerformerDataVO;
import awepopunder.vo.settings.application.ApplicationSettingsVO;
import hex.control.async.AsyncCommand;
import hex.control.async.AsyncHandler;
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
		this.add(LoadApplicationSettingsCommand).withCompleteHandlers( new AsyncHandler(this, this.onApplicationSettingsLoaded ) );
	}
	
	function onApplicationSettingsLoaded( command:AsyncCommand ):Void
	{
		this._settings = command.getPayload()[0];
		this.add(LoadPerformerDataCommand).withCompleteHandlers( new AsyncHandler( this, this.onPerformerDataLoaded ) );
	}
	
	function onPerformerDataLoaded( command:AsyncCommand ):Void
	{
		var performerData:PerformerDataVO = command.getPayload()[0];
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