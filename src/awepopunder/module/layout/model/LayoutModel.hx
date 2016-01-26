package awepopunder.module.layout.model;
import awepopunder.module.layout.constant.LayoutMode;
import awepopunder.module.layout.constant.OnlineState;

/**
 * ...
 * @author duke
 */
@:rtti
class LayoutModel implements ILayoutModel
{
	var _onlineState:OnlineState = OnlineState.Loading;
	var _layoutMode:LayoutMode = LayoutMode.InFrame;
	var _streamRatio:Float;
	
	public var dispatcher:LayoutModelDispatcher;

	
	public function new() 
	{
		this.dispatcher = new LayoutModelDispatcher();
		
	}
	
	public function getOnlineState( ):OnlineState
	{
		return this._onlineState;
	}
	
	public function setLoading( ):Void
	{
		this._onlineState = OnlineState.Loading;
		this.dispatcher.onOnline();
	}
	
	public function setOnline( ):Void
	{
		this._onlineState = OnlineState.Online;
		this.dispatcher.onOnline();
	}
	
	public function setOffline( ):Void
	{
		this._onlineState = OnlineState.Offline;
		this.dispatcher.onOffline();
	}
	
	public function getLayoutMode( ):LayoutMode
	{
		return this._layoutMode;
	}
	
	public function setLayoutMode( state:LayoutMode ):Void
	{
		this._layoutMode = state;
		this.dispatcher.onLayoutModeChange( state );
	}
	
	public function setStreamRatio( ratio:Float ):Void
	{
		this._streamRatio = ratio;
		this.dispatcher.onStreamRatioChange( ratio );
	}
	
	public function addListener( listener : ILayoutModelListener ):Void
	{
		this.dispatcher.addListener( listener );
	}

	public function removeListener( listener : ILayoutModelListener ):Void
	{
		this.dispatcher.removeListener( listener );
	}
}