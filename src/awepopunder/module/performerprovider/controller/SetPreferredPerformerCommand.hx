package awepopunder.module.performerprovider.controller;
import awepopunder.module.performerprovider.model.IPerformerProviderModel;
import awepopunder.module.performerprovider.request.SetPreferredPerformerRequest;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author Chris
 */
@:rtti
class SetPreferredPerformerCommand extends BasicCommand
{
	@Inject
	public var performerProviderModel:IPerformerProviderModel;

	override public function execute(?request:Request):Void 
	{
		var request:SetPreferredPerformerRequest = cast request;
		
		this.performerProviderModel.setPreferredPerformer( request.preferredPerformer );
	}
	
}