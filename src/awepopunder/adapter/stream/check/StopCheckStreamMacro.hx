package awepopunder.adapter.stream.check;

import awepopunder.adapter.stream.check.controller.StopCheckPerformerStatusCommand;
import hex.event.MacroAdapterStrategy;

/**
 * ...
 * @author 
 */
class StopCheckStreamMacro extends MacroAdapterStrategy
{

	public function new(target:Dynamic, method:Dynamic) 
	{
		super(this, this.onAdapt);
		
	}
	
	override function _prepare():Void 
	{
		this.add( StopCheckPerformerStatusCommand );
	}
	
	public function onAdapt():Void
	{
		
	}
	
}