package example.service.flickr;

import hex.data.IParser;
import hex.service.ServiceConfiguration;
import hex.service.stateless.StatelessService;

/**
 * ...
 * @author Andrei Bunulu
 */
class FlickrGetPhotos extends StatelessService<ServiceConfiguration> implements IFlickrGetPhotos
{

	public function new() 
	{
		super();
		trace("FlickrGetPhotos constructor");
		//todo Francis why StatelessService is instansted at initialisation.
		
	}
	
	@PostConstruct
	override public function createConfiguration() : Void
	{
		trace("FlickrGetPhotos createConfiguration");
		this.setConfiguration( new ServiceConfiguration() );
	}
	
	public function getPhotos():Array<String> 
	{
		return [""];
	}
	
}