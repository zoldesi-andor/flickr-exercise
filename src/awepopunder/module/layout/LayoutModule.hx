package awepopunder.module.layout;

import awepopunder.module.layout.controller.SetLayoutSettingsCommand;
import awepopunder.module.layout.controller.SetOfflineStateCommand;
import awepopunder.module.layout.controller.SetOnlineStateCommand;
import awepopunder.module.layout.controller.SetStreamRatioCommand;
import awepopunder.module.layout.message.LayoutModuleMessage;
import awepopunder.module.layout.model.ILayoutModel;
import awepopunder.module.layout.model.LayoutModel;
import awepopunder.module.layout.request.SetLayoutSettingsRequest;
import awepopunder.module.layout.request.SetStreamRatioRequest;
import awepopunder.module.layout.view.ILayoutView;
import awepopunder.module.layout.view.LayoutViewHelper;
import awepopunder.vo.settings.application.LayoutSettingsVO;
import hex.config.stateless.StatelessCommandConfig;
import hex.config.stateless.StatelessModelConfig;
import hex.module.Module;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;

/**
 * ...
 * @author duke
 */
class LayoutModule extends Module implements ILayoutModule
{

	public function new(layoutView:ILayoutView) 
	{
		super();
		
		this._addStatelessConfigClasses([LayoutCommandConfig, LayoutModelConfig]);
		
		this.setLayoutView( layoutView );
	}
	
	override function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd = new RuntimeDependencies();
		return rd;
	}
	
	public function setLayoutSettings( settings:LayoutSettingsVO ):Void
	{
		this._dispatchPrivateMessage( LayoutModuleMessage.LAYOUT_SETTINGS_CHANGED, [new SetLayoutSettingsRequest(settings)] );
	}
	
	public function setStreamRatio( ratio:Float ):Void
	{
		this._dispatchPrivateMessage( LayoutModuleMessage.STREAM_RATIO_CHANGED, [new SetStreamRatioRequest(ratio)] );
	}
	
	public function setOnline( ):Void
	{
		this._dispatchPrivateMessage( LayoutModuleMessage.ONLINE );
	}
	
	public function setOffline( ):Void
	{
		this._dispatchPrivateMessage( LayoutModuleMessage.OFFLINE );
	}
	
	function setLayoutView( layoutView:ILayoutView ):Void
	{
		this.buildViewHelper( LayoutViewHelper, layoutView );
	}
	
}

private class LayoutCommandConfig extends StatelessCommandConfig
{
	override public function configure():Void
	{
		this.map( LayoutModuleMessage.ONLINE, SetOnlineStateCommand );
		this.map( LayoutModuleMessage.OFFLINE, SetOfflineStateCommand );
		this.map( LayoutModuleMessage.STREAM_RATIO_CHANGED, SetStreamRatioCommand );
		this.map( LayoutModuleMessage.LAYOUT_SETTINGS_CHANGED, SetLayoutSettingsCommand );
	}
}

private class LayoutModelConfig extends StatelessModelConfig
{
	override public function configure() : Void
	{
		this.mapModel( ILayoutModel, LayoutModel );
	}
}