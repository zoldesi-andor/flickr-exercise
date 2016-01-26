package awepopunder.module.layout;

import awepopunder.module.layout.constant.LayoutMode;
import awepopunder.module.layout.controller.SetLayoutModeCommand;
import awepopunder.module.layout.controller.SetOfflineStateCommand;
import awepopunder.module.layout.controller.SetOnlineStateCommand;
import awepopunder.module.layout.controller.SetStreamRatioCommand;
import awepopunder.module.layout.message.LayoutModuleMessage;
import awepopunder.module.layout.model.ILayoutModel;
import awepopunder.module.layout.model.LayoutModel;
import awepopunder.module.layout.request.LayoutModeRequest;
import awepopunder.module.layout.request.SetStreamRatioRequest;
import awepopunder.module.layout.view.ILayoutView;
import awepopunder.module.layout.view.LayoutViewHelper;
import hex.config.stateless.StatelessCommandConfig;
import hex.config.stateless.StatelessModelConfig;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;
import hex.module.Module;

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
	
	public function setLayoutMode( mode:LayoutMode ):Void
	{
		this._dispatchPrivateMessage( LayoutModuleMessage.LAYOUT_MODE_CHANGED, [new LayoutModeRequest(mode)] );
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
		this.map( LayoutModuleMessage.LAYOUT_MODE_CHANGED, SetLayoutModeCommand );
		this.map( LayoutModuleMessage.STREAM_RATIO_CHANGED, SetStreamRatioCommand );
	}
}

private class LayoutModelConfig extends StatelessModelConfig
{
	override public function configure() : Void
	{
		this.mapModel( ILayoutModel, LayoutModel );
	}
}