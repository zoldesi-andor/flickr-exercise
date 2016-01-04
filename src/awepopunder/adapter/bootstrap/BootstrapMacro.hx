package awepopunder.adapter.bootstrap;

import awepopunder.adapter.bootstrap.controller.ConnectChatWebSocketCommand;
import awepopunder.adapter.bootstrap.controller.InitHlsStreamCommand;
import hex.event.MacroAdapterStrategy;

/**
 * ...
 * @author 
 */
@:rtti
class BootstrapMacro extends MacroAdapterStrategy
{

	public function new(target:Dynamic, method:Dynamic) 
	{
		super(target, method);
		
	}
	
	override function _prepare():Void 
	{
		this.add(InitHlsStreamCommand);
		this.add(ConnectChatWebSocketCommand);
	}
	
	public function onAdapt( ) : Void
	{
		
	}
	
}