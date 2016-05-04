package example.service.flickr;

import promhx.Promise;
import example.vo.image.ImageVO;
import example.vo.flickr.list.FlickrPhotoVO;
import example.vo.flickr.size.*;
import hex.service.stateless.*;
import hex.service.ServiceConfiguration;

/**
 * @author azoldesi
 */
interface IImageDataService extends IAsyncStatelessService<ServiceConfiguration>
{
	function getRandomImage(): Promise<FlickrPhotoVO>;
	
	function getFullSizeImage(imageId: String): Promise<FlickrPhotoSizeVO>;
	
	function getThumbnailImages(count: Int): Promise<Array<ImageVO>>;
}