package example.module.flickr.service.flickr.fullsize;

import example.module.flickr.vo.*;

import hex.core.IAnnotationParsable;
import hex.service.Service;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.ServiceResultVO;

/**
 * ...
 * @author azoldesi
 */
class  FullSizeImageService extends HTTPService<HTTPServiceConfiguration> implements IFullSizeImageService implements IAnnotationParsable
{
	public function new() 
	{
		super();
	}
	
	@PostConstruct
	override public function createConfiguration() : Void
	{
		this.setConfiguration( new HTTPServiceConfiguration("https://api.flickr.com/services/rest/") );
		this.setParser( new FullSizeImageDataParser() );
	}
	
	public function getFullSizeImage(): ServiceResultVO<FlickrPhotoSizeVO>
	{
		return this._result;
	}
}