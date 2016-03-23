package example.module.layout;
import awepopunder.vo.settings.application.LayoutSettingsVO;
import hex.module.IModule;

/**
 * ...
 * @author duke
 */
interface ILayoutModule extends IModule
{

	function setOnline( ):Void;
	
	function setOffline( ):Void;
	
	function setLayoutSettings(settings:LayoutSettingsVO):Void;
	
	function setStreamRatio(ratio:Float):Void;
	
}