package example.module.mainimage.controller;

import example.module.mainimage.model.IImageModel;
import example.service.image.IImageDataService;
import example.vo.flickr.list.FlickrPhotoVO;
import example.vo.flickr.size.FlickrPhotoSizeVO;
import example.vo.image.ImageVO;
import hex.control.request.ValueRequest;
import promhx.Promise;

import hex.control.async.AsyncCommand;
import hex.control.request.StringRequest;
import hex.di.IInjectorContainer;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.http.IHTTPService;

/**
 * ...
 * @author azoldesi
 */
class ChangeImageCommand extends AsyncCommand implements IInjectorContainer
{
	@Inject
	public var imageModel: IImageModel;
	
	@Inject
	public var imageDataSource: IImageDataService;
	
	public function execute( ?request: ValueRequest<ImageVO> ) : Void 
	{			
		this.getLogger().debug("ChangeImageCommand executed");
		
		if (request != null)
		{
			this.loadImage(request.value);
		}
		else
		{
			this.loadRandomImage();
		}
	}
	
	private function loadImage(image: ImageVO): Void
	{
		this.imageModel.setUrl(image.getMediumUrl());
		this._handleComplete();
	}
	
	private function loadRandomImage(): Void
	{
		this.imageDataSource.getRandomImage()
		
		.then(function(image: ImageVO) 
		{ 
			this.imageModel.setTitle(image.title);
			this.imageModel.setUrl(image.getMediumUrl());
			this._handleComplete();
		})
		
		.catchError(function(e) 
		{
			this._handleFail();
		});
	}
}