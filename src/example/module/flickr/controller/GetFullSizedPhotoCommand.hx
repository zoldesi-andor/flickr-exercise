package example.module.flickr.controller;

import example.module.flickr.model.IImageModel;
import example.service.flickr.IImageDataService;
import example.vo.flickr.list.FlickrPhotoVO;

import hex.control.async.AsyncCommand;
import hex.control.request.StringRequest;
import hex.di.IInjectorContainer;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.http.IHTTPService;


/**
 * ...
 * @author azoldesi
 */
class GetFullSizedPhotoCommand extends AsyncCommand implements IInjectorContainer
{
	@Inject
	public var imageModel: IImageModel;
	
	@Inject("photo")
	public var photo: FlickrPhotoVO;
	
	@Inject
	public var imageDataSource: IImageDataService;
	
	public function execute( ?requestList: StringRequest ) : Void 
	{			
		
		this.getLogger().debug("ChangeImageCommand executed");
		
		this.imageDataSource.getFullSizeImage(photo.id)
		
		.then(function(result)
		{
			this.imageModel.setUrl(result.source);
			this.imageModel.setTitle(this.photo.title);
			this._handleComplete();
		})
		
		.catchError(function(e)
		{
			this._handleFail();
		});
	}
}