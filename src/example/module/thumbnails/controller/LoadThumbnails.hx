package example.module.thumbnails.controller;

import example.module.mainimage.model.IImageModel;
import example.module.thumbnails.model.IThumbnailListModel;
import example.service.image.IImageDataService;
import hex.control.async.AsyncCommand;
import hex.control.request.StringRequest;
import hex.control.request.ValueRequest;
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
	
	public function execute( ?request: ValueRequest<Int> ) : Void 
	{			
		this.getLogger().debug("LoadThumbnails executed");
		
		var thumbnailCount = request != null ? request.value : 5;
		
		var stream = this.imageDataSource.getThumbnailImages(thumbnailCount);
		
		stream.then(function(image)
		{
			this.model.createThumbnail(image);
		});
		
		stream.endThen(function(image) { this._handleComplete(); });
		stream.catchError(function(e) { this._handleFail(); });
	}
}