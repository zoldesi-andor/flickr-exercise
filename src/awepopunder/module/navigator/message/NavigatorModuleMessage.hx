package awepopunder.module.navigator.message;
import hex.event.MessageType;

/**
 * ...
 * @author Chris
 */
class NavigatorModuleMessage
{

	public static var SET_NAVIGATOR_SETTINGS:MessageType = new MessageType("setNavigatorSettings");

	public static var SET_CURRENT_PERFORMER:MessageType = new MessageType("setCurrentPerformer");
	
	public static var NAVIGATE_TO:MessageType = new MessageType("navigateTo");
	
}