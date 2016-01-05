package awepopunder.adapter.bootstrap.controller;

import awepopunder.module.layout.ILayoutModule;
import hex.control.command.BasicCommand;
import hex.event.IEvent;

/**
 * ...
 * @author 
 */
@:rtti
class SetOnlineCommand extends BasicCommand
{
	@inject("name=layoutModule")
	public var layoutModule:ILayoutModule;

	override public function execute(?e:IEvent):Void 
	{
		this.layoutModule.setOnline();
	}
	
}