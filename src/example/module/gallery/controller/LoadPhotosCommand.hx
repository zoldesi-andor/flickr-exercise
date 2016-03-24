package example.module.gallery.controller;

import example.module.gallery.service.IGetPhotosService;
import example.module.gallery.view.GalleryViewHelper;
import hex.control.command.BasicCommand;
import hex.control.Request;
import hex.di.ISpeedInjectorContainer;
import hex.log.Logger;
import hex.service.stateless.http.IHTTPService;
import hex.service.stateless.http.IHTTPServiceListener;
import hex.service.stateless.http.HTTPServiceConfiguration;

/**
 * ...
 * @author Andrei Bunulu
 */
class LoadPhotosCommand extends BasicCommand implements IHTTPServiceListener<HTTPServiceConfiguration> implements ISpeedInjectorContainer
{

	@Inject
	public var photosService:IGetPhotosService;
	
	@Inject
	public var galleryViewHelper:GalleryViewHelper;
	
	function new()
	{
		super();
	}
	
	override public function execute(?request:Request):Void 
	{
		Logger.DEBUG("LoadPhotosCommand execute");
		photosService.addHTTPServiceListener(this);
		photosService.call();
	}
	
	public function onServiceComplete( service : IHTTPService<HTTPServiceConfiguration> ) : Void
	{
		galleryViewHelper.setPhotos(cast (service, IGetPhotosService).getPhotos());
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