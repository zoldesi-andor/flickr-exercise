package example.module.gallery.controller;

import example.module.gallery.model.IGalleryModel;
import example.module.gallery.service.IGetPhotosService;
import hex.control.command.BasicCommand;
import hex.control.Request;
import hex.di.IInjectorContainer;
import hex.log.Logger;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.http.IHTTPService;
import hex.service.stateless.http.IHTTPServiceListener;

/**
 * ...
 * @author Andrei Bunulu
 */
class LoadPhotosCommand extends BasicCommand implements IHTTPServiceListener<HTTPServiceConfiguration> implements IInjectorContainer
{

	@Inject
	public var photosService:IGetPhotosService;
	
	@Inject
	public var galleryModel:IGalleryModel;
	// public var galleryViewHelper:GalleryViewHelper;
	
	function new()
	{
		super();
	}
	
	public function execute(?request:Request):Void 
	{
		Logger.DEBUG("LoadPhotosCommand execute");
		photosService.addHTTPServiceListener(this);
		photosService.call();
	}
	
	public function onServiceComplete( service : IHTTPService<HTTPServiceConfiguration> ) : Void
	{
		// galleryViewHelper.setPhotos(cast (service, IGetPhotosService).getPhotos());
		Logger.DEBUG(galleryModel);
		galleryModel.setPhotos(cast (service, IGetPhotosService).getPhotos());
	}
	
	public function onServiceFail( service : IHTTPService<HTTPServiceConfiguration> ) : Void
	{
		Logger.DEBUG("onServiceFail");
	}
	public function onServiceCancel( service : IHTTPService<HTTPServiceConfiguration> ) : Void
	{
		Logger.DEBUG("onServiceCancel");
	}
	public function onServiceTimeout( service : IHTTPService<HTTPServiceConfiguration> ) : Void
	{
		Logger.DEBUG("onServiceTimeout");
	}
	
}