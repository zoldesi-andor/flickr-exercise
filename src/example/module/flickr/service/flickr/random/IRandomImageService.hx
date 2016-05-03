package example.module.flickr.service.flickr.random;

import example.module.flickr.vo.FlickrPhotoSizeVO;
import example.module.flickr.vo.FlickrPhotoVO;
import hex.service.*;
import hex.service.stateless.http.*;

/**
 * @author azoldesi
 */
interface IRandomImageService extends IHTTPService<HTTPServiceConfiguration>
{
	function getRandomImage(): ServiceResultVO<FlickrPhotoVO>;
}