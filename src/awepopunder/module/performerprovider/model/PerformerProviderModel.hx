package awepopunder.module.performerprovider.model;
import awepopunder.vo.performer.PerformerDataVO;
import awepopunder.vo.settings.application.FilterSettingsVO;

/**
 * ...
 * @author 
 */
@:rtti
class PerformerProviderModel implements IPerformerProviderModel
{
	private var _performerData:PerformerDataVO;
	private var _filterSettings:FilterSettingsVO;
	private var _site:String;

	public function new() 
	{
		
	}
	
	public function setFilterSettings(value:FilterSettingsVO):Void 
	{
		this._filterSettings = value;
	}
	
	public function setSite(value:String):Void 
	{
		this._site = value;
	}
	
	public function getFilterSettings():FilterSettingsVO 
	{
		return this._filterSettings;
	}
	
	public function getSite():String 
	{
		return this._site;
	}
	
	public function getPerformerData():PerformerDataVO 
	{
		return this._performerData;
	}
	
	public function setPerformerData(value:PerformerDataVO):Void 
	{
		this._performerData = value;
	}
	
}