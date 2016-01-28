package awepopunder.adapter.switchperformer.controller;

import com.service.net.chatwebsocket.IChatWebSocketService;
import hex.control.guard.IGuard;

/**
 * ...
 * @author duke
 */
@:rtti
class ConnectedToChatGuard implements IGuard
{
	@Inject("name=chatWebSocketService")
	public var webSocketService:IChatWebSocketService;

	public function new() 
	{
		
	}
	
	
	public function approve():Bool 
	{
		return this.webSocketService.inUse();
	}
	
}