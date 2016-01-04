package awepopunder.module.layout;

import awepopunder.module.layout.controller.SetOfflineStateCommand;
import awepopunder.module.layout.controller.SetOnlineStateCommand;
import awepopunder.module.layout.event.LayoutModuleEventType;
import awepopunder.module.layout.model.ILayoutModel;
import awepopunder.module.layout.model.LayoutModel;
import awepopunder.module.layout.view.ILayoutView;
import awepopunder.module.layout.view.LayoutViewHelper;
import hex.config.stateless.StatelessCommandConfig;
import hex.config.stateless.StatelessModelConfig;
import hex.event.BasicEvent;
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
	
	override private function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd : RuntimeDependencies = new RuntimeDependencies();
		return rd;
	}
	
	public function setOnline( ):Void
	{
		this._dispatchInternalEvent( new BasicEvent(LayoutModuleEventType.ONLINE, this) );
	}
	
	public function setOffline( ):Void
	{
		this._dispatchInternalEvent( new BasicEvent(LayoutModuleEventType.OFFLINE, this) );
	}
	
	private function setLayoutView( layoutView ):Void
	{
		this.buildViewHelper( LayoutViewHelper, layoutView );
	}
	
}

private class LayoutCommandConfig extends StatelessCommandConfig
{
	override public function configure():Void
	{
		this.map( LayoutModuleEventType.ONLINE, SetOnlineStateCommand );
		this.map( LayoutModuleEventType.OFFLINE, SetOfflineStateCommand );
	}
}

private class LayoutModelConfig extends StatelessModelConfig
{
	override public function configure() : Void
	{
		this.mapModel( ILayoutModel, LayoutModel );
	}
}