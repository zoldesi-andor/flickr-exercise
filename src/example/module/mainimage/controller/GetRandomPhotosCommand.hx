package example.module.mainimage.controller;

import example.service.image.IImageDataService;
import example.vo.flickr.list.FlickrPhotoVO;
import hex.control.async.AsyncCommand;
import hex.control.payload.ExecutionPayload;
import hex.control.request.StringRequest;
import hex.di.IInjectorContainer;


/**
 * ...
 * @author azoldesi
 */
class GetRandomPhotosCommand extends AsyncCommand implements IInjectorContainer
{
	private var result: FlickrPhotoVO;
	
	@Inject
	public var imageDataSource: IImageDataService;
	
	public function execute( ?requestList: StringRequest ) : Void 
	{			
		
		this.getLogger().debug("GetPhotosCommand executed");
		
		this.imageDataSource.getRandomImage()
		
		.then(function(image: FlickrPhotoVO)
		{
			this.result = image;
			this._handleComplete();
		})
		
		.catchError(function(e)
		{
			this._handleFail();
		});
	}
	
	override function getResult(): Array<FlickrPhotoVO>
	{
		return [this.result];
	}
	
	override function getReturnedExecutionPayload(): Array<ExecutionPayload>
	{
		return [ new ExecutionPayload(this.result, FlickrPhotoVO, "photo")];
	}
}