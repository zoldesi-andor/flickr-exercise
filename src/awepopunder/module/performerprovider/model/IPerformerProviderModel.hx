package awepopunder.module.performerprovider.model;
import awepopunder.vo.performer.PerformerDataVO;
import awepopunder.vo.settings.application.FilterSettingsVO;

/**
 * ...
 * @author 
 */
interface IPerformerProviderModel extends IPerformerProviderModelRO
{

	function setPerformerData(value:PerformerDataVO):Void;
	
	function setFilterSettings(value:FilterSettingsVO):Void;
	
	function setSite(value:String):Void;
	
}