package awepopunder.vo.settings.application;

/**
 * ...
 * @author 
 */
class InternalApplicationSettingsVO
{
	public var appletUrl:AppletUrlVO = new AppletUrlVO();
	
	public var chatPath:String = "docler-ws";
	public var chatResource:String = "js-client";
	public var chatRoomHost:String = "jasmin.com";

	public function new() 
	{
		
	}
	
}