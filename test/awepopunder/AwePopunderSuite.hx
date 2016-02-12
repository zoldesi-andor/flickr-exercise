package awepopunder;
import com.ModuleSuite;
import com.service.ServiceSuite;

/**
 * ...
 * @author duke
 */
class AwePopunderSuite
{

	@Suite( "AwePopunderSuite" )
    public var list : Array<Class<Dynamic>> = [
	
	ModuleSuite, ServiceSuite];
	
}