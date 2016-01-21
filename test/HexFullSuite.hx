package;
import com.service.ServiceTestSuite;
import hex.HexCoreSuite;
import hex.HexInjectSuite;
import hex.HexMVCSuite;
import hex.state.HexStateSuite;

/**
 * ...
 * @author duke
 */
class HexFullSuite
{

	@suite( "HexMVC suite" )
    public var list : Array<Class<Dynamic>> = [HexMVCSuite, HexCoreSuite, HexInjectSuite, HexStateSuite];
	
	@suite( "Docler suite" )
    public var list2 : Array<Class<Dynamic>> = [ServiceTestSuite];
	
}