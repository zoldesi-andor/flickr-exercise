package awepopunder.adapter.switchperformer.controller;

import com.service.net.chatwebsocket.IChatWebSocketService;
import hex.control.guard.IGuard;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author duke
 */
class ConnectedToChatGuard implements IGuard implements ISpeedInjectorContainer
{
	@Inject("chatWebSocketService")
	public var webSocketService:IChatWebSocketService;

	public function new() 
	{
		
	}
	
	
	public function approve():Bool 
	{
		return this.webSocketService.inUse();
	}
	
}