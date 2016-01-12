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
	@inject
	public var model:ILayoutModel;

	override public function execute(?request:Request):Void 
	{
		this.model.setOffline();
	}
	
}