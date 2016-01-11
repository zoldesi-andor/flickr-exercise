package awepopunder.adapter.bootstrap.controller;

import awepopunder.vo.settings.application.ApplicationSettingsVO;
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
	public var chatWebSocketService:IChatWebSocketService;
	
	@inject
	public var settings:ApplicationSettingsVO;

	override public function execute(?e:IEvent):Void
	{
		this.chatWebSocketService.addHandler( WebSocketServiceEventType.CONNECTED, this._onWebSocketServiceConnected );
		this.chatWebSocketService.addHandler( WebSocketServiceEventType.ERROR, this._onWebSocketServiceFailed );
		this.chatWebSocketService.addHandler( WebSocketServiceEventType.CLOSED, this._onWebSocketServiceFailed );
		
		var config:ChatWebSocketServiceConfiguration = this.chatWebSocketService.getConfiguration();
		config.host = settings.chatHost;
		config.port = settings.chatPort;
		config.path = settings.chatPath;
		config.resource = settings.chatResource;
		config.roomHost = settings.chatRoomHost;
		
		this.chatWebSocketService.connect();
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
		this.chatWebSocketService.removeHandler( WebSocketServiceEventType.CONNECTED, this._onWebSocketServiceConnected );
		this.chatWebSocketService.removeHandler( WebSocketServiceEventType.ERROR, this._onWebSocketServiceFailed );
		this.chatWebSocketService.removeHandler( WebSocketServiceEventType.CLOSED, this._onWebSocketServiceFailed );
		
		super._release();
	}
	
}