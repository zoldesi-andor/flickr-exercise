package awepopunder.adapter.bootstrap.controller;

import com.service.net.chatwebsocket.ChatWebSocketServiceConfiguration;
import com.service.net.chatwebsocket.IChatWebSocketService;
import hex.control.command.BasicCommand;
import hex.event.IEvent;

/**
 * ...
 * @author 
 */
@:rtti
class ConnectChatWebSocketCommand extends BasicCommand
{
	@inject
	public var webSocketService:IChatWebSocketService;

	override public function execute(?e:IEvent):Void 
	{
		//TODO: read params from configuration
		this.webSocketService.setConfiguration( new ChatWebSocketServiceConfiguration("jasmin.com", "js-client", "192.168.0.79", 5280, "docler-ws") );
		this.webSocketService.connect();
	}
	
}