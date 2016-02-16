package awepopunder.module.layout.view;
import awepopunder.module.layout.constant.LayoutMode;
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
	
	function setLayoutMode( layoutMode:LayoutMode ):Void;
	
	function showOffline():Void;
	
	function hideOffline():Void;
	
	function setStreamRatio(ratio:Float):Void;
	
	function onTranslate():Void;
}