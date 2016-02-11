package awepopunder.module.performerprovider.request;

import awepopunder.vo.settings.application.FilterSettingsVO;
import hex.control.Request;

/**
 * ...
 * @author 
 */
class SetFilterSettingsRequest extends Request
{
	public var filterSettings:FilterSettingsVO;
	public var site:String;

	public function new( filterSettings:FilterSettingsVO, site:String ) 
	{
		super();
		this.site = site;
		this.filterSettings = filterSettings;
		
	}
	
}