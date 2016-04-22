package example;

import hex.ioc.assembler.ApplicationAssembler;
import hex.ioc.parser.xml.ApplicationXMLParser;
import hex.ioc.parser.xml.XMLFileReader;
import hex.log.layout.JavaScriptConsoleLayout;
import hex.log.layout.LogLayoutHTMLView;
import hex.log.layout.LogProxyLayout;
import hex.log.layout.SimpleBrowserLayout;

/**
 * ...
 * @author duke
 */
@:expose("FlickrExample")
class FlickrExample
{
	static var self:FlickrExample;

	static public function main() : Void
	{
		#if debug
		var proxy : LogProxyLayout = new LogProxyLayout();
		var controller = new LogLayoutHTMLView( proxy );
		proxy.addListener( new SimpleBrowserLayout( controller.consoleWrapperTaget ) );
		proxy.addListener( new JavaScriptConsoleLayout() );
		
		//todo zubi why is in debug? - ANSWER: to let the js instantiate when it is on it's correct place
		self = new FlickrExample(); 
		#end
	}
	
	public function new()
	{
		this._build( this._getApplicationXml() );
	}
	
	function _getApplicationXml( ):Xml
	{
		var source = XMLFileReader.readXmlFile( "example/configuration/context.xml" );
		
		return Xml.parse( source );
	}
	
	function _build( xml : Xml ) : Void
	{
		var applicationAssembler = new ApplicationAssembler();
		
		var normalParser : ApplicationXMLParser = new ApplicationXMLParser();
		normalParser.parse( applicationAssembler, xml );
		
		applicationAssembler.buildEverything();
		
		
	}
}