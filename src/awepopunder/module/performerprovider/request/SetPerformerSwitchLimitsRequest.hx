package awepopunder.module.performerprovider.request;

import hex.control.Request;

/**
 * ...
 * @author duke
 */
class SetPerformerSwitchLimitsRequest extends Request
{
	public var manual:Int;
	public var auto:Int;

	public function new(auto:Int, manual:Int) 
	{
		super();
		this.manual = manual;
		this.auto = auto;
		
	}
	
}