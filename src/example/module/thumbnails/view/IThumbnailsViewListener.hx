package example.module.thumbnails.view;
import example.vo.image.ImageVO;
import hex.control.request.StringRequest;

/**
 * @author azoldesi
 */
interface IThumbnailsViewListener 
{
	function onThumbnailClicked(imageId: StringRequest): Void;
}