package example.service.flickr.random;

import example.vo.flickr.size.FlickrPhotoSizeVO;
import example.vo.flickr.list.FlickrPhotoVO;
import hex.service.*;
import hex.service.stateless.http.*;

/**
 * @author azoldesi
 */
interface IRandomImageService extends IHTTPService<HTTPServiceConfiguration>
{
	function getRandomImage(): ServiceResultVO<FlickrPhotoVO>;
}