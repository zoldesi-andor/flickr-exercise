package example.module.thumbnails.view;
import example.vo.image.ImageVO;
import hex.control.request.StringRequest;
import hex.control.request.ValueRequest;

/**
 * @author azoldesi
 */
interface IThumbnailsViewListener 
{
	function onThumbnailClicked(imageId: ValueRequest<ImageVO>): Void;
}