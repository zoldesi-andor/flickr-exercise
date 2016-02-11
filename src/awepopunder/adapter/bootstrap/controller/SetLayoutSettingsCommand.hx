package awepopunder.adapter.bootstrap.controller;

import awepopunder.module.layout.ILayoutModule;
import awepopunder.vo.settings.application.InitialApplicationSettingsVO;
import hex.control.Request;
import hex.control.command.BasicCommand;

/**
 * ...
 * @author duke
 */
@:rtti
class SetLayoutSettingsCommand extends BasicCommand
{
	@Inject("name=initialApplicationSettings")
	public var initialApplicationSettings:InitialApplicationSettingsVO;
	
	@Inject("name=layoutModule")
	public var layoutModule:ILayoutModule;

	override public function execute(?request:Request):Void 
	{
		this.layoutModule.setLayoutSettings(this.initialApplicationSettings.layoutSettings);
	}
	
}