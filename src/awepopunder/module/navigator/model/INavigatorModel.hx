package awepopunder.module.navigator.model;
import awepopunder.module.navigator.vo.NavigatorSettingsVO;

/**
 * ...
 * @author Chris
 */
interface INavigatorModel extends INavigatorModelRO
{
	function setNavigatorSettings(value:NavigatorSettingsVO):Void;
	
	function setCurrentPerformerId(value:String):Void;
	
}