package awepopunder.adapter.switchperformer.controller;

import awepopunder.vo.performer.PerformerDataVO;
import com.service.net.chatwebsocket.IChatWebSocketService;
import com.service.net.chatwebsocket.message.ChatWebSocketServiceMessage;
import hex.control.async.AsyncCommand;
import hex.control.Request;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author duke
 */
class UnsubscribeChatRoomCommand extends AsyncCommand implements ISpeedInjectorContainer
{

	@Inject("chatWebSocketService")
	public var webSocketService:IChatWebSocketService;
	
	@Inject
	public var performerData:PerformerDataVO;

	override public function execute( ?request : Request ):Void 
	{
		#if debug
		hex.log.Logger.DEBUG("UnsubscribeChatRoomCommand.execute");
		#end
		
		this.webSocketService.addHandler( ChatWebSocketServiceMessage.UNSUBSCRIBE_ROOM_RESULT, this, this.onUnsubscribeRoomResult);
		
		this.webSocketService.unsubscribeRoom( this.performerData.performerId);
	}
	
	function onUnsubscribeRoomResult( nick:String, success:Bool, errorMsg:UInt ):Void 
	{
		this.webSocketService.removeHandler( ChatWebSocketServiceMessage.UNSUBSCRIBE_ROOM_RESULT, this, this.onUnsubscribeRoomResult);
		
		if ( success )
		{
			this._handleComplete( );
		}
		else
		{
			#if debug
			hex.log.Logger.DEBUG("UnsubscripbeChatRoomCommand.onUnsubscribeRoomResult Failed from unsubscribe from the following room: " + this.performerData.performerId);
			#end
			this._handleComplete( );
			//this._handleFail( );
		}
	}
	
}