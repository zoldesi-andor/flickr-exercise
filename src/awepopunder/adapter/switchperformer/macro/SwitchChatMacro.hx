package awepopunder.adapter.switchperformer.macro;

import awepopunder.adapter.switchperformer.controller.ClearChatMessagesCommand;
import awepopunder.adapter.switchperformer.controller.ShowChatWelcomeMessageCommand;
import awepopunder.adapter.switchperformer.controller.SubscribeChatRoomCommand;
import awepopunder.adapter.switchperformer.controller.UnsubscribeChatRoomCommand;
import awepopunder.vo.performer.PerformerDataVO;
import hex.control.macro.Macro;
import hex.control.payload.ExecutionPayload;

/**
 * ...
 * @author duke
 */
class SwitchChatMacro extends Macro
{
	@Inject
	public var performerData:PerformerDataVO;
	
	@Inject("previous")
	public var previousPerformerData:PerformerDataVO;

	override function _prepare():Void 
	{
		#if debug
		hex.log.Logger.DEBUG("SwitchChatMacro._prepare");
		#end
		
		if ( this.previousPerformerData.performerId != null )
		{
			this.add(UnsubscribeChatRoomCommand).withPayloads([new ExecutionPayload(this.previousPerformerData, PerformerDataVO)]);
		}
		
		var performerDataPayload = new ExecutionPayload(this.performerData, PerformerDataVO);
		
		this.add(ClearChatMessagesCommand);
		this.add(SubscribeChatRoomCommand).withPayloads([performerDataPayload]);
		this.add(ShowChatWelcomeMessageCommand).withPayloads([performerDataPayload]);
	}
	
}