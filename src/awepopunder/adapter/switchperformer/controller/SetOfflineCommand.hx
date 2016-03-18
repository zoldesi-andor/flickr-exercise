package awepopunder.adapter.switchperformer.controller;

import awepopunder.module.layout.ILayoutModule;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author 
 */
@:rtti
class SetOfflineCommand extends BasicCommand
{
	@Inject("name=layoutModule")
	public var layoutModule:ILayoutModule;

	override public function execute(?request:Request):Void 
	{
		#if debug
		hex.log.Logger.DEBUG("SetOfflineCommand.execute");
		#end
		
		this.layoutModule.setOffline();
	}
	
}