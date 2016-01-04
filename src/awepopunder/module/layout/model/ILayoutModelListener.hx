package awepopunder.module.layout.model;
import hex.model.IModelListener;

/**
 * ...
 * @author duke
 */
interface ILayoutModelListener extends IModelListener
{
	function onOnline():Void;
	function onOffline():Void;
}