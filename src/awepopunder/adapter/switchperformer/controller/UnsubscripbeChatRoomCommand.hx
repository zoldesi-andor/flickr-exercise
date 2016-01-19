package awepopunder.adapter.switchperformer.controller;

import awepopunder.vo.performer.PerformerDataVO;
import com.service.net.chatwebsocket.IChatWebSocketService;
import com.service.net.chatwebsocket.message.ChatWebSocketServiceMessage;
import hex.control.async.AsyncCommand;
import hex.control.Request;

/**
 * ...
 * @author duke
 */
@:rtti
class UnsubscripbeChatRoomCommand extends AsyncCommand
{

	@inject("name=chatWebSocketService")
	public var webSocketService:IChatWebSocketService;
	
	@inject
	public var performerData:PerformerDataVO;

	override public function execute( ?request : Request ):Void 
	{
		this.webSocketService.addHandler( ChatWebSocketServiceMessage.UNSUBSCRIBE_ROOM_RESULT, this, this.onUnsubscribeRoomResult);
		
		this.webSocketService.unsubscribeRoom( this.performerData.performerId);
	}
	
	private function onUnsubscribeRoomResult( nick:String, success:Bool, errorMsg:UInt ):Void 
	{
		this.webSocketService.removeHandler( ChatWebSocketServiceMessage.UNSUBSCRIBE_ROOM_RESULT, this, this.onUnsubscribeRoomResult);
		
		if ( success )
		{
			this._handleComplete( );
		}
		else
		{
			trace("UnsubscripbeChatRoomCommand.onUnsubscribeRoomResult Failed from unsubscribe from the following room: " + this.performerData.performerId);
			this._handleComplete( );
			//this._handleFail( );
		}
	}
	
}