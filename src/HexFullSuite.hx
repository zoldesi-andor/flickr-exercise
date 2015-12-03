package;
import hex.HexCoreSuite;
import hex.HexInjectSuite;
import hex.HexMVCSuite;

/**
 * ...
 * @author duke
 */
class HexFullSuite
{

	@suite( "HexMVC suite" )
    public var list : Array<Class<Dynamic>> = [HexMVCSuite, HexCoreSuite, HexInjectSuite];
	
}