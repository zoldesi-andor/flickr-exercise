package example.service.flickr.fullsize;

import example.vo.flickr.size.FlickrPhotoSizeVO;
import example.vo.flickr.list.FlickrPhotoVO;
import hex.service.*;
import hex.service.stateless.http.*;

/**
 * @author azoldesi
 */
interface IFullSizeImageService extends IHTTPService<HTTPServiceConfiguration>
{
	function getFullSizeImage(): ServiceResultVO<FlickrPhotoSizeVO>;
}