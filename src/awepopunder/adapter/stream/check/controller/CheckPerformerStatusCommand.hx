package awepopunder.adapter.stream.check.controller;

import awepopunder.module.performerprovider.IPerformerProviderModule;
import awepopunder.service.performer.performerstatus.IPerformerStatusService;
import hex.control.async.AsyncCommand;
import hex.control.Request;

/**
 * ...
 * @author 
 */
@:rtti
class CheckPerformerStatusCommand extends AsyncCommand
{
	@inject("name=performerStatusService")
	public var performerStatusService:IPerformerStatusService;
	
	@inject("name=performerProviderModule")
	public var performerProviderModule:IPerformerProviderModule;

	override public function execute(?request:Request):Void 
	{
		if ( !this.performerStatusService.inUse )
		{
			this.performerStatusService.startCheckPerformer( this.performerProviderModule.getActivePerformer( ).performerId );
		}
	}
	
}