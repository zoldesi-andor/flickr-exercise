package awepopunder.module.navigator.controller;
import awepopunder.module.navigator.model.INavigatorModel;
import awepopunder.module.navigator.constant.TargetPage;
import awepopunder.module.navigator.parser.JumpSiteParameterParser;
import awepopunder.module.navigator.request.NavigateToRequest;
import awepopunder.module.navigator.vo.JumpSiteParametersVO;
import haxe.remoting.FlashJsConnection;
import hex.control.Request;
import hex.control.command.BasicCommand;
import hex.core.IAnnotationParsable;

/**
 * ...
 * @author Chris
 */
@:rtti
class NavigateToCommand  extends BasicCommand implements IAnnotationParsable
{
	@inject
	public var navigatorModel:INavigatorModel;
	
	@url("jumpSite")
	public var jumpSiteUrl:String;

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
		
		var jumpSiteParameters:JumpSiteParametersVO = new JumpSiteParametersVO();
		jumpSiteParameters.pageName = pageName;
		jumpSiteParameters.performerId =  navigatorModel.getCurrentPerformerId();
		jumpSiteParameters.superCategory = "girls";
		jumpSiteParameters.navigatorSettings = navigatorModel.getNavigatorSettings();
		
		var jumpSiteParameterParser:JumpSiteParameterParser = new JumpSiteParameterParser();
		var parameters:String = jumpSiteParameterParser.parseSettings( jumpSiteParameters );
		
		var url:String = this.jumpSiteUrl + "?" + parameters;
		
		trace("Navigate To:", url);
		#if js
			js.Browser.window.open( url, "_blank" );
		#elseif flash
			flash.net.navigateToURL(new flash.net.URLRequest(url), "_blank");
		#end
		
	}
	
}