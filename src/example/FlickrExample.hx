package example;

import hex.di.IBasicInjector;
import hex.ioc.assembler.AbstractApplicationContext;
import hex.ioc.assembler.ApplicationAssembler;
import hex.ioc.core.CoreFactory;
import hex.ioc.parser.xml.ApplicationXMLParser;
import hex.ioc.parser.xml.XMLFileReader;
import hex.ioc.parser.xml.XMLParserUtil;
import hex.log.layout.JavaScriptConsoleLayout;
import hex.log.layout.LogLayoutHTMLView;
import hex.log.layout.LogProxyLayout;
import hex.log.layout.SimpleBrowserLayout;
import hex.log.layout.TraceLayout;
import example.view.photo.PhotoView;
import hex.log.Logger;

/**
 * ...
 * @author duke
 */
@:expose("FlickrExample")
class FlickrExample
{
	static var self:FlickrExample;
	
	var _applicationAssembler:ApplicationAssembler;
	var _applicationContext:AbstractApplicationContext;
	
	var _injector:IBasicInjector;

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
		
		// source = XMLParserUtil.getConcatenatedConfig( [viewConfigName, "moduleConfig", "serviceConfig", "orderConfig"], "flickr" );
		// source = haxe.Resource.getString("context"); 
		source = XMLFileReader.readXmlFile( "example/configuration/context.xml" );
		return Xml.parse( source );
	}
	
	function _init():Void
	{
		CoreFactory.setFastEvalMethod(com.util.ObjectUtil.fastEvalFromTarget);
		
		this._applicationAssembler 	= new ApplicationAssembler();
		this._applicationContext = this._applicationAssembler.getApplicationContext("flickr");
		this._injector = this._applicationContext.getBasicInjector();
	}
	
	
	function _registerView():Void
	{
		#if js
		this._applicationAssembler.getBuilderFactory( this._applicationContext ).getCoreFactory().register( "appRoot", js.Browser.document.getElementById("app") );
		var result:Array<Dynamic> = riot.Riot.mount("#app", "photo");
		Logger.DEBUG(result);
		this._applicationAssembler.getBuilderFactory( this._applicationContext ).getCoreFactory().register( "riotRoot", {layout: result[0]} );
		#end
	}
	
	function _build( xml : Xml ) : Void
	{
		var normalParser : ApplicationXMLParser = new ApplicationXMLParser();
		normalParser.parse( this._applicationAssembler, xml );
		
		this._applicationAssembler.buildEverything();
	}
}