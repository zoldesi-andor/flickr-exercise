package awepopunder.module.layout.message;
import hex.event.MessageType;

/**
 * ...
 * @author duke
 */
class LayoutModuleMessage
{
	static public var ONLINE:MessageType = new MessageType("online");
	static public var OFFLINE:MessageType = new MessageType("offline");
	public static var LAYOUT_MODE_CHANGED:MessageType = new MessageType("layoutModeChanged");
	
}