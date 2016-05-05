package example.module.mainimage;

import example.module.flickr.controller.*;
import example.module.mainimage.controller.ChangeImageCommand;
import example.module.mainimage.message.MainImageModuleMessage;
import example.module.flickr.model.*;
import example.module.flickr.view.*;
import example.module.mainimage.model.IImageModel;
import example.module.mainimage.model.ImageModel;
import example.module.mainimage.view.MainImageViewHelper;
import example.module.mainimage.view.IMainImageView;
import example.service.flickr.IImageDataService;
import hex.config.stateful.IStatefulConfig;
import hex.config.stateless.StatelessCommandConfig;
import hex.config.stateless.StatelessModelConfig;
import hex.control.request.StringRequest;
import hex.module.Module;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;



/**
 * ...
 * @author azoldesi
 */
class MainImageModule extends Module implements IMainImageModule
{

	public function new( view : IMainImageView, serviceConfig:IStatefulConfig ) 
	{
		super();
		
		this._addStatelessConfigClasses([CommandConfig, ModelConfig]);
		this._addStatefulConfigs([serviceConfig]);
		
		this.buildViewHelper( MainImageViewHelper, view );
	}
	
	public function changeImage() : Void
	{
		this._dispatchPrivateMessage( MainImageModuleMessage.CHANGE_IMAGE, [] ); 
	}
	
	public function loadImage(?request: StringRequest): Void
	{
		this._dispatchPrivateMessage( MainImageModuleMessage.CHANGE_IMAGE, [request] );
	}
	
	// Don't ask why, it is mandatory!
	override function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd = new RuntimeDependencies();
		rd.addServiceDependencies([IImageDataService]);
		return rd;
	}	
}

private class CommandConfig extends StatelessCommandConfig
{
	override public function configure():Void
	{
		this.map( MainImageModuleMessage.CHANGE_IMAGE, ChangeImageCommand );
	}
}

private class ModelConfig extends StatelessModelConfig
{
	override public function configure() : Void
	{
		this.mapModel( IImageModel, ImageModel);
	}
}