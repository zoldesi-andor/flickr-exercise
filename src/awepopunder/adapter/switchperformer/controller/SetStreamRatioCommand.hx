package awepopunder.adapter.switchperformer.controller;

import awepopunder.module.layout.ILayoutModule;
import awepopunder.vo.performer.PerformerDataVO;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author 
 */
@:rtti
class SetStreamRatioCommand extends BasicCommand
{
	@inject("name=layoutModule")
	public var layoutModule:ILayoutModule;
	
	@inject
	public var performerData:PerformerDataVO;

	override public function execute(?request:Request):Void 
	{
		this.layoutModule.setStreamRatio(this.performerData.streamRatio);
	}
	
}