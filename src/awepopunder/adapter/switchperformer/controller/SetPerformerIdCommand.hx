package awepopunder.adapter.switchperformer.controller;
import awepopunder.module.navigator.INavigatorModule;
import awepopunder.vo.performer.PerformerDataVO;
import haxe.web.Request;
import hex.control.command.BasicCommand;

/**
 * ...
 * @author Chris
 */
@:rtti
class SetPerformerIdCommand extends BasicCommand
{
	@inject("name=navigatorModule")
	public var navigator:INavigatorModule;
	
	@inject
	public var performerData:PerformerDataVO;

	override public function execute(?request:Request):Void 
	{
		this.navigator.setCurrentPerformer(this.performerData.performerId);
	}
	
}