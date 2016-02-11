package awepopunder.parser.settings.application;

import awepopunder.vo.settings.application.StreamSettingsVO;
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
		
		var result = new InitialApplicationSettingsVO();
		
		result.layoutSettings = this._parseLayout( data.layout );
		result.siteSettings = this._parseSiteSettings( data.site );
		result.filterSettings = this._parseFilterSettings( data.filter );
		result.promoInfoSettings = this._parsePromoInfoSettings( data.promoInfo );
		result.streamSettings = this._parseStreamSettings( data.stream );

		return result;
	}
	
	function _parseFilterSettings( data:Dynamic ) : FilterSettingsVO
	{
		var result = new FilterSettingsVO( );
		
		result.category = data.category;
		result.preferredPerformerId = data.preferredPerformerId;
		result.forcePerformer = data.forcePerformer;
		result.templateId = data.templateId;
		
		return result;
	}
	
	function _parseSiteSettings( data:Dynamic ) : SiteSettingsVO
	{
		var result = new SiteSettingsVO( );
		
		result.cobrandId = data.cobrandId;
		result.language = data.language;
		result.site = data.site;
		result.sessionId = data.sessionId;
		
		return result;
	}
	
	function _parsePromoInfoSettings( data:Dynamic ) : PromoInfoSettingsVO
	{
		var result = new PromoInfoSettingsVO( );
		
		result.psId = data.psId;
		result.psTool = data.psTool;
		result.psProgram = data.psProgram;
		result.campaingId = data.campaingId;
		result.subAffiliateId = data.subAffiliateId;
		
		return result;
	}
	
	function _parseLayout( data:Dynamic ) : LayoutSettingsVO
	{
		var result = new LayoutSettingsVO();

		if ( data )
		{
			result.rootElementId = data.rootElementId;

			switch ( data.chatMode )
			{
				case "alwaysOn": result.chatMode = ChatMode.AlwaysOn;
				case "none": result.chatMode = ChatMode.None;
				case "hidden": result.chatMode = ChatMode.Hidden;
				default: result.chatMode = ChatMode.AlwaysOn;
			}

			switch ( data.layoutMode )
			{
				case "outFrame": result.layoutMode = LayoutMode.OutFrame;
				default: result.layoutMode = LayoutMode.OutFrame;
			}
		}

		return result;
	}

	function _parseStreamSettings( data:Dynamic ) : StreamSettingsVO
	{
		var result = new StreamSettingsVO( );

		result.muted = data.muted == true ? true : false;
		result.autoPlay = data.autoPlay == true ? true : false;

		return result;
	}
	
}