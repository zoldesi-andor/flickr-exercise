package awepopunder.adapter.switchperformer.controller;

import awepopunder.vo.performer.PerformerDataVO;
import awepopunder.vo.settings.application.InitialApplicationSettingsVO;
import com.service.net.chatwebsocket.IChatWebSocketService;
import com.service.net.chatwebsocket.message.ChatWebSocketServiceMessage;
import hex.control.async.AsyncCommand;
import hex.control.Request;

/**
 * ...
 * @author 
 */
@:rtti
class SubscribeChatRoomCommand extends AsyncCommand
{
	@Inject("name=chatWebSocketService")
	public var webSocketService:IChatWebSocketService;
	
	@Inject("name=initialApplicationSettings")
	public var initialApplicationSettings:InitialApplicationSettingsVO;
	
	@Inject
	public var performerData:PerformerDataVO;

	override public function execute( ?request : Request ):Void 
	{
		this.webSocketService.addHandler( ChatWebSocketServiceMessage.SUBSCRIBE_ROOM_RESULT, this, this.onSubscribeRoomResult);
		
		this.webSocketService.subscribeRoom( this.performerData.performerId, this.initialApplicationSettings.siteSettings.sessionId);
	}
	
	private function onSubscribeRoomResult( nick:String, success:Bool, errorMsg:UInt ):Void 
	{
		this.webSocketService.removeHandler( ChatWebSocketServiceMessage.SUBSCRIBE_ROOM_RESULT, this, this.onSubscribeRoomResult);
		
		if ( success )
		{
			this._handleComplete( );
		}
		else
		{
			this._handleFail( );
		}
	}
	
}