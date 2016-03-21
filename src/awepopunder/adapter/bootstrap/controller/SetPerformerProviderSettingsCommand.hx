package awepopunder.adapter.bootstrap.controller;

import awepopunder.module.performerprovider.IPerformerProviderModule;
import awepopunder.vo.settings.application.ApplicationSettingsVO;
import hex.control.command.BasicCommand;
import hex.control.Request;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author duke
 */
class SetPerformerProviderSettingsCommand extends BasicCommand implements ISpeedInjectorContainer
{
	@Inject("performerProviderModule")
	public var performerProviderModule:IPerformerProviderModule;
	
	@Inject
	public var applicationSettings:ApplicationSettingsVO;

	override public function execute(?request:Request):Void 
	{
		this.performerProviderModule.setPerformerSwitchLimits( this.applicationSettings.autoPerformerSwitchLimit, this.applicationSettings.manualPerformerSwitchLimit );
	}
	
}