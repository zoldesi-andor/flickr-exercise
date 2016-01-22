package awepopunder.adapter.switchperformer.controller;

import com.module.chat.chatbox.IChatBoxModule;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author duke
 */
@:rtti
class ClearChatMessagesCommand extends BasicCommand
{
	@Inject("name=chatBoxModule")
	public var chatBoxModule:IChatBoxModule;
	
	override public function execute(?request:Request):Void 
	{
		this.chatBoxModule.clear( );
	}
	
}