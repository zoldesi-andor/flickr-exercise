package awepopunder.module.performerprovider;
import awepopunder.vo.performer.PerformerDataVO;
import awepopunder.vo.settings.application.FilterSettingsVO;
import hex.module.IModule;

/**
 * @author 
 */

interface IPerformerProviderModule extends IModule
{
	
	function setFilterSettings(filterSettings:FilterSettingsVO, site:String):Void;
	function loadNextPerformer():Void;
	function getActivePerformer():PerformerDataVO;
	
	function isAutoPerformerSwitchLimitReached():Bool;
	function isManualPerformerSwitchLimitReached():Bool;
	
	function setPerformerSwitchLimits(auto:Int, manual:Int):Void;
}