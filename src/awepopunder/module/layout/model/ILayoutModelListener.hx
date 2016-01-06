package awepopunder.module.layout.model;
import awepopunder.module.layout.constant.LayoutMode;
import hex.model.IModelListener;

/**
 * ...
 * @author duke
 */
interface ILayoutModelListener extends IModelListener
{
	function onOnline():Void;
	function onOffline():Void;
	function onLayoutModeChange( state:LayoutMode ):Void;
}