package awepopunder.adapter.bootstrap.controller;

import awepopunder.module.layout.ILayoutModule;
import awepopunder.vo.settings.application.InitialApplicationSettingsVO;
import hex.control.Request;
import hex.control.command.BasicCommand;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author duke
 */
class SetLayoutSettingsCommand extends BasicCommand implements ISpeedInjectorContainer
{
	@Inject("initialApplicationSettings")
	public var initialApplicationSettings:InitialApplicationSettingsVO;
	
	@Inject("layoutModule")
	public var layoutModule:ILayoutModule;

	override public function execute(?request:Request):Void 
	{
		this.layoutModule.setLayoutSettings(this.initialApplicationSettings.layoutSettings);
	}
	
}