package awepopunder.module.navigator.controller;
import awepopunder.module.navigator.model.INavigatorModel;
import awepopunder.module.navigator.request.SetCurrentPerformerRequest;
import hex.control.Request;
import hex.control.command.BasicCommand;

/**
 * ...
 * @author Chris
 */
@:rtti
class SetCurrentPerformerCommand extends BasicCommand
{
	@inject
	public var navigatorModel:INavigatorModel;

	override public function execute(?request:Request):Void 
	{
		var request:SetCurrentPerformerRequest = cast request;
		
		this.navigatorModel.setCurrentPerformerId( request.performerId );
	}
	
}