package awepopunder.module.performerprovider.request;

import hex.control.Request;

/**
 * ...
 * @author Chris
 */
class SetPreferredPerformerRequest extends Request
{
	public var preferredPerformerId:String;

	public function new( preferredPerformerId:String ) 
	{
		super();
		this.preferredPerformerId = preferredPerformerId;
	}
	
}