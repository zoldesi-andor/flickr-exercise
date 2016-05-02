package example.module.flickr.controller;

import example.module.flickr.model.IImageModel;
import example.module.hello.model.IMessageModel;

import hex.control.command.BasicCommand;
import hex.control.request.StringRequest;
import hex.di.IInjectorContainer;

import haxe.Http;
import haxe.Json;

/**
 * ...
 * @author azoldesi
 */
class ChangeImageCommand extends BasicCommand implements IInjectorContainer
{
	@Inject
	public var imageModel: IImageModel;
	
	public function execute( ?requestList: StringRequest ) : Void 
	{
		var userId: String = "36587311@N08";
		var apiKey: String = "80882b00609df75b919104b460459462";
		var flickrEndpoingUrl: String = "https://api.flickr.com/services/rest/";
		
		this.getLogger().debug("ChangeImageCommand executed");
		
		var requestList = new Http(flickrEndpoingUrl);
		
		requestList.addParameter("method", "flickr.people.getPublicPhotos");
		requestList.addParameter("api_key", apiKey);
		requestList.addParameter("user_id", userId);
		requestList.addParameter("format", "json");
		requestList.addParameter("nojsoncallback", "1");
		requestList.addParameter("per_page", "100");
		
		requestList.onData = function(listData: String)
		{
			var photoList: Array<Dynamic> = Json.parse(listData).photos.photo;
			var randomIndex = Math.floor(Math.random() * photoList.length);
			var photo = photoList[randomIndex];
			
			var requestPhoto = new Http(flickrEndpoingUrl);
			requestPhoto.addParameter("method", "flickr.photos.getSizes");
			requestPhoto.addParameter("api_key", apiKey);
			requestPhoto.addParameter("photo_id", photo.id);
			requestPhoto.addParameter("format", "json");
			requestPhoto.addParameter("nojsoncallback", "1");
			
			requestPhoto.onData = function(photoData: String)
			{
				var photoResponse = Json.parse(photoData);
				
				this.imageModel.setUrl(photoResponse.sizes.size[5].source);
			}
			
			requestPhoto.request();
		};
		
		requestList.request();
		
		//this.imageModel.setTitle("Here comes the title");
		//this.imageModel.setUrl("http://pad2.whstatic.com/images/thumb/9/93/Get-Your-Photos-Explored-on-Flickr-Step-2.jpg/aid965851-728px-Get-Your-Photos-Explored-on-Flickr-Step-2.jpg");
	}
}