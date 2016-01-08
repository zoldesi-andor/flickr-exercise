package awepopunder.service.settings.application;

import awepopunder.vo.settings.application.ApplicationSettingsVO;
import hex.parser.JsonResultParser;

/**
 * ...
 * @author duke
 */
class ApplicationSettingsParser extends JsonResultParser<ApplicationSettingsVO>
{

	public function new() 
	{
		super();
	}
	
	override function _parseData(data:Dynamic):Dynamic 
	{
		var result:ApplicationSettingsVO = new ApplicationSettingsVO();
		
		var chatServiceAddressArr:Array<String> = cast(data.chatServiceAddress, String).split(":");
		
		result.chatHost = chatServiceAddressArr[0];
		result.chatPort = Std.parseInt(chatServiceAddressArr[1]);
		
		result.maxAppletCount = data.maxAppletCount;
		result.reloadCount = data.reloadCount;
		result.maxNextPerformerCount = data.maxJSReloadCount;
		
		return result;
	}
	
}