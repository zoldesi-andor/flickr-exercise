package example.module.flickr;

import hex.config.stateless.StatelessCommandConfig;
import hex.config.stateless.StatelessModelConfig;
import hex.control.request.StringRequest;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;
import hex.module.Module;
import hex.config.stateful.IStatefulConfig;

import example.module.flickr.service.flickr.random.IRandomImageService;
import example.module.flickr.service.flickr.fullsize.IFullSizeImageService;
import example.module.flickr.model.*;
import example.module.flickr.view.*;
import example.module.flickr.view.message.FlickrViewMessage;
import example.module.flickr.message.FlickrModuleMessage;
import example.module.flickr.controller.ChangeImageCommand;

/**
 * ...
 * @author azoldesi
 */
class FlickrModule extends Module implements IFlickrModule
{

	public function new( view : IFlickrView, serviceConfig:IStatefulConfig ) 
	{
		super();
		
		this._addStatelessConfigClasses([CommandConfig, ModelConfig]);
		this._addStatefulConfigs([serviceConfig]);
		
		this.buildViewHelper( FlickrViewHelper, view );
	}
	
	public function changeImage() : Void
	{
		this._dispatchPrivateMessage( FlickrModuleMessage.CHANGE_IMAGE, [] ); 
	}
	
	// Don't ask why, it is mandatory!
	override function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd = new RuntimeDependencies();
		rd.addServiceDependencies([IRandomImageService, IFullSizeImageService]);
		return rd;
	}	
}

private class CommandConfig extends StatelessCommandConfig
{
	override public function configure():Void
	{
		this.map( FlickrModuleMessage.CHANGE_IMAGE, ChangeImageCommand );
	}
}

private class ModelConfig extends StatelessModelConfig
{
	override public function configure() : Void
	{
		this.mapModel( IImageModel, ImageModel);
	}
}