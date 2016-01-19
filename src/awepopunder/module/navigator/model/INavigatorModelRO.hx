package awepopunder.module.navigator.model;
import awepopunder.module.navigator.vo.NavigatorSettingsVO;

/**
 * ...
 * @author Chris
 */
interface INavigatorModelRO
{
	function getNavigatorSettings():NavigatorSettingsVO;
	
	function getCurrentPerformerId():String;
	
}