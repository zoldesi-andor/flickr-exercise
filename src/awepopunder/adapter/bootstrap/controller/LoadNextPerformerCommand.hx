package awepopunder.adapter.bootstrap.controller;

import awepopunder.module.performerprovider.IPerformerProviderModule;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author 
 */
@:rtti
class LoadNextPerformerCommand extends BasicCommand
{
	@inject("name=performerProviderModule")
	public var performerProviderModule:IPerformerProviderModule;

	override public function execute(?request:Request):Void 
	{
		this.performerProviderModule.loadNextPerformer();
	}
	
}