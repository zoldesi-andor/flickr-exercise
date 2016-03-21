package awepopunder.adapter.switchperformer.controller;

import awepopunder.module.layout.ILayoutModule;
import awepopunder.vo.performer.PerformerDataVO;
import hex.control.command.BasicCommand;
import hex.control.Request;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author 
 */
class SetStreamRatioCommand extends BasicCommand implements ISpeedInjectorContainer
{
	@Inject("layoutModule")
	public var layoutModule:ILayoutModule;
	
	@Inject
	public var performerData:PerformerDataVO;

	override public function execute(?request:Request):Void 
	{
		#if debug
		hex.log.Logger.DEBUG("SetStreamRatioCommand.execute");
		#end
		
		this.layoutModule.setStreamRatio(this.performerData.streamRatio);
	}
	
}