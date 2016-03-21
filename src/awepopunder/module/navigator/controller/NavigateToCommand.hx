package awepopunder.module.navigator.controller;

import awepopunder.module.navigator.constant.TargetPage;
import awepopunder.module.navigator.model.INavigatorModel;
import awepopunder.module.navigator.parser.JumpSiteParameterParser;
import awepopunder.module.navigator.request.NavigateToRequest;
import awepopunder.module.navigator.vo.JumpSiteParametersVO;
import hex.control.Request;
import hex.control.command.BasicCommand;
import hex.core.IAnnotationParsable;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author Chris
 */
class NavigateToCommand  extends BasicCommand implements IAnnotationParsable implements ISpeedInjectorContainer
{
	@Inject
	public var navigatorModel:INavigatorModel;
	
	@Url("jumpSite")
	public var jumpSiteUrl:String;

	override public function execute(?request:Request):Void 
	{
		var request:NavigateToRequest = cast request;
		var pageName:String = TargetPage.HOME;
		
		if ( TargetPage.validPageNames.indexOf(request.pageName) != -1) {
			pageName = request.pageName;
		}
		
		var jumpSiteParameters = new JumpSiteParametersVO();
		jumpSiteParameters.pageName = pageName;
		jumpSiteParameters.performerId =  this.navigatorModel.getCurrentPerformerId();
		//TODO: Add superCategory handling.
		//jumpSiteParameters.superCategory = "girls";
		jumpSiteParameters.navigatorSettings = this.navigatorModel.getNavigatorSettings();
		
		var jumpSiteParameterParser = new JumpSiteParameterParser();
		var parameters:String = jumpSiteParameterParser.parseSettings( jumpSiteParameters );
		
		var url:String = this.jumpSiteUrl + "?" + parameters;
		
		#if debug
		hex.log.Logger.DEBUG("NavigateToCommand url: " + url);
		#end
		#if js
			js.Browser.window.open( url, "_blank" );
		#elseif flash
			flash.net.navigateToURL(new flash.net.URLRequest(url), "_blank");
		#end
		
	}
	
}