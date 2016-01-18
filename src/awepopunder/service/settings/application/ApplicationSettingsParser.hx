package awepopunder.service.settings.application;

import awepopunder.parser.base.AweServiceParser;
import awepopunder.vo.settings.application.ApplicationSettingsVO;

/**
 * ...
 * @author duke
 */
class ApplicationSettingsParser extends AweServiceParser<ApplicationSettingsVO>
{

	public function new() 
	{
		super();
	}
	
	override private function _parseData(data:Dynamic):ApplicationSettingsVO 
	{
		var result:ApplicationSettingsVO = new ApplicationSettingsVO();
		
		var chatServiceAddressArr:Array<String> = cast(data.chatServiceAddress, String).split(":");
		
		result.chatHost = chatServiceAddressArr[0];
		result.chatPort = Std.parseInt(chatServiceAddressArr[1]);
		
		result.maxAppletCount = data.maxAppletCount;
		result.autoPerformerSwitchLimit = data.reloadCount;
		result.manualPerformerSwitchLimit = data.maxJSReloadCount;
		
		return result;
	}
	
}