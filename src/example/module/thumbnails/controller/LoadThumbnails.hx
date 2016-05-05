package example.module.thumbnails.controller;

import example.module.mainimage.model.IImageModel;
import example.module.thumbnails.model.IThumbnailListModel;
import example.service.flickr.IImageDataService;
import hex.control.async.AsyncCommand;
import hex.control.request.StringRequest;
import hex.di.IInjectorContainer;


/**
 * ...
 * @author azoldesi
 */
class LoadThumbnails extends AsyncCommand implements IInjectorContainer
{
	@Inject
	public var model: IThumbnailListModel;
	
	@Inject
	public var imageDataSource: IImageDataService;
	
	public function execute( ?requestList: StringRequest ) : Void 
	{			
		this.getLogger().debug("LoadThumbnails executed");
		
		this.imageDataSource.getThumbnailImages(5).then(function(image)
		{
			this.model.createThumbnail(image);
		});
	}
}