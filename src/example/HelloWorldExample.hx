package example;
import hex.ioc.parser.xml.XmlReader;
/**
 * ...
 * @author duke
 */
@:expose("FlickrExample")
class HelloWorldExample extends BasicMain
{
	static var self:HelloWorldExample;

	static public function main() : Void
	{
		#if debug
		//todo zubi why is in debug? - ANSWER: to let the js instantiate when it is on it's correct place
		self = new HelloWorldExample(); 
		#end
	}
	
	public function new()
	{
		super();
		
		#if js
		var source:String = XmlReader.readXmlFile( "example/configuration/contextJS.xml" );
		#elseif flash
		var source:String = XmlReader.readXmlFile( "example/configuration/contextFlash.xml" );
		#else
		#error
		#end
		
		this._build( source );
	}
}