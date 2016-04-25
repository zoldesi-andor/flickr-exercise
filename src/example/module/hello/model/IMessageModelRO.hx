package example.module.hello.model;

import hex.model.IModelRO;

/**
 * @author ali_o_kan - Laurent Deketelaere
 */

interface IMessageModelRO extends IModelRO<IMessageModelListener>
{
	function getMessage() : String;
}