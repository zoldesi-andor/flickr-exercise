package example.service.image;

import promhx.Promise;
import promhx.Stream;
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
	function getRandomImage(): Promise<ImageVO>;
	
	function getFullSizeImage(imageId: String): Promise<FlickrPhotoSizeVO>;
	
	function getThumbnailImages(count: Int): Stream<ImageVO>;
}