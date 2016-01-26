package awepopunder.adapter.chat;

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
	
	/*function onAdapt( roomName:String, sender:String, message:String ):ChatMessageVO
	{
		var chatMessageVO= new ChatMessageVO();
		chatMessageVO.message = message;
		chatMessageVO.userNick = sender;
		return chatMessageVO;
	}*/
	
	function onAdapt( rest:Array<Dynamic> ):ChatMessageVO
	{
		//TODO: really do i have to accept an array instead of concrete params?k
		
		var chatMessageVO= new ChatMessageVO();
		chatMessageVO.message = rest[2];
		chatMessageVO.userNick = rest[1];
		return chatMessageVO;
	}
	
}