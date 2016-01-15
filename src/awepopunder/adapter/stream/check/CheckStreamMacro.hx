package awepopunder.adapter.stream.check;

import awepopunder.adapter.stream.check.controller.CheckPerformerStatusCommand;
import hex.event.MacroAdapterStrategy;

/**
 * ...
 * @author 
 */
class CheckStreamMacro extends MacroAdapterStrategy
{

	public function new(target:Dynamic, method:Dynamic) 
	{
		super(this, this.onAdapt);
		
	}
	
	override function _prepare():Void 
	{
		this.add( CheckPerformerStatusCommand );
	}
	
	public function onAdapt():Void
	{
		
	}
	
}