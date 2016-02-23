package awepopunder.adapter.bootstrap.controller;

import awepopunder.vo.settings.application.ApplicationSettingsVO;
import awepopunder.vo.settings.application.InternalApplicationSettingsVO;
import com.service.net.chatwebsocket.ChatWebSocketServiceConfiguration;
import com.service.net.chatwebsocket.IChatWebSocketService;
import com.service.net.websocket.message.WebSocketServiceMessage;
import hex.control.Request;
import hex.control.command.BasicCommand;
import hex.event.BasicEvent;

/**
 * ...
 * @author 
 */
@:rtti
class ConnectChatWebSocketCommand extends BasicCommand
{
	@Inject("name=chatWebSocketService")
	public var chatWebSocketService:IChatWebSocketService;
	
	@Inject("name=internalApplicationSettings")
	public var internalApplicationSettings:InternalApplicationSettingsVO;
	
	@Inject
	public var settings:ApplicationSettingsVO;

	override public function execute( ?request : Request ):Void
	{
		/*this.chatWebSocketService.addHandler( WebSocketServiceMessage.CONNECTED, this, this._onWebSocketServiceConnected );
		this.chatWebSocketService.addHandler( WebSocketServiceMessage.ERROR, this, this._onWebSocketServiceFailed );
		this.chatWebSocketService.addHandler( WebSocketServiceMessage.CLOSED, this, this._onWebSocketServiceFailed );*/
		
		var config:ChatWebSocketServiceConfiguration = this.chatWebSocketService.getConfiguration();
		config.host = this.settings.chatHost;
		config.port = this.settings.chatPort;
		config.path = this.internalApplicationSettings.chatPath;
		config.resource = this.internalApplicationSettings.chatResource;
		config.roomHost = this.internalApplicationSettings.chatRoomHost;
		
		this.chatWebSocketService.connect();
	}
	
	/*function _onWebSocketServiceConnected( e:BasicEvent ):Void
	{
		this._handleComplete();
	}
	
	function _onWebSocketServiceFailed( e:BasicEvent ):Void
	{
		this._handleFail();
	}
	
	override function _release():Void 
	{
		this.chatWebSocketService.removeHandler( WebSocketServiceMessage.CONNECTED, this, this._onWebSocketServiceConnected );
		this.chatWebSocketService.removeHandler( WebSocketServiceMessage.ERROR, this, this._onWebSocketServiceFailed );
		this.chatWebSocketService.removeHandler( WebSocketServiceMessage.CLOSED, this, this._onWebSocketServiceFailed );
		
		super._release();
	}*/
	
}