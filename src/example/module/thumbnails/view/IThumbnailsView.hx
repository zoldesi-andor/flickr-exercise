package example.module.thumbnails.view;

import example.module.thumbnails.model.IThumbnailModelRO;
import example.vo.image.ImageVO;
import hex.event.MessageType;
import hex.view.IView;
import promhx.Stream;

/**
 * @author azoldesi
 */
interface IThumbnailsView extends IView
{
	function getMaxThumbnailCount(): Int;
	
	function createThumbnail(thumbnail: IThumbnailModelRO): Void;
	
	var thumbnailClickStream(default, null): Stream<ImageVO>;
}