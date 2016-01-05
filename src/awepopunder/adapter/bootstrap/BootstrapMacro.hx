package awepopunder.adapter.bootstrap;

import awepopunder.adapter.bootstrap.controller.InitHlsStreamCommand;
import awepopunder.adapter.bootstrap.controller.SetOnlineCommand;
import awepopunder.adapter.bootstrap.macro.InitChatWebSocketMacro;
import hex.event.MacroAdapterStrategy;

/**
 * ...
 * @author 
 */
@:rtti
class BootstrapMacro extends MacroAdapterStrategy
{

	public function new() 
	{
		super(this, this.onAdapt);
		
	}
	
	override function _prepare():Void 
	{
		this.add(InitHlsStreamCommand);
		this.add(InitChatWebSocketMacro);
		this.add(SetOnlineCommand);
	}
	
	public function onAdapt( ) : Void
	{
		
	}
	
}