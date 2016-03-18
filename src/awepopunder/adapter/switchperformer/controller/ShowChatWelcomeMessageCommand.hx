package awepopunder.adapter.switchperformer.controller;

import awepopunder.vo.performer.PerformerDataVO;
import com.module.chat.chatbox.IChatBoxModule;
import com.vo.chat.ChatMessageVO;
import hex.control.Request;
import hex.control.command.BasicCommand;
import hex.core.IAnnotationParsable;

/**
 * ...
 * @author duke
 */
@:rtti
class ShowChatWelcomeMessageCommand extends BasicCommand implements IAnnotationParsable
{
	@Inject("name=chatBoxModule")
	public var chatBoxModule:IChatBoxModule;
	
	@Inject
	public var performerData:PerformerDataVO;
	
	@language('welcome_text')
	var _welcomeMessage : String;
	
	override public function execute(?request:Request):Void 
	{
		#if debug
		hex.log.Logger.DEBUG("ShowChatWelcomeMessageCommand.execute");
		#end
		
		var chatMessage = new ChatMessageVO();
		
		var r = ~/{\$performerid}/g;
		chatMessage.message = r.replace(this._welcomeMessage, this.performerData.performerId);

		this.chatBoxModule.addNewLine( chatMessage );
	}
}