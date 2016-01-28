package awepopunder.module.layout.model;
import awepopunder.module.layout.constant.ChatMode;
import awepopunder.module.layout.constant.LayoutMode;
import awepopunder.module.layout.constant.OnlineState;
/**
 * @author duke
 */

interface ILayoutModelRO 
{
	
	function getOnlineState( ):OnlineState;
	
	function getLayoutMode( ):LayoutMode;
	
	function getChatMode(  ):ChatMode;
	
	function addListener( listener : ILayoutModelListener ):Void;

	function removeListener( listener : ILayoutModelListener ):Void;
	
}