package awepopunder.service.performer;

import hex.service.stateless.http.HTTPServiceParameters;

/**
 * ...
 * @author duke
 */
class PerformerDataServiceParameters extends HTTPServiceParameters
{
	public var category:String;
	public var site:String;
	public var performerId:String;
	public var tid:String;
	public var banList:String;
	public var streamData:UInt;

	/**
	 * 
	 * @param	category Category
	 * @param	site Site
	 * @param	performerId Performer ID
	 * @param	tid TemplateId
	 * @param	banList Filter out these performers
	 * @param	streamData We need the streamRatio and other stream information
	 */
	public function new( category:String = "", site:String = "", performerId:String = "", tid:String = "", banList:String = "", streamData:UInt = 1) 
	{
		super();
		
		this.category = category;
		this.site = site;
		this.performerId = performerId;
		this.tid = tid;
		this.banList = banList;
		this.streamData = streamData;
	}
}