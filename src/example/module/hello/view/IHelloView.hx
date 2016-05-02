package example.module.hello.view;

import hex.event.MessageType;
import hex.view.IView;

/**
 * @author ali_o_kan - Laurent Deketelaere
 */

interface IHelloView extends IView
{
	function showMessage( message : String ) : Void;
	
	function addHandler(messageType:MessageType, scope:Dynamic, callback:Dynamic):Bool;
	
	function removeHandler(messageType:MessageType, scope:Dynamic, callback:Dynamic):Bool;
}