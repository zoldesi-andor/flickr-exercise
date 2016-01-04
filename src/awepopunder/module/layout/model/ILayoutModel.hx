package awepopunder.module.layout.model;
import awepopunder.module.layout.model.OnlineState;

/**
 * ...
 * @author duke
 */
interface ILayoutModel extends ILayoutModelRO
{
	function setLoading( ):Void;
	
	function setOnline( ):Void;
	
	function setOffline( ):Void;
}