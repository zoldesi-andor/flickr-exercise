package awepopunder.parser.settings.application;

import awepopunder.module.layout.constant.ChatMode;
import awepopunder.module.layout.constant.LayoutMode;
import awepopunder.vo.settings.application.FilterSettingsVO;
import awepopunder.vo.settings.application.InitialApplicationSettingsVO;
import awepopunder.vo.settings.application.LayoutSettingsVO;
import awepopunder.vo.settings.application.PromoInfoSettingsVO;
import awepopunder.vo.settings.application.SiteSettingsVO;
import haxe.Json;
import hex.data.IParser;

/**
 * ...
 * @author duke
 */
class InitialApplicationSettingsParser implements IParser
{

	public function new() 
	{
		
	}
	
	public function parseSettings( settings:Dynamic ):InitialApplicationSettingsVO
	{
		return cast this.parse(settings);
	}
	
	public function parse(serializedContent:Dynamic, target:Dynamic = null):Dynamic 
	{
		var data:Dynamic = serializedContent;
		
		var result:InitialApplicationSettingsVO = new InitialApplicationSettingsVO();
		
		result.layoutSettings = this._parseLayout( data.layout );
		result.siteSettings = this._parseSiteSettings( data.site );
		result.filterSettings = this._parseFilterSettings( data.filter );
		result.promoInfoSettings = this._parsePromoInfoSettings( data.promoInfo );
		
		return result;
	}
	
	function _parseFilterSettings( data:Dynamic ) : FilterSettingsVO
	{
		var result:FilterSettingsVO = new FilterSettingsVO( );
		
		result.category = data.category;
		result.performerId = data.performerId;
		result.forcePerformer = data.forcePerformer;
		result.templateId = data.templateId;
		
		return result;
	}
	
	function _parseSiteSettings( data:Dynamic ) : SiteSettingsVO
	{
		var result:SiteSettingsVO = new SiteSettingsVO( );
		
		result.cobrandId = data.cobrandId;
		result.language = data.language;
		result.site = data.site;
		result.sessionId = data.sessionId;
		
		return result;
	}
	
	function _parsePromoInfoSettings( data:Dynamic ) : PromoInfoSettingsVO
	{
		var result:PromoInfoSettingsVO = new PromoInfoSettingsVO( );
		
		result.psId = data.psId;
		result.psTool = data.psTool;
		result.psProgram = data.psProgram;
		result.campaingId = data.campaingId;
		result.subAffiliateId = data.subAffiliateId;
		
		return result;
	}
	
	function _parseLayout( data:Dynamic ) : LayoutSettingsVO
	{
		var result:LayoutSettingsVO = new LayoutSettingsVO();
		
		if ( data )
		{
			result.rootElementId = data.rootElementId;
			result.backgroundColor = ~/$^#[0-9a-zA-F]{3,6}$/.match(data.backgroundColor) ? data.backgroundColor : null;
			
			switch ( data.chatMode )
			{
				case "alwaysOn": result.chatMode = ChatMode.AlwaysOn;
				case "hidden": result.chatMode = ChatMode.Hidden;
				default: result.chatMode = ChatMode.AlwaysOn;
			}
			
			switch ( data.layoutMode )
			{
				case "inFrame": result.layoutMode = LayoutMode.InFrame;
				case "outFrame": result.layoutMode = LayoutMode.OutFrame;
				default: result.layoutMode = LayoutMode.InFrame;
			}
			
			result.width = Std.parseInt(data.width);
			result.height = Std.parseInt(data.height);
		}
		
		return result;
	}
	
}