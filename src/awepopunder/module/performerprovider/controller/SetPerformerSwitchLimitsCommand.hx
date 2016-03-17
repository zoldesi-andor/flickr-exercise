package awepopunder.module.performerprovider.controller;
import awepopunder.module.performerprovider.model.IPerformerProviderModel;
import awepopunder.module.performerprovider.request.SetPerformerSwitchLimitsRequest;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author duke
 */
@:rtti
class SetPerformerSwitchLimitsCommand extends BasicCommand
{
	@Inject
	public var performerProviderModel:IPerformerProviderModel;

	override public function execute(?request:Request):Void 
	{
		var setPerformerSwitchLimitsRequest:SetPerformerSwitchLimitsRequest = cast request;
		
		#if debug
		hex.log.Logger.DEBUG("SetPerformerSwitchLimitsCommand auto: " + setPerformerSwitchLimitsRequest.auto + ", manual: " + setPerformerSwitchLimitsRequest.manual);
		#end
		
		this.performerProviderModel.setAutoPerformerSwitchLimit( setPerformerSwitchLimitsRequest.auto );
		this.performerProviderModel.setManualPerformerSwitchLimit( setPerformerSwitchLimitsRequest.manual );
	}
}