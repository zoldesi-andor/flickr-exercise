package example.module.hello.model;

/**
 * @author ali_o_kan - Laurent Deketelaere
 */

interface IMessageModel extends IMessageModelRO
{
	function setMessage( message : String ) : Void;
}