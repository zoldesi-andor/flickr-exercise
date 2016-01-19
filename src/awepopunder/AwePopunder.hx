package awepopunder;

import awepopunder.parser.settings.application.InitialApplicationSettingsParser;
import awepopunder.vo.settings.application.InitialApplicationSettingsVO;
import com.module.stream.player.hlsplayer.IHlsPlayerModule;
import haxe.Json;
import hex.di.IBasicInjector;
import hex.ioc.assembler.ApplicationAssembler;
import hex.ioc.assembler.ApplicationContext;
import hex.ioc.parser.xml.ApplicationContextXMLParser;
import hex.ioc.parser.xml.ApplicationXMLParser;
import hex.ioc.parser.xml.XMLParserCollection;
import hex.ioc.parser.xml.XMLParserUtil;
import js.Browser;

import Imports;

/**
 * TODO: JEGYZET

wowza elso kepkocka utana pending?


wait for focus egyelore nem kell
 * 
 */


/**
 * ...
 * @author duke
 */
class AwePopunder
{
	
	private static var self:AwePopunder;
	
	private var _applicationAssembler:ApplicationAssembler;
	private var _applicationContext:ApplicationContext;
	private var _applicationXMLParser:ApplicationXMLParser;
	
	private var _injector:IBasicInjector;

	static public function main() : Void
	{
		#if debug
		self = new AwePopunder( Json.parse(haxe.Resource.getString("initialConfig")) ); 
		#end
	}
	
	public function new( config:Dynamic )
	{
		var initialApplicationSettingsParser:InitialApplicationSettingsParser = new InitialApplicationSettingsParser();
		var initialApplicationSettings:InitialApplicationSettingsVO = initialApplicationSettingsParser.parseSettings( config );
		
		var source:String = XMLParserUtil.getConcatenatedConfig( ["moduleConfig", "serviceConfig", "orderConfig", "viewConfig"], "awePopunder" );
		
		var xml : Xml = Xml.parse( source );
		
		this._applicationAssembler 	= new ApplicationAssembler();
		this._applicationContext = this._applicationAssembler.getApplicationContext("awePopunder");
		
		this._injector = this._applicationContext.getInjector();
		this._injector.mapToValue( InitialApplicationSettingsVO, initialApplicationSettings, "initialApplicationSettings" );
		
		#if js
		this._applicationAssembler.getBuilderFactory( this._applicationContext ).getCoreFactory().register( "dom", js.Browser.document.getElementById(initialApplicationSettings.layoutSettings.rootElementId) );
		#end
		
		this._build( xml );
		
	}
	
	private function _build( xml : Xml ) : Void
	{
		this._applicationXMLParser = new ApplicationXMLParser();
		this._applicationXMLParser.parse( this._applicationAssembler, xml );
		
		this._applicationAssembler.buildEverything();
		
		
	}
	
	public function playStream( ):Void
	{
		var hlsPlayerModule:IHlsPlayerModule = cast this._injector.getInstance(IHlsPlayerModule, "hlsPlayerModule");
		hlsPlayerModule.play();
	}
	
	
	
}