package;
import com.service.ServiceTestSuite;
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

	@Suite( "HexMVC suite" )
    public var list : Array<Class<Dynamic>> = [HexMVCSuite, HexCoreSuite, HexInjectSuite, HexMachinaSuite, HexStateSuite];
	
	//@Suite( "Docler suite" )
    //public var list2 : Array<Class<Dynamic>> = [ServiceTestSuite];
	
}