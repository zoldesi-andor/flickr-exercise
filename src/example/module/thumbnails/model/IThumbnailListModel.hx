package example.module.thumbnails.model;
import example.vo.image.ImageVO;

/**
 * ...
 * @author azoldesi
 */
interface IThumbnailListModel extends IThumbnailListModelRO
{
	function createThumbnail(images:ImageVO): Void;
}