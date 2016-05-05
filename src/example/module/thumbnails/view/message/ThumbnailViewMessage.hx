package example.module.thumbnails.view.message;

import hex.event.MessageType;

/**
 * ...
 * @author azoldesi
 */
class ThumbnailViewMessage
{
	static public var THUMBNAIL_CLICKED = new MessageType( "thumbnail-click" );
	static public var LOAD_THUMBNAILS = new MessageType("view-load-thumbnails");
}