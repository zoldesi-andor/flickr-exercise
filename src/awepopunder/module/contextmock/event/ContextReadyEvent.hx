package awepopunder.module.contextmock.event;

import hex.event.BasicEvent;

/**
 * ...
 * @author 
 */
class ContextReadyEvent extends BasicEvent
{
	static public inline var READY:String = "ContextReadyEvent.ready";

	public function new(type:String, target:Dynamic) 
	{
		super(type, target);
		
	}
	
}