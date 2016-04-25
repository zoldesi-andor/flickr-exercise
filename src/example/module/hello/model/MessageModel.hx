package example.module.hello.model;

/**
 * ...
 * @author ali_o_kan - Laurent Deketelaere
 */
class MessageModel implements IMessageModel
{
	var _dispatcher : MessageModelDispatcher;
	
	var _message : String;
	
	public function new() 
	{
		this._dispatcher = new MessageModelDispatcher();
	}
	
	public function setMessage( message:String ) : Void 
	{
		this._message = message;
		this._dispatcher.onMessageChange( message );
	}
	
	public function getMessage() : String 
	{
		return this._message;
	}
	
	public function addListener( listener:IMessageModelListener ) : Void 
	{
		this._dispatcher.addListener( listener );
	}
	
	public function removeListener( listener:IMessageModelListener ) : Void 
	{
		this._dispatcher.removeListener( listener );
	}
	
}