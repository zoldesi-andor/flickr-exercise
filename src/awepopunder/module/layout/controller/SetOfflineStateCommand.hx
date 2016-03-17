package awepopunder.module.layout.controller;

import awepopunder.module.layout.model.ILayoutModel;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author duke
 */
@:rtti
class SetOfflineStateCommand extends BasicCommand
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