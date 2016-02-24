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
	var _performerData:PerformerDataVO;
	var _filterSettings:FilterSettingsVO;
	var _site:String;
	var _autoPerformerSwitchCount:UInt = 0;
	var _autoPerformerSwitchLimit:Int = -1;
	var _manualPerformerSwitchCount:UInt = 0;
	var _manualPerformerSwitchLimit:Int = -1;

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
	
	public function increaseAutoPerformerSwitchCount( ):Void
	{
		this._autoPerformerSwitchCount++;
	}
	
	public function setAutoPerformerSwitchLimit( value:Int ):Void
	{
		this._autoPerformerSwitchLimit = value;
	}
		
	public function isAutoPerformerSwitchLimitReached():Bool 
	{
		return this._autoPerformerSwitchLimit > -1 && this._autoPerformerSwitchCount >= this._autoPerformerSwitchLimit;
	}
	
	public function increaseManualPerformerSwitchCount( ):Void
	{
		this._manualPerformerSwitchCount++;
	}
	
	public function setManualPerformerSwitchLimit( value:Int ):Void 
	{
		this._manualPerformerSwitchLimit = value;
	}
	
	public function isManualPerformerSwitchLimitReached():Bool 
	{
		return this._manualPerformerSwitchLimit > -1 && this._manualPerformerSwitchCount >= this._manualPerformerSwitchLimit;
	}
}