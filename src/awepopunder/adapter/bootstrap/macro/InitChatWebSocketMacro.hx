package awepopunder.adapter.bootstrap.macro;

import awepopunder.adapter.bootstrap.controller.ConnectChatWebSocketCommand;
import awepopunder.vo.performer.PerformerDataVO;
import awepopunder.vo.settings.application.ApplicationSettingsVO;
import hex.control.macro.Macro;
import hex.control.payload.ExecutionPayload;

/**
 * ...
 * @author 
 */
class InitChatWebSocketMacro extends Macro
{
	@inject
	public var settings:ApplicationSettingsVO;
	
	@inject
	public var performerData:PerformerDataVO;

	override function _prepare():Void 
	{
		this.add(ConnectChatWebSocketCommand).withPayloads([new ExecutionPayload(settings, ApplicationSettingsVO)]);
		this.add(SubscribeChatRoomCommand).withPayloads([new ExecutionPayload(performerData, PerformerDataVO)]);
	}
	
}