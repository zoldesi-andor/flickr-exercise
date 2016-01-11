package awepopunder.vo.settings.application;
import awepopunder.module.layout.constant.ChatMode;
import awepopunder.module.layout.constant.LayoutMode;

/**
 * ...
 * @author duke
 */
class LayoutSettingsVO
{
	public var layoutMode:LayoutMode;
	public var chatMode:ChatMode;
	public var backgroundColor:String;
	public var width:UInt;
	public var height:UInt;
	public var rootElementId:String;

	public function new() 
	{
		
	}
	
}