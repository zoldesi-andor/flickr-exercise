package example.module.gallery;

import example.module.gallery.controller.LoadPhotosCommand;
import example.module.gallery.message.GalleryModuleMessage;
import example.module.gallery.model.GalleryModel;
import example.module.gallery.model.IGalleryModel;
import example.module.gallery.view.GalleryViewHelper;
import example.module.gallery.view.GalleryViewJS;
import hex.config.stateful.IStatefulConfig;
import hex.config.stateless.StatelessCommandConfig;
import hex.config.stateless.StatelessModelConfig;
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
		
		this._addStatelessConfigClasses([GalleryCommandConfig, GalleryModelConfig]);
		
		this.buildView();
		
		this._dispatchPrivateMessage( GalleryModuleMessage.LOAD_PHOTOS ); 
	}
	
	override function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd = new RuntimeDependencies();
		return rd;
	}
	
	function buildView( ):Void
	{
		#if flash
			//this.buildViewHelper( GalleryViewHelper, galleryView );
		#elseif js
			this.buildViewHelper( GalleryViewHelper, new GalleryViewJS(js.Browser.document.querySelector(".gallery")) );
		#else 
			#error  // will display an error "Not implemented on this platform"
		#end
	}
}

private class GalleryCommandConfig extends StatelessCommandConfig
{
	override public function configure():Void
	{
		this.map( GalleryModuleMessage.LOAD_PHOTOS, LoadPhotosCommand );
	}
}

private class GalleryModelConfig extends StatelessModelConfig
{
	override public function configure() : Void
	{
		this.mapModel( IGalleryModel, GalleryModel);
	}
}