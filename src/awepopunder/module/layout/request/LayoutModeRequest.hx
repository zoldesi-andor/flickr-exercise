package awepopunder.module.layout.request;

import awepopunder.module.layout.constant.LayoutMode;
import hex.control.Request;

/**
 * ...
 * @author 
 */
class LayoutModeRequest extends Request
{
	public var mode:LayoutMode;

	public function new(mode:LayoutMode) 
	{
		super();
		this.mode = mode;
		
	}
	
}