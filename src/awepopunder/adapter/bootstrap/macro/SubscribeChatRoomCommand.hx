package awepopunder.adapter.bootstrap.macro;

import com.service.net.chatwebsocket.event.SubscribeRoomResultEvent;
import com.service.net.chatwebsocket.IChatWebSocketService;
import hex.control.async.AsyncCommand;
import hex.event.IEvent;

/**
 * ...
 * @author 
 */
@:rtti
class SubscribeChatRoomCommand extends AsyncCommand
{
	@inject("name=chatWebSocketService")
	public var webSocketService:IChatWebSocketService;

	override public function execute(?e:IEvent):Void 
	{
		this.webSocketService.addSubscribeRoomResultHandler(this.onSubscribeRoomResult);
		
		//TODO: get the properties from configuration
		this.webSocketService.subscribeRoom("hostTest", "admintest");
	}
	
	private function onSubscribeRoomResult(e:SubscribeRoomResultEvent):Void 
	{
		this.webSocketService.removeSubscribeRoomResultHandler(this.onSubscribeRoomResult);
		
		if ( e.success )
		{
			this._handleComplete( );
		}
		else
		{
			this._handleFail( );
		}
	}
	
}