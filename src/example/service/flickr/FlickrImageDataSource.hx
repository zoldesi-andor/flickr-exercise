package example.service.flickr;

import example.module.flickr.vo.*;
import example.service.HttpServiceListenerAdapter;
import example.service.flickr.fullsize.FullSizeImageServiceParams;
import example.service.flickr.fullsize.IFullSizeImageService;
import example.service.flickr.random.IRandomImageService;
import example.vo.flickr.list.*;
import example.vo.flickr.size.*;
import example.vo.image.ImageVO;
import hex.service.ServiceConfiguration;
import hex.service.stateless.AsyncStatelessService;
import hex.service.stateless.http.*;
import promhx.*;

/**
 * ...
 * @author azoldesi
 */
class FlickrImageDataSource extends AsyncStatelessService<ServiceConfiguration> implements IImageDataSource
{
	private var userId: String = "36587311@N08";
	private var apiKey: String = "80882b00609df75b919104b460459462"; 
	
	@Inject
	public var randomImageService: IRandomImageService;
	
	@Inject
	public var fullSizeImageService: IFullSizeImageService;
	
	public function new() 
	{
		super();
	}
	
	public function getRandomImage(): Promise<ImageVO>
	{
		var result = new Deferred<ImageVO>();
		
		var onCompleteCallback = function(e:IHTTPService<HTTPServiceConfiguration>)
		{
			var result = this.randomImageService.
			
			deferred.resolve(result);
		};
		
		var onFailCallback = function(e:IHTTPService<HTTPServiceConfiguration>)
		{
			deferred.throwError(e);
		};
		
		var listener = new HttpServiceListenerAdapter<HTTPServiceConfiguration>
		(
			onCompleteCallback,
			onFailCallback,
			onFailCallback,
			onFailCallback
		);
		
		this.randomImageService.setParameters(new RandomImageServiceParams(apiKey, userId));
		this.randomImageService.addHTTPServiceListener(listener);
		this.randomImageService.call();
		
		return new Promise(result);
	}
	
	public function getFullSizeImage(imageId: String): Promise<ImageVO>
	{
		var deferred = new Deferred<ImageVO>();
		
		var onCompleteCallback = function(e:IHTTPService<HTTPServiceConfiguration>)
		{
			var result = this.getFullSizeImageResult();
			result.id = imageId;
			
			deferred.resolve(result);
		};
		
		var onFailCallback = function(e:IHTTPService<HTTPServiceConfiguration>)
		{
			deferred.throwError(e);
		};
		
		var listener = new HttpServiceListenerAdapter<HTTPServiceConfiguration>
		(
			onCompleteCallback,
			onFailCallback,
			onFailCallback,
			onFailCallback
		);
		
		this.fullSizeImageService.setParameters(new FullSizeImageServiceParams(apiKey, userId, imageId));
		this.fullSizeImageService.addHTTPServiceListener(listener);
		this.fullSizeImageService.call();
		
		return new Promise(deferred);
	}
	
	public function getThumbnailImages(count: Int): Promise<Array<ImageVO>>
	{
		var result = new Deferred<Array<ImageVO>>();
		
		return new Promise(result);
	}
	
	private function getFullSizeImageResult(): ImageVO
	{
		var flickrImage = this.fullSizeImageService.getFullSizeImage().data;
		
		var result = new ImageVO();
		
		result.height = flickrImage.height;
		result.width = flickrImage.width;
		result.url = flickrImage.source;
		
		return result;
	}
	
	private function buildFlickrUrl(photo: FlickrPhotoVO): String
	{
		return 'http://${photo.farm}.staticflickr.com/${photo.id}/${photo.owner}_${photo.secret}';
	}
}