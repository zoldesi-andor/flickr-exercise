package awepopunder.module.performerprovider.controller;
import awepopunder.module.performerprovider.model.IPerformerProviderModel;
import awepopunder.module.performerprovider.request.SetFilterSettingsRequest;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author 
 */
@:rtti
class SetFilterSettingsCommand extends BasicCommand
{
	@Inject
	public var performerProviderModel:IPerformerProviderModel;

	override public function execute(?request:Request):Void 
	{
		var request:SetFilterSettingsRequest = cast request;
		
		this.performerProviderModel.setFilterSettings( request.filterSettings );
		this.performerProviderModel.setSite( request.site );
	}
	
}