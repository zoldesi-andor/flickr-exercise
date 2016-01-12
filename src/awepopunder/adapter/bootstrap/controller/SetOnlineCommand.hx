package awepopunder.adapter.bootstrap.controller;

import awepopunder.module.layout.ILayoutModule;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author 
 */
@:rtti
class SetOnlineCommand extends BasicCommand
{
	@inject("name=layoutModule")
	public var layoutModule:ILayoutModule;

	override public function execute(?request:Request):Void 
	{
		this.layoutModule.setOnline();
	}
	
}