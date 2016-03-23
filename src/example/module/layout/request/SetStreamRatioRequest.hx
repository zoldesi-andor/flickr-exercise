package example.module.layout.request;
import hex.control.Request;

/**
 * ...
 * @author 
 */
class SetStreamRatioRequest extends Request
{
	public var ratio:Float;

	public function new( ratio:Float ) 
	{
		super( );
		this.ratio = ratio;
		
	}
	
}