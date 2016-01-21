package awepopunder.module.navigator.controller;
import awepopunder.module.navigator.model.INavigatorModel;
import awepopunder.module.navigator.request.NavigateToRequest;
import haxe.remoting.FlashJsConnection;
import hex.control.Request;
import hex.control.command.BasicCommand;

/**
 * ...
 * @author Chris
 */
@:rtti
class NavigateToCommand  extends BasicCommand
{

	@inject
	public var navigatorModel:INavigatorModel;

	override public function execute(?request:Request):Void 
	{
		//TODO check pageName!		
		var request:NavigateToRequest = cast request;
		
		var params:Map<String,String> = [
			"pageName" => request.pageName,
			"performerName" => navigatorModel.getCurrentPerformerId(),
			"superCategoryName" => "girls",
			
			//NavigatorSettings
			"siteId" => navigatorModel.getNavigatorSettings().site,
			"cobrandId" => navigatorModel.getNavigatorSettings().cobrandId,
			"categoryName" => navigatorModel.getNavigatorSettings().category,
			"params[psid]" => navigatorModel.getNavigatorSettings().psId,
			"params[pstool]" => navigatorModel.getNavigatorSettings().psTool,
			"params[psprogram]" => navigatorModel.getNavigatorSettings().psProgram,
			"params[campaign_id]" => navigatorModel.getNavigatorSettings().campaingId,
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
		#if js
			js.Browser.window.open( url, "_blank" );
		#elseif flash
			flash.net.navigateToURL(new flash.net.URLRequest(url), "_blank");
		#end
		
	}
	
}