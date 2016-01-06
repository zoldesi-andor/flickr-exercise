package awepopunder.module.layout.view;
import hex.view.IView;

/**
 * @author duke
 */

interface ILayoutView extends IView 
{
	
	function showChat():Void;
	
	function hideChat():Void;
	
	function showLive():Void;
	
	function hideLive():Void;
	
	function setInFrameLayoutMode( ):Void;

	function setOutFrameLayoutMode( ):Void;
}