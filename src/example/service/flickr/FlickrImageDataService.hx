package example.service.flickr;

import example.module.flickr.vo.*;
import example.service.flickr.parser.FullSizeImageDataParser;
import example.service.flickr.parser.RandomImageDataParser;
import example.vo.flickr.list.*;
import example.vo.flickr.size.*;
import example.vo.image.ImageVO;
import hex.service.ServiceConfiguration;
import hex.service.stateless.AsyncStatelessService;
import hex.service.stateless.*;
import promhx.*;
import promhx.haxe.Http;

/**
 * ...
 * @author azoldesi
 */
class FlickrImageDataService extends AsyncStatelessService<ServiceConfiguration> implements IImageDataService
{
	private var userId: String = "36587311@N08";
	private var apiKey: String = "80882b00609df75b919104b460459462";
	private var flickrEndpoingUrl: String = "https://api.flickr.com/services/rest/";
	
	public function new() 
	{
		super();
	}
	
	public function getRandomImage(): Promise<FlickrPhotoVO>
	{
		var httpRequest = this.createRequest()
			.setParameter("method", "flickr.people.getPublicPhotos")
			.setParameter("per_page", "100");
			
		httpRequest.request();
			
		return httpRequest.then(function(data: String) { return new RandomImageDataParser().parse(data); });
	}
	
	public function getFullSizeImage(imageId: String): Promise<FlickrPhotoSizeVO>
	{
		var httpRequest = this.createRequest()
			.setParameter("method", "flickr.photos.getSizes")
			.setParameter("photo_id", imageId);
			
		httpRequest.request();
			
		return httpRequest.then(function(data) { return new FullSizeImageDataParser().parse(data); });
	}
	
	public function getThumbnailImages(count: Int): Promise<Array<ImageVO>>
	{
		var result = new Deferred<Array<ImageVO>>();
		
		return new Promise(result);
	}
	
	private function createRequest(): Http
	{
		return new Http(this.flickrEndpoingUrl)
			.setParameter("api_key", apiKey)
			.setParameter("user_id", userId)
			.setParameter("format", "json")
			.setParameter("nojsoncallback", "1");
	}
}