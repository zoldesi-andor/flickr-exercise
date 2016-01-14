package awepopunder.module.layout.model;
import awepopunder.module.layout.constant.LayoutMode;
import hex.model.ModelDispatcher;

/**
 * ...
 * @author duke
 */
class LayoutModelDispatcher extends ModelDispatcher<ILayoutModelListener> implements ILayoutModelListener
{

	public function onOnline( ) : Void { for (i in 0...this._listeners.length) { this._listeners[i].onOnline( ); }; }
	public function onOffline( ) : Void { for (i in 0...this._listeners.length) { this._listeners[i].onOffline( ); }; }
	public function onLayoutModeChange( state:LayoutMode ) : Void { for (i in 0...this._listeners.length) { this._listeners[i].onLayoutModeChange( state ); }; }
	public function onStreamRatioChange( ratio:Float ) : Void { for (i in 0...this._listeners.length) { this._listeners[i].onStreamRatioChange( ratio ); }; }
	
}