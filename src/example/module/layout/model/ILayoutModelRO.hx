package example.module.layout.model;
import example.module.layout.constant.ChatMode;
import example.module.layout.constant.LayoutMode;
import example.module.layout.constant.OnlineState;
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