package example.module.gallery;

import example.module.gallery.controller.LoadPhotosCommand;
import example.module.gallery.message.GalleryModuleMessage;
import example.module.gallery.view.IGalleryView;
import hex.config.stateful.IStatefulConfig;
import hex.config.stateless.StatelessCommandConfig;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;
import hex.module.Module;
import example.module.gallery.view.GalleryViewHelper;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryModule extends Module implements IGalleryModule
{

	public function new( serviceConfig : IStatefulConfig, galleryView : IGalleryView ) 
	{
		super();
		getLogger().debug("Hello");

		this._addStatefulConfigs([serviceConfig]);
		
		this._addStatelessConfigClasses([GalleryCommandConfig]);
		
		this.buildView(galleryView);
		
		this._dispatchPrivateMessage( GalleryModuleMessage.LOAD_PHOTOS ); 
	}
	
	override function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd = new RuntimeDependencies();
		return rd;
	}
	
	function buildView( galleryView : IGalleryView ):Void
	{
		this.buildViewHelper( GalleryViewHelper, galleryView );
	}
}

private class GalleryCommandConfig extends StatelessCommandConfig
{
	override public function configure():Void
	{
		this.map( GalleryModuleMessage.LOAD_PHOTOS, LoadPhotosCommand );
	}
}