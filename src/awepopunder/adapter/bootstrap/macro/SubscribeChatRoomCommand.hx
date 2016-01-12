package awepopunder.adapter.bootstrap.macro;

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
	@inject("name=chatWebSocketService")
	public var webSocketService:IChatWebSocketService;
	
	@inject("name=initialApplicationSettings")
	public var initialApplicationSettings:InitialApplicationSettingsVO;
	
	@inject
	public var performerData:PerformerDataVO;

	override public function execute( ?request : Request ):Void 
	{
		this.webSocketService.addHandler( ChatWebSocketServiceMessage.SUBSCRIBE_ROOM_RESULT, this, this.onSubscribeRoomResult);
		
		//TODO: get the properties from configuration
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