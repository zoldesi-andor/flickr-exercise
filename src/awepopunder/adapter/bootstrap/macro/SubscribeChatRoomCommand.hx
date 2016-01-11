package awepopunder.adapter.bootstrap.macro;

import awepopunder.vo.performer.PerformerDataVO;
import awepopunder.vo.settings.application.ApplicationSettingsVO;
import awepopunder.vo.settings.application.InitialApplicationSettingsVO;
import com.service.net.chatwebsocket.event.SubscribeRoomResultEvent;
import com.service.net.chatwebsocket.IChatWebSocketService;
import hex.control.async.AsyncCommand;
import hex.event.IEvent;

/**
 * ...
 * @author 
 */
@:rtti
class SubscribeChatRoomCommand extends AsyncCommand
{
	@inject("name=chatWebSocketService")
	public var webSocketService:IChatWebSocketService;
	
	@inject("name=initialApplicationSettings")
	public var initialApplicationSettings:InitialApplicationSettingsVO;
	
	@inject
	public var performerData:PerformerDataVO;

	override public function execute(?e:IEvent):Void 
	{
		this.webSocketService.addSubscribeRoomResultHandler(this.onSubscribeRoomResult);
		
		//TODO: get the properties from configuration
		this.webSocketService.subscribeRoom( this.performerData.performerId, this.initialApplicationSettings.siteSettings.sessionId);
	}
	
	private function onSubscribeRoomResult(e:SubscribeRoomResultEvent):Void 
	{
		this.webSocketService.removeSubscribeRoomResultHandler(this.onSubscribeRoomResult);
		
		if ( e.success )
		{
			this._handleComplete( );
		}
		else
		{
			this._handleFail( );
		}
	}
	
}