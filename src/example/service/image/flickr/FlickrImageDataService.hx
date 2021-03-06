package example.service.image.flickr;

import example.module.flickr.vo.*;
import example.service.image.flickr.parser.FullSizeImageDataParser;
import example.service.image.flickr.parser.RandomImagesDataParser;
import example.vo.flickr.list.*;
import example.vo.flickr.size.*;
import example.vo.image.ImageSizeVO;
import example.vo.image.ImageVO;
import haxe.Json;
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
	
	public function getRandomImage(): Promise<ImageVO>
	{
		var httpRequest = this.createRequest()
			.setParameter("method", "flickr.people.getPublicPhotos")
			.setParameter("per_page", "100");
			
		httpRequest.request();
			
		return httpRequest
				.then(function(data: String) { return new RandomImagesDataParser(1).parse(data)[0]; })
				.pipe(function(image) { return this.fetchSizeInformationForImage(image); });
	}
	
	public function getFullSizeImage(imageId: String): Promise<FlickrPhotoSizeVO>
	{
		var httpRequest = this.createRequest()
			.setParameter("method", "flickr.photos.getSizes")
			.setParameter("photo_id", imageId);
			
		httpRequest.request();
			
		return httpRequest.then(function(data) { return new FullSizeImageDataParser().parse(data); });
	}
	
	public function getThumbnailImages(count: Int): Stream<ImageVO>
	{
		var deferred = new Deferred<ImageVO>();
		var stream = deferred.stream();
		
		var httpRequest = this.createRequest()
			.setParameter("method", "flickr.people.getPublicPhotos")
			.setParameter("per_page", "100");
			
		httpRequest.request();
			
		httpRequest
			.then(function(data: String) { return new RandomImagesDataParser(count).parse(data); })
			.then(function(images)
			{
				var promises = images.map(function(image)
				{
					return this.fetchSizeInformationForImage(image)
						.then(function(data) 
						{ 
							deferred.resolve(image); 
							return image;
						});
				});
				
				Promise.whenAll(promises).then(function(data) { stream.end(); });
			});
		
		return stream;
	}
	
	private function fetchSizeInformationForImage(image: ImageVO): Promise<ImageVO>
	{
		var httpRequest = this.createRequest()
			.setParameter("method", "flickr.photos.getSizes")
			.setParameter("photo_id", image.id);
			
		httpRequest.request();
		
		return httpRequest.then(function(data: String)
		{
			var sizes: Array<Dynamic> = Json.parse(data).sizes.size;
			
			image.sizes = sizes.map(function(size) {
				return new ImageSizeVO(size.label, size.source, size.width, size.height);
			});
			
			return image;
		});
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