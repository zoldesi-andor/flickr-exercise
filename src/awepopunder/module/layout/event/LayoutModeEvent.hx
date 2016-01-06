package awepopunder.module.layout.event;

import awepopunder.module.layout.constant.LayoutMode;
import hex.event.BasicEvent;

/**
 * ...
 * @author duke
 */
class LayoutModeEvent extends BasicEvent
{
	public static inline var LAYOUT_MODE_CHANGED:String = "layoutModeChanged";
	
	public var mode:LayoutMode;

	public function new(type:String, mode:LayoutMode, target:Dynamic) 
	{
		super(type, target);
		
		this.mode = mode;
	}
	
}