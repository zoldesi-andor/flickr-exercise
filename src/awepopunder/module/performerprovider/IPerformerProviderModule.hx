package awepopunder.module.performerprovider;
import awepopunder.vo.settings.application.FilterSettingsVO;

/**
 * @author 
 */

interface IPerformerProviderModule 
{
	
	function setFilterSettings(filterSettings:FilterSettingsVO, site:String):Void;
	function loadNextPerformer():Void;
	
	
}