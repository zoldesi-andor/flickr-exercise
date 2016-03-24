package example.service.flickr;

import hex.data.IParser;
import hex.log.Logger;
import hex.service.ServiceConfiguration;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.StatelessService;
import example.module.gallery.service.IGetPhotosService;
import example.module.gallery.vo.PhotoVO;

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
		this.setConfiguration( new HTTPServiceConfiguration("https://api.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&api_key=bea408401b4a7db42ec4f8a2728736a1&user_id=134406781%40N06&format=json") );
		this.setParser( new FlickrPhotosParser() );
	}
	
	public function getPhotos():Array<PhotoVO> 
	{
		return this._result;
	}
	
}