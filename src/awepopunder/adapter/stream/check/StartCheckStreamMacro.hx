package awepopunder.adapter.stream.check;

import awepopunder.adapter.stream.check.controller.StartCheckPerformerStatusCommand;
import hex.event.MacroAdapterStrategy;

/**
 * ...
 * @author 
 */
class StartCheckStreamMacro extends MacroAdapterStrategy
{

	public function new() 
	{
		super(this, this.onAdapt);
		#if debug
		hex.log.Logger.DEBUG("awepopunder.adapter.stream.check.StartCheckStreamMacro");
		#end
	}
	
	override function _prepare():Void 
	{
		this.add( StartCheckPerformerStatusCommand );
	}
	
	public function onAdapt():Void
	{
		
	}
	
}