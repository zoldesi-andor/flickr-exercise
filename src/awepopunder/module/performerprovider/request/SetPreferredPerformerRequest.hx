package awepopunder.module.performerprovider.request;

import hex.control.Request;

/**
 * ...
 * @author Chris
 */
class SetPreferredPerformerRequest extends Request
{
	public var preferredPerformer:String;

	public function new( preferredPerformer:String ) 
	{
		super();
		this.preferredPerformer = preferredPerformer;
	}
	
}