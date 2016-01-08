package awepopunder;

import com.module.stream.player.hlsplayer.IHlsPlayerModule;
import hex.di.IBasicInjector;
import hex.ioc.assembler.ApplicationAssembler;
import hex.ioc.assembler.ApplicationContext;
import hex.ioc.parser.xml.XMLContextParser;
import hex.ioc.parser.xml.XMLParserCollection;
import hex.ioc.parser.xml.XMLParserUtil;
import js.Browser;

import Imports;


/**
 * ...
 * @author duke
 */
class AwePopunder
{
	
	private static var self:AwePopunder;
	
	private var _applicationAssembler:ApplicationAssembler;
	private var _applicationContext:ApplicationContext;
	private var _contextParser:XMLContextParser;
	
	private var _injector:IBasicInjector;

	static public function main() : Void
	{
		self = new AwePopunder(); 
	}
	
	public function new( )
	{
		
		var source:String = XMLParserUtil.getConcatenatedConfig( ["moduleConfig", "serviceConfig", "orderConfig", "viewConfig"] );
		
		var xml : Xml = Xml.parse( source );
		
		this._applicationAssembler 	= new ApplicationAssembler();
		this._applicationContext 	= this._applicationAssembler.getApplicationContext( "applicationContext" );
		
		#if js
		this._applicationAssembler.getBuilderFactory( this._applicationContext ).getCoreFactory().register( "dom", js.Browser.document );
		#end
		
		this._build( xml );
		this._injector = this._applicationContext.getInjector();
	}
	
	private function _build( xml : Xml, applicationContext : ApplicationContext = null ) : Void
	{
		this._contextParser = new XMLContextParser();
		this._contextParser.setParserCollection( new XMLParserCollection() );
		this._contextParser.parse( applicationContext != null ? applicationContext : this._applicationContext, this._applicationAssembler, xml );
		
		this._applicationAssembler.buildEverything();
		
		
	}
	
	public function playStream( ):Void
	{
		var hlsPlayerModule:IHlsPlayerModule = cast this._injector.getInstance(IHlsPlayerModule, "hlsPlayerModule");
		hlsPlayerModule.play();
	}
	
	
	
}