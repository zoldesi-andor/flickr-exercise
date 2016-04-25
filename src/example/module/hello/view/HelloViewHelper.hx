package example.module.hello.view;

import example.module.hello.model.IMessageModelListener;
import example.module.hello.model.IMessageModelRO;
import example.module.hello.view.IHelloView;
import hex.view.viewhelper.ViewHelper;

/**
 * ...
 * @author ali_o_kan - Laurent Deketelaere
 */
class HelloViewHelper extends ViewHelper implements IMessageModelListener
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
		
		this._model.addListener(this);
	}
	
	public function onMessageChange( message : String ) : Void
	{
		_helloView.showMessage(message);
	}
}