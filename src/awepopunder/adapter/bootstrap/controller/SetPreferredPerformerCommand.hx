package awepopunder.adapter.bootstrap.controller;

import awepopunder.module.performerprovider.IPerformerProviderModule;
import awepopunder.vo.settings.application.InitialApplicationSettingsVO;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author Chris
 */
@:rtti
class SetPreferredPerformerCommand extends BasicCommand
{
	@Inject("name=performerProviderModule")
	public var performerProviderModule:IPerformerProviderModule;
	
	@Inject("name=initialApplicationSettings")
	public var initialApplicationSettings:InitialApplicationSettingsVO;

	override public function execute(?request:Request):Void 
	{
		this.performerProviderModule.setPreferredPerformer(this.initialApplicationSettings.filterSettings.performerId);
	}
	
}