package awepopunder.module.navigator.request;
import hex.control.Request;

/**
 * ...
 * @author Chris
 */
class NavigateToRequest extends Request
{
	public var pageName:String;

	public function new( pageName:String ) 
	{
		super();
		this.pageName = pageName;
	}
	
}