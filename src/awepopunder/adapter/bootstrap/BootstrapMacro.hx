package awepopunder.adapter.bootstrap;

import awepopunder.adapter.bootstrap.controller.ConnectChatWebSocketCommand;
import awepopunder.adapter.bootstrap.controller.InitPerformerProviderSettingsCommand;
import awepopunder.adapter.bootstrap.controller.LoadApplicationSettingsCommand;
import awepopunder.adapter.bootstrap.controller.LoadNextPerformerCommand;
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
		this.add(InitPerformerProviderSettingsCommand);
		this.add(LoadApplicationSettingsCommand).withCompleteHandlers( new AsyncHandler(this, this.onApplicationSettingsLoaded ) );
	}
	
	//TODO: get performer before chat connection. For this we need to separate get next performer and connect to it's room.
	function onApplicationSettingsLoaded( command:AsyncCommand ):Void
	{
		this._settings = command.getPayload()[0];
		this.add(ConnectChatWebSocketCommand).withPayloads([new ExecutionPayload(this._settings, ApplicationSettingsVO)]);
		this.add(LoadNextPerformerCommand);
		
	}
	
	public function onAdapt( ) : Void
	{
		
	}
	
}