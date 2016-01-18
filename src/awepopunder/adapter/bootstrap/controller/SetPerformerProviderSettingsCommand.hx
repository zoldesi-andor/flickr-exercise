package awepopunder.adapter.bootstrap.controller;

import awepopunder.module.performerprovider.IPerformerProviderModule;
import awepopunder.vo.settings.application.ApplicationSettingsVO;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author duke
 */
@:rtti
class SetPerformerProviderSettingsCommand extends BasicCommand
{
	@inject("name=performerProviderModule")
	public var performerProviderModule:IPerformerProviderModule;
	
	@inject
	public var applicationSettings:ApplicationSettingsVO;

	override public function execute(?request:Request):Void 
	{
		this.performerProviderModule.setPerformerSwitchLimits( this.applicationSettings.autoPerformerSwitchLimit, this.applicationSettings.manualPerformerSwitchLimit );
	}
	
}