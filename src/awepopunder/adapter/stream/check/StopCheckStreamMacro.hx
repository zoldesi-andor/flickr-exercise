package awepopunder.adapter.stream.check;

import awepopunder.adapter.stream.check.controller.StopCheckPerformerStatusCommand;
import hex.event.MacroAdapterStrategy;

/**
 * ...
 * @author 
 */
class StopCheckStreamMacro extends MacroAdapterStrategy
{

	public function new() 
	{
		super(this, this.onAdapt);
		#if debug
		hex.log.Logger.DEBUG("awepopunder.adapter.stream.check.StopCheckStreamMacro");
		#end
	}
	
	override function _prepare():Void 
	{
		this.add( StopCheckPerformerStatusCommand );
	}
	
	public function onAdapt():Void
	{
		
	}
	
}