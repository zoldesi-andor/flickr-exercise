package awepopunder.module.performerprovider.controller;

import awepopunder.module.performerprovider.model.IPerformerProviderModel;
import awepopunder.module.performerprovider.request.SetFilterSettingsRequest;
import hex.control.Request;
import hex.control.command.BasicCommand;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author 
 */
class SetFilterSettingsCommand extends BasicCommand implements ISpeedInjectorContainer
{
	@Inject
	public var performerProviderModel:IPerformerProviderModel;

	override public function execute(?request:Request):Void 
	{
		var request:SetFilterSettingsRequest = cast request;
		
		#if debug
		hex.log.Logger.DEBUG("SetFilterSettingsCommand.onServiceComplete filterSettings: " + request.filterSettings + ", site: " + request.site);
		#end
		
		this.performerProviderModel.setFilterSettings( request.filterSettings );
		this.performerProviderModel.setSite( request.site );
	}
	
}