package awepopunder.module.navigator.controller;

import awepopunder.module.navigator.model.INavigatorModel;
import awepopunder.module.navigator.request.SetCurrentPerformerRequest;
import hex.control.Request;
import hex.control.command.BasicCommand;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author Chris
 */
class SetCurrentPerformerCommand extends BasicCommand implements ISpeedInjectorContainer
{
	@Inject
	public var navigatorModel:INavigatorModel;

	override public function execute(?request:Request):Void 
	{
		var request:SetCurrentPerformerRequest = cast request;
		
		#if debug
		hex.log.Logger.DEBUG("awepopunder.module.navigator.controller.SetCurrentPerformerCommand performerId: " + request.performerId);
		#end
		
		this.navigatorModel.setCurrentPerformerId( request.performerId );
	}
	
}