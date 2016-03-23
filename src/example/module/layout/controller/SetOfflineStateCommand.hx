package example.module.layout.controller;

import example.module.layout.model.ILayoutModel;
import hex.control.command.BasicCommand;
import hex.control.Request;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author duke
 */
class SetOfflineStateCommand extends BasicCommand implements ISpeedInjectorContainer
{
	@Inject
	public var model:ILayoutModel;

	override public function execute(?request:Request):Void 
	{
		#if debug
		hex.log.Logger.DEBUG("awepopunder.module.layout.controller.SetOfflineStateCommand");
		#end
		this.model.setOffline();
	}
	
}