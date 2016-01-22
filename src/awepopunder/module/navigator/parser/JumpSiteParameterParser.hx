package awepopunder.module.navigator.parser;
import awepopunder.module.navigator.vo.JumpSiteParametersVO;
import awepopunder.module.navigator.vo.NavigatorSettingsVO;
import hex.data.IParser;

/**
 * ...
 * @author Chris
 */
class JumpSiteParameterParser implements IParser
{

	public function new() 
	{
		
	}
	
	public function parseSettings( settings:Dynamic ):String
	{
		return cast this.parse(settings);
	}
	
	public function parse(serializedContent:Dynamic, target:Dynamic = null):Dynamic 
	{
		var data:JumpSiteParametersVO = serializedContent;
		
		var params:Map<String,String> = [
			"pageName" => data.pageName,
			"performerName" => data.performerId,
			"superCategoryName" => data.superCategory,
			
			//NavigatorSettings
			"siteId" => data.navigatorSettings.site,
			"cobrandId" => data.navigatorSettings.cobrandId,
			"categoryName" => data.navigatorSettings.category,
			"params[psid]" => data.navigatorSettings.psId,
			"params[pstool]" => data.navigatorSettings.psTool,
			"params[psprogram]" => data.navigatorSettings.psProgram,
			"params[campaign_id]" => data.navigatorSettings.campaingId,
			"subAffId" => data.navigatorSettings.subAffiliateId,
		];
		
		var result:String = this._validateParameters(params);
		
		return result;
	}
	
	function _validateParameters(params:Map<String,String>):String
	{
		var result:Array<String> = [];
		for (key in params.keys()) {
			if (params[key] != null && params[key] != "") {
				result.push( key + "=" + params[key] );
			}
		}
		
		return result.join('&');
	}
	
	
	
}