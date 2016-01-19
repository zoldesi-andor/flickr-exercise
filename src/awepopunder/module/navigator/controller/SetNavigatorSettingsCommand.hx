package awepopunder.module.navigator.controller;
import awepopunder.module.navigator.model.INavigatorModel;
import awepopunder.module.navigator.request.SetNavigatorSettingsRequest;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author Chris
 */
@:rtti
class SetNavigatorSettingsCommand extends BasicCommand
{
	@inject
	public var navigatorModel:INavigatorModel;

	override public function execute(?request:Request):Void 
	{
		var request:SetNavigatorSettingsRequest = cast request;
		
		this.navigatorModel.setNavigatorSettings( request.navigatorSettings );
	}
	
}