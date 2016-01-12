package awepopunder.adapter.bootstrap.controller;

import awepopunder.vo.settings.application.ApplicationSettingsVO;
import com.service.net.chatwebsocket.ChatWebSocketServiceConfiguration;
import com.service.net.chatwebsocket.IChatWebSocketService;
import com.service.net.websocket.message.WebSocketServiceMessage;
import hex.control.async.AsyncCommand;
import hex.control.Request;
import hex.event.BasicEvent;

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

	override public function execute( ?request : Request ):Void
	{
		this.chatWebSocketService.addHandler( WebSocketServiceMessage.CONNECTED, this, this._onWebSocketServiceConnected );
		this.chatWebSocketService.addHandler( WebSocketServiceMessage.ERROR, this, this._onWebSocketServiceFailed );
		this.chatWebSocketService.addHandler( WebSocketServiceMessage.CLOSED, this, this._onWebSocketServiceFailed );
		
		var config:ChatWebSocketServiceConfiguration = cast this.chatWebSocketService.getConfiguration();
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
		this.chatWebSocketService.removeHandler( WebSocketServiceMessage.CONNECTED, this, this._onWebSocketServiceConnected );
		this.chatWebSocketService.removeHandler( WebSocketServiceMessage.ERROR, this, this._onWebSocketServiceFailed );
		this.chatWebSocketService.removeHandler( WebSocketServiceMessage.CLOSED, this, this._onWebSocketServiceFailed );
		
		super._release();
	}
	
}