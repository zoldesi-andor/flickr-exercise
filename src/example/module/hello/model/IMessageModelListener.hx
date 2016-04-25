package example.module.hello.model;

import hex.model.IModelListener;

/**
 * @author ali_o_kan - Laurent Deketelaere
 */

interface IMessageModelListener extends IModelListener
{
	function onMessageChange( message : String ) : Void;
}