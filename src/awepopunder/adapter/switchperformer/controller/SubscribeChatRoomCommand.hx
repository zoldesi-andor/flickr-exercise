package awepopunder.adapter.switchperformer.controller;

import awepopunder.vo.performer.PerformerDataVO;
import awepopunder.vo.settings.application.InitialApplicationSettingsVO;
import com.service.net.chatwebsocket.IChatWebSocketService;
import com.service.net.chatwebsocket.message.ChatWebSocketServiceMessage;
import hex.control.async.AsyncCommand;
import hex.control.Request;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author 
 */
class SubscribeChatRoomCommand extends AsyncCommand implements ISpeedInjectorContainer
{
	@Inject("chatWebSocketService")
	public var webSocketService:IChatWebSocketService;
	
	@Inject("initialApplicationSettings")
	public var initialApplicationSettings:InitialApplicationSettingsVO;
	
	@Inject
	public var performerData:PerformerDataVO;

	override public function execute( ?request : Request ):Void 
	{
		#if debug
		hex.log.Logger.DEBUG("SubscribeChatRoomCommand.execute");
		#end
		
		this.webSocketService.addHandler( ChatWebSocketServiceMessage.SUBSCRIBE_ROOM_RESULT, this, this.onSubscribeRoomResult);
		
		this.webSocketService.subscribeRoom( this.performerData.performerId, this.initialApplicationSettings.siteSettings.sessionId);
	}
	
	function onSubscribeRoomResult( nick:String, success:Bool, errorMsg:UInt ):Void 
	{
		this.webSocketService.removeHandler( ChatWebSocketServiceMessage.SUBSCRIBE_ROOM_RESULT, this, this.onSubscribeRoomResult);
		
		if ( success )
		{
			this._handleComplete( );
		}
		else
		{
			this._handleFail( );
		}
	}
	
}