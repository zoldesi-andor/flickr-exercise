package example;

import hex.ioc.assembler.ApplicationAssembler;
import hex.ioc.parser.xml.ApplicationXMLParser;
import hex.ioc.parser.xml.XMLFileReader;
import hex.log.layout.LogProxyLayout;

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
		#if js
		var controller = new hex.log.layout.LogLayoutHTMLView( proxy );
		proxy.addListener( new hex.log.layout.SimpleBrowserLayout( controller.consoleWrapperTaget ) );
		proxy.addListener( new hex.log.layout.JavaScriptConsoleLayout() );
		#elseif flash
		proxy.addListener( new hex.log.layout.TraceLayout() );
		#end
		
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