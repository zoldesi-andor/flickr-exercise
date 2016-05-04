package example.service.flickr;

import promhx.Promise;
import example.vo.image.ImageVO;

/**
 * @author azoldesi
 */
interface IImageDataSource 
{
	function getRandomImage(): Promise<ImageVO>;
	
	function getFullSizeImage(imageId: String): Promise<ImageVO>;
	
	function getThumbnailImages(count: Int): Promise<Array<ImageVO>>;
}