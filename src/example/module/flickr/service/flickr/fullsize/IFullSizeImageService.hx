package example.module.flickr.service.flickr.fullsize;

import example.module.flickr.vo.FlickrPhotoSizeVO;
import example.module.flickr.vo.FlickrPhotoVO;
import hex.service.*;
import hex.service.stateless.http.*;

/**
 * @author azoldesi
 */
interface IFullSizeImageService extends IHTTPService<HTTPServiceConfiguration>
{
	function getFullSizeImage(): ServiceResultVO<FlickrPhotoSizeVO>;
}