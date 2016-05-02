package example.module.hello.view;
import example.module.hello.view.IHelloView;
import example.module.hello.view.message.HelloViewMessage;
import flash.Lib;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import hex.event.Dispatcher;
import hex.event.MessageType;

/**
 * ...
 * @author ali_o_kan - Laurent Deketelaere
 */
class HelloViewFlash implements IHelloView
{
	var text:TextField;
	
	var dispatcher:Dispatcher<IHelloViewListener>;

	public function new() 
	{
		this.text = new TextField();
		this.text.background = true;
		this.text.border = true;
		this.text.autoSize = TextFieldAutoSize.CENTER;
		Lib.current.addChild( this.text );
		
		this.text.addEventListener( MouseEvent.CLICK, this._onClick );
		
		this.dispatcher = new Dispatcher();
	}
	
	private function _onClick(e:MouseEvent):Void 
	{
		this.dispatcher.dispatch( HelloViewMessage.CLICK );
	}
	
	public function addHandler( messageType : MessageType, scope : Dynamic, callback : Dynamic ) : Bool
	{
		return this.dispatcher.addHandler( messageType, scope, callback );
	}
	
	public function removeHandler( messageType : MessageType, scope : Dynamic, callback : Dynamic ) : Bool
	{
		return this.dispatcher.removeHandler( messageType, scope, callback );
	}
	
	public function showMessage( message : String ) : Void
	{
		
		this.text.text = message;
		
		this.text.x = (Lib.current.stage.stageWidth - this.text.width ) / 2;
		this.text.y = (Lib.current.stage.stageHeight - this.text.height ) / 2;
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