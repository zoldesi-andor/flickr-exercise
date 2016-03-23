package example.service.flickr;

import hex.data.IParser;
import hex.log.Logger;
import hex.service.ServiceConfiguration;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.StatelessService;
import example.module.gallery.IGetPhotosService;

/**
 * ...
 * @author Andrei Bunulu
 */
class FlickrGetPhotos extends HTTPService<HTTPServiceConfiguration> implements IGetPhotosService
{

	public function new() 
	{
		super();
		#if debug
		Logger.DEBUG("FlickrGetPhotos constructor");
		#end
		//todo Francis why StatelessService is instansted at initialisation.
		
	}
	
	@PostConstruct
	override public function createConfiguration() : Void
	{
		Logger.DEBUG("FlickrGetPhotos createConfiguration");
		this.setConfiguration( new HTTPServiceConfiguration("https://api.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&api_key=fd4bd5172749b9b0a6d44bd16c729524&user_id=134406781%40N06&format=json&api_sig=b0f1846f15d8d56fa79b641f497ccf3c") );
		this.setParser( new FlickrPhotosParser() );
	}
	
	public function getPhotos():Array<String> 
	{
		return this._result;
	}
	
}