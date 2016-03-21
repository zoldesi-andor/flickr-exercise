package awepopunder.adapter.switchperformer.controller;
import awepopunder.module.navigator.INavigatorModule;
import awepopunder.vo.performer.PerformerDataVO;
import hex.control.Request;
import hex.control.command.BasicCommand;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author Chris
 */
class SetPerformerIdCommand extends BasicCommand implements ISpeedInjectorContainer
{
	@Inject("navigatorModule")
	public var navigator:INavigatorModule;
	
	@Inject
	public var performerData:PerformerDataVO;

	override public function execute(?request:Request):Void 
	{
		#if debug
		hex.log.Logger.DEBUG("SetPerformerIdCommand.execute");
		#end
		
		this.navigator.setCurrentPerformer(this.performerData.performerId);
	}
	
}