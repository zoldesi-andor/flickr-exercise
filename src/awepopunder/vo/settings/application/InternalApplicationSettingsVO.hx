package awepopunder.vo.settings.application;
import com.module.asset.urlprovider.vo.UrlVO;

/**
 * ...
 * @author 
 */
class InternalApplicationSettingsVO
{
	public var appletUrl:Map<String, UrlVO> = AppletUrlVO.urlList;
	
	public var chatPath:String = "docler-ws";
	public var chatResource:String = "js-client";
	public var chatRoomHost:String = "jasmin.com";

	public function new() 
	{
		
	}
	
}