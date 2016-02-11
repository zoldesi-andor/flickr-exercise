package awepopunder.adapter.switchperformer.controller;
import awepopunder.module.navigator.INavigatorModule;
import awepopunder.vo.performer.PerformerDataVO;
import hex.control.Request;
import hex.control.command.BasicCommand;

/**
 * ...
 * @author Chris
 */
@:rtti
class SetPerformerIdCommand extends BasicCommand
{
	@Inject("name=navigatorModule")
	public var navigator:INavigatorModule;
	
	@Inject
	public var performerData:PerformerDataVO;

	override public function execute(?request:Request):Void 
	{
		this.navigator.setCurrentPerformer(this.performerData.performerId);
	}
	
}