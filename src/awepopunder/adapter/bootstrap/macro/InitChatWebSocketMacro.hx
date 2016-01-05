package awepopunder.adapter.bootstrap.macro;

import awepopunder.adapter.bootstrap.controller.ConnectChatWebSocketCommand;
import hex.control.macro.Macro;

/**
 * ...
 * @author 
 */
class InitChatWebSocketMacro extends Macro
{

	override function _prepare():Void 
	{
		this.add(ConnectChatWebSocketCommand);
		this.add(SubscribeChatRoomCommand);
	}
	
}