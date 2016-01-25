package awepopunder.adapter.bootstrap.controller;
import awepopunder.module.navigator.INavigatorModule;
import awepopunder.module.navigator.vo.NavigatorSettingsVO;
import awepopunder.vo.settings.application.InitialApplicationSettingsVO;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author Chris
 */
@:rtti
class InitNavigatorSettingsCommand extends BasicCommand
{

	@inject("name=navigatorModule")
	public var navigatorModule:INavigatorModule;
	
	@inject("name=initialApplicationSettings")
	public var initialApplicationSettings:InitialApplicationSettingsVO;

	override public function execute(?request:Request):Void 
	{
		var navigatorSettings:NavigatorSettingsVO = new NavigatorSettingsVO();
				
		navigatorSettings.site = this.initialApplicationSettings.siteSettings.site;
		navigatorSettings.cobrandId = this.initialApplicationSettings.siteSettings.cobrandId;
		navigatorSettings.category = this.initialApplicationSettings.filterSettings.category;
		navigatorSettings.psId = this.initialApplicationSettings.promoInfoSettings.psId;
		navigatorSettings.psTool = this.initialApplicationSettings.promoInfoSettings.psTool;
		navigatorSettings.psProgram = this.initialApplicationSettings.promoInfoSettings.psProgram;
		navigatorSettings.campaingId = this.initialApplicationSettings.promoInfoSettings.campaingId;
		navigatorSettings.subAffiliateId = this.initialApplicationSettings.promoInfoSettings.subAffiliateId;
		
		this.navigatorModule.setNavigatorSettings(navigatorSettings);
	}
	
}