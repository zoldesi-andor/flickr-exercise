package awepopunder.adapter.switchperformer.controller;

import awepopunder.vo.performer.PerformerDataVO;
import com.module.chat.chatbox.IChatBoxModule;
import com.vo.chat.ChatMessageVO;
import hex.control.Request;
import hex.control.command.BasicCommand;

/**
 * ...
 * @author duke
 */
@:rtti
class ShowChatWelcomeMessageCommand extends BasicCommand
{
	@Inject("name=chatBoxModule")
	public var chatBoxModule:IChatBoxModule;
	
	@Inject
	public var performerData:PerformerDataVO;
	
	override public function execute(?request:Request):Void 
	{
		//TODO: get it from translation
		var chatMessage = new ChatMessageVO();
		chatMessage.message = "Welcome to " + this.performerData.performerId + "'s Video Chat!\nHere You can watch the Performer's free, live camera feed!";
		
		this.chatBoxModule.addNewLine( chatMessage );
	}
	
}