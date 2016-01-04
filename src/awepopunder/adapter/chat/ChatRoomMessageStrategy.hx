package awepopunder.adapter.chat;

import com.service.net.chatwebsocket.event.ReceivedRoomMessageEvent;
import com.vo.chat.ChatMessageVO;
import hex.event.AdapterStrategy;

/**
 * ...
 * @author 
 */
class ChatRoomMessageStrategy extends AdapterStrategy
{

	public function new(target:Dynamic, method:Dynamic) 
	{
		super(this, this.onAdapt);
		
	}
	
	private function onAdapt( event:ReceivedRoomMessageEvent ):ChatMessageVO
	{
		var chatMessageVO:ChatMessageVO = new ChatMessageVO();
		chatMessageVO.message = event.message;
		chatMessageVO.userNick = event.sender;
		
		return chatMessageVO;
	}
	
}