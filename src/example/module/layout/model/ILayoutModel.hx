package example.module.layout.model;
import example.module.layout.constant.ChatMode;
import example.module.layout.constant.LayoutMode;
import example.module.layout.constant.OnlineState;

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
	
	function setStreamRatio(ratio:Float):Void;
	
	function setChatMode( chatMode:ChatMode ):Void;
}