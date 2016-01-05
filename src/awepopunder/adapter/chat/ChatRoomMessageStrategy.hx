package awepopunder.adapter.chat;

import com.service.net.chatwebsocket.event.ReceivedRoomMessageEvent;
import com.vo.chat.ChatMessageVO;
import hex.event.AdapterStrategy;

/**
 * ...
 * @author 
 */
@:rtti
class ChatRoomMessageStrategy extends AdapterStrategy
{

	public function new(target:Dynamic, method:Dynamic) 
	{
		super(this, this.onAdapt);
		
	}
	
	private function onAdapt( args : Array<Dynamic> ):ChatMessageVO
	{
		//TODO: really do i have to accept an array instead of concrete params?
		var event:ReceivedRoomMessageEvent = args[0];
		var chatMessageVO:ChatMessageVO = new ChatMessageVO();
		chatMessageVO.message = event.message;
		chatMessageVO.userNick = event.sender;
		return chatMessageVO;
	}
	
}