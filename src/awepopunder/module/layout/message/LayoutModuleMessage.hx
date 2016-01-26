package awepopunder.module.layout.message;
import hex.event.MessageType;

/**
 * ...
 * @author duke
 */
class LayoutModuleMessage
{
	static public var ONLINE= new MessageType("online");
	static public var OFFLINE= new MessageType("offline");
	static public var LAYOUT_MODE_CHANGED= new MessageType("layoutModeChanged");
	static public var STREAM_RATIO_CHANGED= new MessageType("streamRatioChanged");
	
}