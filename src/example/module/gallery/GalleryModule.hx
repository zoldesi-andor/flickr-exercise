package example.module.gallery;

import example.module.gallery.controller.LoadPhotosCommand;
import example.module.gallery.message.GalleryModuleMessage;
import hex.config.stateful.IStatefulConfig;
import hex.config.stateless.StatelessCommandConfig;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;
import hex.module.Module;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryModule extends Module implements IGalleryModule
{

	public function new( serviceConfig : IStatefulConfig ) 
	{
		super();
		getLogger().debug("Hello");

		this._addStatefulConfigs([serviceConfig]);
		
		this._addStatelessConfigClasses([GalleryCommandConfig]);
		
		this._dispatchPrivateMessage( GalleryModuleMessage.LOAD_PHOTOS ); 
	}
	
	override function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd = new RuntimeDependencies();
		return rd;
	}
}

private class GalleryCommandConfig extends StatelessCommandConfig
{
	override public function configure():Void
	{
		this.map( GalleryModuleMessage.LOAD_PHOTOS, LoadPhotosCommand );
	}
}