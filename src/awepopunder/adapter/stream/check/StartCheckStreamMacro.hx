package awepopunder.adapter.stream.check;

import awepopunder.adapter.stream.check.controller.StartCheckPerformerStatusCommand;
import hex.event.MacroAdapterStrategy;

/**
 * ...
 * @author 
 */
class StartCheckStreamMacro extends MacroAdapterStrategy
{

	public function new(target:Dynamic, method:Dynamic) 
	{
		super(this, this.onAdapt);
		
	}
	
	override function _prepare():Void 
	{
		this.add( StartCheckPerformerStatusCommand );
	}
	
	public function onAdapt():Void
	{
		
	}
	
}