package awepopunder.module.navigator.controller;
import awepopunder.module.navigator.model.INavigatorModel;
import awepopunder.module.navigator.constant.TargetPage;
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
		var request:NavigateToRequest = cast request;
		var pageName:String = TargetPage.HOME;
		var validPageNames:Array<String> = [
			TargetPage.CHAT_ROOM,
			TargetPage.HOME,
			TargetPage.LISTPAGE,
			TargetPage.LOGIN,
			TargetPage.POLICY,
			TargetPage.RANDOM_CHAT,
			TargetPage.SIGNUP,
			TargetPage.TERMS
		];
		
		if ( validPageNames.indexOf(request.pageName) != -1) {
			pageName = request.pageName;
		}
		
		var params:Map<String,String> = [
			"pageName" => pageName,
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