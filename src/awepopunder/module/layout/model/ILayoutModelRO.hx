package awepopunder.module.layout.model;
/**
 * @author duke
 */

interface ILayoutModelRO 
{
	
	function getOnlineState( ):OnlineState;
	
	function addListener( listener : ILayoutModelListener ):Void;

	function removeListener( listener : ILayoutModelListener ):Void;
	
}