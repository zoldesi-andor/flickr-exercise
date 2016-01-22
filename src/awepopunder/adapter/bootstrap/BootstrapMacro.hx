package awepopunder.adapter.bootstrap;

import awepopunder.adapter.bootstrap.controller.ConnectChatWebSocketCommand;
import awepopunder.adapter.bootstrap.controller.InitPerformerProviderSettingsCommand;
import awepopunder.adapter.bootstrap.controller.InitUrlProviderCommand;
import awepopunder.adapter.bootstrap.controller.LoadApplicationSettingsCommand;
import awepopunder.adapter.bootstrap.controller.SetPerformerProviderSettingsCommand;
import awepopunder.adapter.switchperformer.SwitchPerformerMacro;
import awepopunder.vo.settings.application.ApplicationSettingsVO;
import hex.control.async.AsyncCommand;
import hex.control.async.AsyncHandler;
import hex.control.macro.Macro;
import hex.control.payload.ExecutionPayload;

/**
 * ...
 * @author 
 */
@:rtti
class BootstrapMacro extends Macro
{
	
	private var _settings:ApplicationSettingsVO;

	public function new() 
	{
		super();
	}
	
	override function _prepare():Void 
	{
		trace("TADAAA");
		this.add(InitUrlProviderCommand);
		this.add(InitPerformerProviderSettingsCommand);
		this.add(LoadApplicationSettingsCommand).withCompleteHandlers( new AsyncHandler(this, this.onApplicationSettingsLoaded ) );
	}
	
	function onApplicationSettingsLoaded( command:AsyncCommand ):Void
	{
		this._settings = command.getPayload()[0];
		
		var settingsPayload:ExecutionPayload = new ExecutionPayload(this._settings, ApplicationSettingsVO);
		
		this.add(ConnectChatWebSocketCommand).withPayloads([settingsPayload]);
		this.add(SetPerformerProviderSettingsCommand).withPayloads([settingsPayload]);
		this.add(SwitchPerformerMacro);
		
	}
	
}