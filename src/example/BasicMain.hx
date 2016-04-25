package example;

import hex.ioc.assembler.ApplicationAssembler;
import hex.ioc.parser.xml.ApplicationXMLParser;
import hex.log.layout.LogProxyLayout;

/**
 * ...
 * @author ali_o_kan - Laurent Deketelaere
 */
class BasicMain
{
	var _applicationAssembler:hex.ioc.assembler.ApplicationAssembler;
	
	public function new() 
	{
		this._initLogger();
	}
	
	function _initLogger() : Void
	{
		var proxy : LogProxyLayout = new LogProxyLayout();
		#if js
		var controller = new hex.log.layout.LogLayoutHTMLView( proxy );
		proxy.addListener( new hex.log.layout.SimpleBrowserLayout( controller.consoleWrapperTaget ) );
		proxy.addListener( new hex.log.layout.JavaScriptConsoleLayout() );
		#elseif flash
		proxy.addListener( new hex.log.layout.TraceLayout() );
		#end
	}
	
	function _build( xmlSource : String ) : Void
	{
		var xml:Xml = Xml.parse( xmlSource );
		this._applicationAssembler = new ApplicationAssembler();
		
		var normalParser : ApplicationXMLParser = new ApplicationXMLParser();
		normalParser.parse( this._applicationAssembler, xml );
		
		this._applicationAssembler.buildEverything();
	}
	
	function _register( element:Dynamic, id:String ):Void
	{
		this._applicationAssembler.getApplicationContext("flickr").getCoreFactory().register( id, element );
	}
}