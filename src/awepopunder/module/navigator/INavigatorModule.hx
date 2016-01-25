package awepopunder.module.navigator;
import awepopunder.module.navigator.vo.NavigatorSettingsVO;
import hex.module.IModule;


/**
 * ...
 * @author Chris
 */
interface INavigatorModule extends IModule
{
	function setNavigatorSettings( navigatorSettings:NavigatorSettingsVO ):Void;
	
	function setCurrentPerformer( performerId:String):Void;
	
	function navigateTo( pageName:String ):Void;
}