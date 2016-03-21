package awepopunder.adapter.switchperformer.controller;

import com.module.chat.chatbox.IChatBoxModule;
import hex.control.command.BasicCommand;
import hex.control.Request;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author duke
 */
class ClearChatMessagesCommand extends BasicCommand implements ISpeedInjectorContainer
{
	@Inject("chatBoxModule")
	public var chatBoxModule:IChatBoxModule;
	
	override public function execute(?request:Request):Void 
	{
		#if debug
		hex.log.Logger.DEBUG("ClearChatMessagesCommand.execute");
		#end
		
		this.chatBoxModule.clear( );
	}
	
}