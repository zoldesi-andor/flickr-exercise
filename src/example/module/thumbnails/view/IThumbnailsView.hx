package example.module.thumbnails.view;

import example.module.thumbnails.model.IThumbnailModelRO;
import example.vo.image.ImageVO;
import hex.event.MessageType;
import hex.view.IView;

/**
 * @author azoldesi
 */
interface IThumbnailsView extends IView
{
	function createThumbnail(thumbnail: IThumbnailModelRO): Void;
	
	function addHandler(messageType:MessageType, scope:Dynamic, callback:Dynamic):Bool;
	
	function removeHandler(messageType:MessageType, scope:Dynamic, callback:Dynamic):Bool;
}