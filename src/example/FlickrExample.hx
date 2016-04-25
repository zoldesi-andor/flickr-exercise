package example;
import hex.ioc.parser.xml.XmlReader;
/**
 * ...
 * @author duke
 */
@:expose("FlickrExample")
class FlickrExample extends BasicMain
{
	static var self:FlickrExample;

	static public function main() : Void
	{
		#if debug
		//todo zubi why is in debug? - ANSWER: to let the js instantiate when it is on it's correct place
		self = new FlickrExample(); 
		#end
	}
	
	public function new()
	{
		super();
		
		var source:String = XmlReader.readXmlFile( "example/configuration/context.xml" );
		trace(source);
		this._build( source );
	}
}