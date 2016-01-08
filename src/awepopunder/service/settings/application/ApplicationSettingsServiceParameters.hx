package awepopunder.service.settings.application;

import hex.service.stateless.http.HTTPServiceParameters;

/**
 * ...
 * @author duke
 */
class ApplicationSettingsServiceParameters extends HTTPServiceParameters
{
	public var cobrandId:String;
	public var language:String;
	public var site:String;
	public var type:String;

	public function new( cobrandId:String = null, language:String = null, site:String = null, type:String = null) 
	{
		super();
		this.cobrandId = cobrandId;
		this.language = language;
		this.site = site;
		this.type = type;
	}
	
}