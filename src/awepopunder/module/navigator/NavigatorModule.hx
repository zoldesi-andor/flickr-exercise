package awepopunder.module.navigator;
import awepopunder.module.navigator.model.NavigatorModel;
import awepopunder.module.navigator.model.INavigatorModel;
import awepopunder.module.navigator.model.INavigatorModelRO;
import awepopunder.module.navigator.message.NavigatorModuleMessage;
import awepopunder.module.navigator.request.SetCurrentPerformerRequest;
import awepopunder.module.navigator.request.SetNavigatorSettingsRequest;
import awepopunder.module.navigator.request.NavigateToRequest;
import awepopunder.module.navigator.controller.SetNavigatorSettingsCommand;
import awepopunder.module.navigator.controller.SetCurrentPerformerCommand;
import awepopunder.module.navigator.controller.NavigateToCommand;
import awepopunder.module.navigator.vo.NavigatorSettingsVO;
import hex.config.stateless.StatelessCommandConfig;
import hex.config.stateless.StatelessModelConfig;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;
import hex.module.Module;

/**
 * ...
 * @author Chris
 */
class NavigatorModule extends Module implements INavigatorModule
{
	var _navigatorModel:INavigatorModelRO;
	
	public function new() 
	{
		super();
		
		this._addStatelessConfigClasses([NavigatorCommandConfig, NavigatorModelConfig]);
		
		this._navigatorModel = this._getDependencyInjector().getInstance(INavigatorModelRO);
	}
	
	public function setNavigatorSettings( navigatorSettings:NavigatorSettingsVO ):Void
	{
		this._dispatchPrivateMessage( NavigatorModuleMessage.SET_NAVIGATOR_SETTINGS, [new SetNavigatorSettingsRequest( navigatorSettings )] );
	}
	
	public function setCurrentPerformer( performerId:String):Void
	{
		this._dispatchPrivateMessage( NavigatorModuleMessage.SET_CURRENT_PERFORMER, [new SetCurrentPerformerRequest( performerId )] );
	}
	
	public function navigateTo( pageName:String ):Void
	{
		this._dispatchPrivateMessage( NavigatorModuleMessage.NAVIGATE_TO, [new NavigateToRequest( pageName )] );
	}
	
	override function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd = new RuntimeDependencies();
		return rd;
	}
}

private class NavigatorCommandConfig extends StatelessCommandConfig
{
	override public function configure():Void 
	{
		this.map( NavigatorModuleMessage.SET_NAVIGATOR_SETTINGS, SetNavigatorSettingsCommand );
		this.map( NavigatorModuleMessage.SET_CURRENT_PERFORMER, SetCurrentPerformerCommand );
		this.map( NavigatorModuleMessage.NAVIGATE_TO, NavigateToCommand );
	}
}

private class NavigatorModelConfig extends StatelessModelConfig
{
	override public function configure():Void 
	{
		this.mapModel( INavigatorModel, NavigatorModel );
	}
}
