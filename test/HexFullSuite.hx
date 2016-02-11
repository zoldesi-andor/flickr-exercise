package;
import com.ModuleSuite;
import com.service.ServiceSuite;
import hex.HexCoreSuite;
import hex.HexInjectSuite;
import hex.HexMachinaSuite;
import hex.HexMVCSuite;
import hex.state.HexStateSuite;

/**
 * ...
 * @author duke
 */
class HexFullSuite
{

	@Suite( "FullSuite" )
    public var list : Array<Class<Dynamic>> = [
	
	HexMVCSuite, HexCoreSuite, HexInjectSuite, HexMachinaSuite, HexStateSuite,
	
	ModuleSuite, ServiceSuite];
	
}