package example.module.thumbnails;

import example.module.thumbnails.controller.*;
import example.module.thumbnails.message.*;
import example.module.thumbnails.model.*;
import example.module.thumbnails.view.*;

import example.service.image.IImageDataService;

import hex.config.stateful.IStatefulConfig;
import hex.config.stateless.StatelessCommandConfig;
import hex.config.stateless.StatelessModelConfig;

import hex.control.request.ValueRequest;

import hex.module.Module;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;

/**
 * ...
 * @author azoldesi
 */
class ThumbnailsModule extends Module
{
	var view: IThumbnailsView;
	
	public function new( view : IThumbnailsView, serviceConfig:IStatefulConfig ) 
	{
		super();
		
		this._addStatelessConfigClasses([CommandConfig, ModelConfig]);
		this._addStatefulConfigs([serviceConfig]);
		
		this.buildViewHelper( ThumbnailsViewHelper, view );
		
		this.view = view;
	}
	
	public function loadThumbnails(): Void
	{
		var thumbnailCount = this.view.getMaxThumbnailCount();
		this._dispatchPrivateMessage( ThumbnailsModuleMessage.LOAD_THUMBNAILS, [new ValueRequest(thumbnailCount)]);
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
		this.map( ThumbnailsModuleMessage.LOAD_THUMBNAILS, LoadThumbnails );
	}
}

private class ModelConfig extends StatelessModelConfig
{
	override public function configure() : Void
	{
		this.mapModel( IThumbnailListModel, ThumbnailListModel);
	}
}