package awepopunder.module.navigator.controller;

import awepopunder.module.navigator.model.INavigatorModel;
import awepopunder.module.navigator.request.SetNavigatorSettingsRequest;
import hex.control.Request;
import hex.control.command.BasicCommand;

/**
 * ...
 * @author Chris
 */
@:rtti
class SetNavigatorSettingsCommand extends BasicCommand
{
	@Inject
	public var navigatorModel:INavigatorModel;

	override public function execute(?request:Request):Void 
	{
		var request:SetNavigatorSettingsRequest = cast request;
		
		#if debug
		hex.log.Logger.DEBUG("SetCurrentPerformerCommand navigatorSettings: " + request.navigatorSettings);
		#end
		
		this.navigatorModel.setNavigatorSettings( request.navigatorSettings );
	}
	
}