package awepopunder.module.layout.model;
import awepopunder.module.layout.constant.LayoutMode;
import awepopunder.module.layout.constant.OnlineState;

/**
 * ...
 * @author duke
 */
interface ILayoutModel extends ILayoutModelRO
{
	function setLoading( ):Void;
	
	function setOnline( ):Void;
	
	function setOffline( ):Void;
	
	function setLayoutMode( state:LayoutMode ):Void;
}