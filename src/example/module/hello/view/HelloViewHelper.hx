package example.module.hello.view;

import example.module.hello.message.HelloModuleMessage;
import example.module.hello.model.IMessageModelListener;
import example.module.hello.model.IMessageModelRO;
import example.module.hello.view.IHelloView;
import example.module.hello.view.message.HelloViewMessage;
import hex.control.request.StringRequest;
import hex.view.viewhelper.ViewHelper;

/**
 * ...
 * @author ali_o_kan - Laurent Deketelaere
 */
class HelloViewHelper extends ViewHelper implements IMessageModelListener implements IHelloViewListener
{
	var _helloView : IHelloView; 
	
	@Inject
	var _model:IMessageModelRO;
	
	public function new( view : IHelloView ) 
	{
		super();
	}
	
	override function _initialize():Void 
	{
		super._initialize();
		
		this._helloView = cast this._view;
		this._helloView.addHandler( HelloViewMessage.CLICK, this, this.onClick );
		
		this._model.addListener(this);
	}
	
	public function onClick():Void
	{
		this.dispatcher.dispatch( HelloModuleMessage.SET_MESSAGE, [ new StringRequest("Hola mundo! :)") ] );
	}
	
	public function onMessageChange( message : String ) : Void
	{
		_helloView.showMessage(message);
	}
}