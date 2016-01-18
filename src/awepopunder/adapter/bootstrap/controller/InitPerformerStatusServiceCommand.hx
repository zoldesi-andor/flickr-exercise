package awepopunder.adapter.bootstrap.controller;

import awepopunder.service.performer.performerstatus.IPerformerStatusService;
import awepopunder.service.performer.performerstatus.PerformerStatusServiceConfiguration;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author duke
 */
@:rtti
class InitPerformerStatusServiceCommand extends BasicCommand
{
	@inject("name=performerStatusService")
	public var performerStatusService:IPerformerStatusService;
	
	override public function execute(?request:Request):Void 
	{
		//TODO: get url from settings
		cast (this.performerStatusService.getConfiguration(), PerformerStatusServiceConfiguration).url = "http://promo.awempire.com/model_status/index.php";
	}
}