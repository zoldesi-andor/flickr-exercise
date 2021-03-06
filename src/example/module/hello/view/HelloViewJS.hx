package example.module.hello.view;
import example.module.hello.view.IHelloView;
import example.module.hello.view.message.HelloViewMessage;
import hex.event.Dispatcher;
import hex.event.MessageType;
import js.Browser;
import js.html.Element;
import js.html.Event;

/**
 * ...
 * @author ali_o_kan - Laurent Deketelaere
 */
class HelloViewJS implements IHelloView
{
	var view:Element;
	
	var dispatcher:Dispatcher<IHelloViewListener>;

	public function new() 
	{
		this.dispatcher = new Dispatcher();
		this.view = Browser.document.getElementById("content");
		
		this.view.addEventListener( "click", this._onClick );
	}
	
	private function _onClick(e:Event):Void 
	{
		this.dispatcher.dispatch( HelloViewMessage.CLICK );
	}
	
	
	public function showMessage( message : String ) : Void
	{
		
		this.view.innerText = message; 
	}
	
	
	public function addHandler( messageType : MessageType, scope : Dynamic, callback : Dynamic ) : Bool
	{
		return this.dispatcher.addHandler( messageType, scope, callback );
	}
	
	public function removeHandler( messageType : MessageType, scope : Dynamic, callback : Dynamic ) : Bool
	{
		return this.dispatcher.removeHandler( messageType, scope, callback );
	}
	
	@:isVar public var visible(get, set):Bool;
	
	function get_visible():Bool 
	{
		return visible;
	}
	
	function set_visible(value:Bool):Bool 
	{
		return visible = value;
	}
	
}