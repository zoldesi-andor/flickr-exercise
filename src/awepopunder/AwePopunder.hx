package awepopunder;

import awepopunder.parser.settings.application.InitialApplicationSettingsParser;
import awepopunder.vo.settings.application.InitialApplicationSettingsVO;
import com.module.stream.player.hlsplayer.IHlsPlayerModule;
import haxe.Json;
import hex.di.IBasicInjector;
import hex.ioc.assembler.ApplicationAssembler;
import hex.ioc.assembler.ApplicationContext;
import hex.ioc.parser.xml.XMLContextParser;
import hex.ioc.parser.xml.XMLParserCollection;
import hex.ioc.parser.xml.XMLParserUtil;
import js.Browser;

import Imports;

/**
 * TODO:
 * kapcsolodasi url-ek servicetol

http://promo.awempire.com/live_feeds/get_settings_base.php?rnd=0%2E9248302686028183&cobrandId=&language=en&site=jasmin&type=popunder
max beagyazasi szam

wowza elso kepkocka utana pending?

maxJSReloadCount: hanyszor lehet next modelre nyomni manualisan mielott atiranyitana

alkalmazas tudja ertesiteni bizonyos esemenyekrol a kornyezetet.

http://promo.awempire.com/live_feeds/get_performer_base.php?rnd=0%2E15331116737797856&streamData=1&category=girl&tid=kontx_w2_girl_teen&banList=&proxy=1&site=jasmin

nyelvesites

ha stream nem megy (vagy leall) akkor next performer

wait for focus egyelore nem kell


random modellek next perffel, vagy egy fix modell es ha nincs online akkor offline status
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
	private var _contextParser:XMLContextParser;
	
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
		
		var source:String = XMLParserUtil.getConcatenatedConfig( ["moduleConfig", "serviceConfig", "orderConfig", "viewConfig"] );
		
		var xml : Xml = Xml.parse( source );
		
		this._applicationAssembler 	= new ApplicationAssembler();
		this._applicationContext 	= this._applicationAssembler.getApplicationContext( "applicationContext" );
		this._injector = this._applicationContext.getInjector();
		
		//TODO: inject by subparts instead of a big stuff or inject into commands by parts
		this._injector.mapToValue( InitialApplicationSettingsVO, initialApplicationSettings, "initialApplicationSettings" );
		
		#if js
		this._applicationAssembler.getBuilderFactory( this._applicationContext ).getCoreFactory().register( "dom", js.Browser.document.getElementById(initialApplicationSettings.layoutSettings.rootElementId) );
		#end
		
		this._build( xml );
		
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