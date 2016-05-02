package example.module.flickr.view;

import hex.event.MessageType;
import hex.view.IView;

/**
 * @author azoldesi
 */
interface IFlickrView extends IView
{
	function showImage( title: String, url: String ) : Void;
	
	function addHandler(messageType:MessageType, scope:Dynamic, callback:Dynamic):Bool;
	
	function removeHandler(messageType:MessageType, scope:Dynamic, callback:Dynamic):Bool;
}