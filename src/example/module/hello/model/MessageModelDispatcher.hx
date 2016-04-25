package example.module.hello.model;

import hex.model.ModelDispatcher;

/**
 * ...
 * @author ali_o_kan - Laurent Deketelaere
 */
class MessageModelDispatcher extends ModelDispatcher<IMessageModelListener> implements IMessageModelListener
{
	public function onMessageChange( message:String ) : Void 
	{
		// the method content it's filled by Macro
	}
	
}