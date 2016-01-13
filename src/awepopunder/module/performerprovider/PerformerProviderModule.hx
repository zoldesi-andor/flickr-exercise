package awepopunder.module.performerprovider;

import awepopunder.module.performerprovider.controller.LoadNextPerformerCommand;
import awepopunder.module.performerprovider.controller.SetFilterSettingsCommand;
import awepopunder.module.performerprovider.IPerformerProviderModule;
import awepopunder.module.performerprovider.message.PerformerProviderModuleMessage;
import awepopunder.module.performerprovider.model.IPerformerProviderModel;
import awepopunder.module.performerprovider.model.PerformerProviderModel;
import awepopunder.module.performerprovider.request.SetFilterSettingsRequest;
import awepopunder.service.performer.IPerformerDataService;
import awepopunder.vo.settings.application.FilterSettingsVO;
import hex.config.stateful.IStatefulConfig;
import hex.config.stateless.StatelessCommandConfig;
import hex.config.stateless.StatelessModelConfig;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;
import hex.module.Module;

/**
 * ...
 * @author 
 */
class PerformerProviderModule extends Module implements IPerformerProviderModule
{

	public function new(serviceConfig:IStatefulConfig) 
	{
		super();
		
		this._addStatelessConfigClasses([PerformerProviderCommandConfig, PerformerProviderModelConfig]);
		this._addStatefulConfigs([serviceConfig]);
	}
	
	public function setFilterSettings( filterSettings:FilterSettingsVO, site:String ):Void
	{
		this._dispatchPrivateMessage( PerformerProviderModuleMessage.SET_FILTER_SETTINGS, [new SetFilterSettingsRequest( filterSettings, site )] );
	}
	
	public function loadNextPerformer( ):Void
	{
		this._dispatchPrivateMessage( PerformerProviderModuleMessage.LOAD_NEXT_PERFORMER );
	}
	
	override private function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd : RuntimeDependencies = new RuntimeDependencies();
		rd.addServiceDependencies([IPerformerDataService]);
		return rd;
	}
	
}

private class PerformerProviderCommandConfig extends StatelessCommandConfig
{
	override public function configure():Void 
	{
		this.map( PerformerProviderModuleMessage.SET_FILTER_SETTINGS, SetFilterSettingsCommand );
		this.map( PerformerProviderModuleMessage.LOAD_NEXT_PERFORMER, LoadNextPerformerCommand );
	}
}

private class PerformerProviderModelConfig extends StatelessModelConfig
{
	override public function configure():Void 
	{
		this.mapModel( IPerformerProviderModel, PerformerProviderModel );
	}
}