package awepopunder.adapter.stream.check.controller;

import awepopunder.module.performerprovider.IPerformerProviderModule;
import awepopunder.service.performer.performerstatus.IPerformerStatusService;
import hex.control.command.BasicCommand;
import hex.control.Request;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author 
 */
class StartCheckPerformerStatusCommand extends BasicCommand implements ISpeedInjectorContainer
{
	@Inject("performerStatusService")
	public var performerStatusService:IPerformerStatusService;
	
	@Inject("performerProviderModule")
	public var performerProviderModule:IPerformerProviderModule;

	override public function execute(?request:Request):Void 
	{
		#if debug
		hex.log.Logger.DEBUG("awepopunder.adapter.stream.check.controller.StartCheckPerformerStatusCommand if: " + !this.performerStatusService.inUse() );
		#end
		if ( !this.performerStatusService.inUse() )
		{
			this.performerStatusService.startCheckPerformer( this.performerProviderModule.getActivePerformer( ).performerId );
		}
	}
	
}