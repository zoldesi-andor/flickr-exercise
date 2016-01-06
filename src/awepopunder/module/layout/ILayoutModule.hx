package awepopunder.module.layout;
import awepopunder.module.layout.constant.LayoutMode;
import hex.module.IModule;

/**
 * ...
 * @author duke
 */
interface ILayoutModule extends IModule
{

	function setOnline( ):Void;
	
	function setOffline( ):Void;
	
	function setLayoutMode(mode:LayoutMode):Void;
	
}