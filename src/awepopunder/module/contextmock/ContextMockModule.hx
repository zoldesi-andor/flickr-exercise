package awepopunder.module.contextmock;

import awepopunder.module.contextmock.message.ContextModuleExternalMessage;
import haxe.Timer;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;
import hex.module.Module;

/**
 * ...
 * @author 
 */
class ContextMockModule extends Module
{

	public function new() 
	{
		super();
		
	}
	
	override private function _onInitialisation():Void 
	{
		super._onInitialisation();
		
		Timer.delay(this.dispatchReady, 1);
	}
	
	override private function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd : RuntimeDependencies = new RuntimeDependencies();
		return rd;
	}
	
	private function dispatchReady():Void
	{
		this._domainDispatcher.dispatch( ContextModuleExternalMessage.READY, [] );
	}
	
}