package example;

import com.module.stream.player.hlsplayer.IHlsPlayerModule;
import hex.di.IBasicInjector;
import hex.ioc.assembler.AbstractApplicationContext;
import hex.ioc.assembler.ApplicationAssembler;
import hex.ioc.parser.xml.ApplicationXMLParser;
import hex.ioc.parser.xml.XMLFileReader;
import hex.ioc.parser.xml.XMLParserUtil;
import hex.log.layout.JavaScriptConsoleLayout;
import hex.log.layout.LogLayoutHTMLView;
import hex.log.layout.LogProxyLayout;
import hex.log.layout.SimpleBrowserLayout;
import hex.log.layout.TraceLayout;

/**
 * ...
 * @author duke
 */
@:expose("FlickerExample")
class FlickerExample
{
	#if js
	static var imports:Imports;
	#end
	
	static var self:FlickerExample;
	
	var _applicationAssembler:ApplicationAssembler;
	var _applicationContext:AbstractApplicationContext;
	
	var _injector:IBasicInjector;

	static public function main() : Void
	{
		#if debug
		var proxy : LogProxyLayout = new LogProxyLayout();
		var controller = new LogLayoutHTMLView( proxy );
		proxy.addListener( new SimpleBrowserLayout( controller.consoleWrapperTaget ) );
		proxy.addListener( new TraceLayout() );
		proxy.addListener( new JavaScriptConsoleLayout() );
		
		//todo zubi why is in debug? - ANSWER: to let the js instantiate when it is on it's correct place
		self = new FlickerExample(); 
		#end
	}
	
	public function new()
	{
		this._init();
		
		this._registerView();
		
		this._build( this._getApplicationXml() );
	}
	
	function _getApplicationXml( ):Xml
	{
		var source:String = "";
		var viewConfigName:String = "";
		
		#if js
		viewConfigName = "viewConfigJS";
		#end
		
		/*var source = 

		return Xml.parse( source );*/
		
		source = XMLParserUtil.getConcatenatedConfig( [viewConfigName, "moduleConfig", "serviceConfig", "orderConfig"], "awePopunder" );
		
		return Xml.parse( source );
	}
	
	function _init():Void
	{
		this._applicationAssembler 	= new ApplicationAssembler();
		this._applicationContext = this._applicationAssembler.getApplicationContext("flicker");
		this._injector = this._applicationContext.getBasicInjector();
	}
	
	
	function _registerView():Void
	{
		#if js
		this._applicationAssembler.getBuilderFactory( this._applicationContext ).getCoreFactory().register( "dom", js.Browser.document.getElementById("app") );
		#end
	}
	
	function _build( xml : Xml ) : Void
	{
		var normalParser : ApplicationXMLParser = new ApplicationXMLParser();
		normalParser.parse( this._applicationAssembler, xml );
		
		this._applicationAssembler.buildEverything();
	}
}