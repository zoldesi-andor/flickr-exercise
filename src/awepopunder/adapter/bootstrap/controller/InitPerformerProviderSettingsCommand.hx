package awepopunder.adapter.bootstrap.controller;

import awepopunder.module.performerprovider.IPerformerProviderModule;
import awepopunder.vo.settings.application.InitialApplicationSettingsVO;
import hex.control.command.BasicCommand;
import hex.control.Request;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author 
 */
class InitPerformerProviderSettingsCommand extends BasicCommand implements ISpeedInjectorContainer
{
	@Inject("performerProviderModule")
	public var performerProviderModule:IPerformerProviderModule;
	
	@Inject("initialApplicationSettings")
	public var initialApplicationSettings:InitialApplicationSettingsVO;

	override public function execute(?request:Request):Void 
	{
		this.performerProviderModule.setFilterSettings(this.initialApplicationSettings.filterSettings, this.initialApplicationSettings.siteSettings.site);
	}
	
}