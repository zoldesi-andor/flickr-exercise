package awepopunder.module.layout.controller;

import awepopunder.module.layout.model.ILayoutModel;
import hex.control.command.BasicCommand;
import hex.event.IEvent;

/**
 * ...
 * @author duke
 */
@:rtti
class SetOfflineStateCommand extends BasicCommand
{
	@inject
	public var model:ILayoutModel;

	override public function execute(?e:IEvent):Void 
	{
		this.model.setOffline();
	}
	
}