package awepopunder.module.navigator.controller;
import awepopunder.module.navigator.model.INavigatorModel;
import awepopunder.module.navigator.request.NavigateToRequest;
import haxe.web.Request;

/**
 * ...
 * @author Chris
 */
@:rtti
class NavigateToCommand
{

	@inject
	public var navigatorModel:INavigatorModel;

	override public function execute(?request:Request):Void 
	{
		var request:NavigateToRequest = cast request;
		
		var params:Map<String,String> = [
			"pageName" => request.pageName,
			
			"siteId" => navigatorModel.getNavigatorSettings().site,
			"cobrandId" => navigatorModel.getNavigatorSettings().cobrandId,
			
			"superCategoryName" => "girls",
			"categoryName" => navigatorModel.getNavigatorSettings().category,
			
			"performerName" => navigatorModel.getCurrentPerformerId(),
			
			"params[psid]" => navigatorModel.getNavigatorSettings().psId,
			"params[pstool]" => navigatorModel.getNavigatorSettings().psTool,
			"params[psprogram]" => navigatorModel.getNavigatorSettings().psProgram,
			"params[campaign_id]" => navigatorModel.getNavigatorSettings().campaignId,
			"subAffId" => navigatorModel.getNavigatorSettings().subAffId,
		];
		
		var validParams:Array<String> = [];
		
		for (key in params.keys()) {
			if (params[key] != null) {
				validParams.push( key + "=" + params[key] );
			}
		}
		
		var url:String = "http://jmp.awempire.com/?" + validParams.join('&');
		trace("Navigate To:", url);
		//navigate url;
		
	}
	
}