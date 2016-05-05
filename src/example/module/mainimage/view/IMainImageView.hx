package example.module.mainimage.view;

import hex.event.MessageType;
import hex.view.IView;

/**
 * @author azoldesi
 */
interface IMainImageView extends IView
{	
	function setTitle( title: String): Void;
	
	function setUrl( url: String): Void;
	
	function addHandler(messageType:MessageType, scope:Dynamic, callback:Dynamic):Bool;
	
	function removeHandler(messageType:MessageType, scope:Dynamic, callback:Dynamic):Bool;
}