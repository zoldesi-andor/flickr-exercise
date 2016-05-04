package example.module.flickr.controller;

import example.module.flickr.model.IImageModel;
import example.service.flickr.IImageDataService;
import example.vo.flickr.list.FlickrPhotoVO;
import example.vo.flickr.size.FlickrPhotoSizeVO;

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
	
	public function execute( ?requestList: StringRequest ) : Void 
	{			
		this.getLogger().debug("ChangeImageCommand executed");
		
		this.imageDataSource.getRandomImage()
		
		.pipe(function(image: FlickrPhotoVO) 
		{ 
			this.imageModel.setTitle(image.title);
			return this.imageDataSource.getFullSizeImage(image.id); 
		})
		
		.then(function(size: FlickrPhotoSizeVO) 
		{ 
			this.imageModel.setUrl(size.source);
			this._handleComplete();
		})
		
		.catchError(function(e) 
		{
			this._handleFail();
		});
	}
}