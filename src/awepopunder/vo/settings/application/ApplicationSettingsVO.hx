package awepopunder.vo.settings.application;

/**
 * ...
 * @author duke
 */
class ApplicationSettingsVO
{
	public var site:String;
	public var maxAppletCount:UInt;
	public var reloadCount:UInt;
	public var maxNextPerformerCount:UInt;
	
	public var chatHost:String;
	public var chatPort:UInt;
	public var chatPath:String = "docler-ws";
	public var chatResource:String = "js-client";
	public var chatRoomHost:String = "jasmin.com";

	public function new() 
	{
		
	}
	
}