package awepopunder.module.navigator.request;
import haxe.web.Request;

/**
 * ...
 * @author Chris
 */
class SetCurrentPerformerRequest extends Request
{
	public var performerId:String;

	public function new( performerId:String ) 
	{
		super();
		this.performerId = performerId;
	}
	
}