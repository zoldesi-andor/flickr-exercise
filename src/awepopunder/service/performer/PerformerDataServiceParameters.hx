package awepopunder.service.performer;

import hex.service.stateless.http.HTTPServiceParameters;

/**
 * ...
 * @author duke
 */
class PerformerDataServiceParameters extends HTTPServiceParameters
{
	public var streamData:UInt;
	public var site:String;
	public var banList:String;
	public var tid:String;
	public var category:String;

	public function new( category:String = null, tid:String = null, banList:String = null, site:String = null, streamData:UInt = 1) 
	{
		super();
		
		this.streamData = streamData;
		this.site = site;
		this.banList = banList;
		this.tid = tid;
		this.category = category;
		
	}
	
}