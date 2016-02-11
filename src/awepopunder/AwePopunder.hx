package awepopunder;

import awepopunder.parser.settings.application.InitialApplicationSettingsParser;
import awepopunder.vo.settings.application.InitialApplicationSettingsVO;
import com.module.stream.player.hlsplayer.IHlsPlayerModule;
import hex.di.IBasicInjector;
import hex.ioc.assembler.ApplicationAssembler;
import hex.ioc.assembler.ApplicationContext;
import hex.ioc.parser.xml.ApplicationXMLParser;
import hex.ioc.parser.xml.XMLParserUtil;




/**
 * ...
 * @author duke
 */
@:expose("AwePopunder")
class AwePopunder
{
	#if js
	static var imports:Imports;
	#end
	
	static var self:AwePopunder;
	
	var _applicationAssembler:ApplicationAssembler;
	var _applicationContext:ApplicationContext;
	var _applicationXMLParser:ApplicationXMLParser;
	
	var _injector:IBasicInjector;
	var _initialApplicationSettings:InitialApplicationSettingsVO;

	static public function main() : Void
	{
		#if debug
			self = new AwePopunder( DebugConfig.config ); 
		#end
	}
	
	public function new( config:Dynamic )
	{
		var source:String = XMLParserUtil.getConcatenatedConfig( ["moduleConfig", "serviceConfig", "orderConfig", "viewConfig"], "awePopunder" );
		
		var xml : Xml = Xml.parse( source );
		
		this._init( );
		
		this._setInitialApplicationSettings( config );
		
		this._registerView( );
		
		this._build( xml );
		
	}
	
	function _init():Void
	{
		this._applicationAssembler 	= new ApplicationAssembler();
		this._applicationContext = this._applicationAssembler.getApplicationContext("awePopunder");
		this._injector = this._applicationContext.getBasicInjector();
		this._applicationXMLParser = new ApplicationXMLParser();
	}
	
	function _setInitialApplicationSettings(config:Dynamic):Void
	{
		var initialApplicationSettingsParser = new InitialApplicationSettingsParser();
		this._initialApplicationSettings = initialApplicationSettingsParser.parseSettings( config );
		this._injector.mapToValue( InitialApplicationSettingsVO, this._initialApplicationSettings, "initialApplicationSettings" );
		
		this._applicationAssembler.addConditionalProperty( ["useHlsJs" => this._initialApplicationSettings.streamSettings.useHlsJs] );
	}
	
	function _registerView():Void
	{
		#if js
		this._applicationAssembler.getBuilderFactory( this._applicationContext ).getCoreFactory().register( "dom", js.Browser.document.getElementById(this._initialApplicationSettings.layoutSettings.rootElementId) );
		#end
	}
	
	function _build( xml : Xml ) : Void
	{
		this._applicationXMLParser.parse( this._applicationAssembler, xml );
		
		this._applicationAssembler.buildEverything();
	}
	
	public function playStream( ):Void
	{
		var hlsPlayerModule:IHlsPlayerModule = cast this._injector.getInstance(IHlsPlayerModule, "hlsPlayerModule");
		hlsPlayerModule.play();
	}
	
	
	
}