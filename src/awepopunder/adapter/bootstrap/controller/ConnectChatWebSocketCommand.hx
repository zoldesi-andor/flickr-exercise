package awepopunder.adapter.bootstrap.controller;

import com.service.net.chatwebsocket.ChatWebSocketServiceConfiguration;
import com.service.net.chatwebsocket.IChatWebSocketService;
import com.service.net.websocket.event.WebSocketServiceEventType;
import hex.control.async.AsyncCommand;
import hex.event.BasicEvent;
import hex.event.IEvent;

/**
 * ...
 * @author 
 */
@:rtti
class ConnectChatWebSocketCommand extends AsyncCommand
{
	@inject("name=chatWebSocketService")
	public var webSocketService:IChatWebSocketService;

	override public function execute(?e:IEvent):Void 
	{
		//TODO: read params from configuration
		this.webSocketService.setConfiguration( new ChatWebSocketServiceConfiguration("jasmin.com", "js-client", "192.168.0.79", 5280, "docler-ws") );
		
		this.webSocketService.addHandler( WebSocketServiceEventType.CONNECTED, this._onWebSocketServiceConnected );
		this.webSocketService.addHandler( WebSocketServiceEventType.ERROR, this._onWebSocketServiceFailed );
		this.webSocketService.addHandler( WebSocketServiceEventType.CLOSED, this._onWebSocketServiceFailed );
		
		this.webSocketService.connect();
	}
	
	private function _onWebSocketServiceConnected( e:BasicEvent ):Void
	{
		this._handleComplete();
	}
	
	private function _onWebSocketServiceFailed( e:BasicEvent ):Void
	{
		this._handleFail();
	}
	
	override function _release():Void 
	{
		this.webSocketService.removeHandler( WebSocketServiceEventType.CONNECTED, this._onWebSocketServiceConnected );
		this.webSocketService.removeHandler( WebSocketServiceEventType.ERROR, this._onWebSocketServiceFailed );
		this.webSocketService.removeHandler( WebSocketServiceEventType.CLOSED, this._onWebSocketServiceFailed );
		
		super._release();
	}
	
}