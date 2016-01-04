package awepopunder.module.layout.model;

/**
 * ...
 * @author duke
 */
@:rtti
class LayoutModel implements ILayoutModel
{
	private var _onlineState:OnlineState = OnlineState.Loading;
	
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
	
	public function addListener( listener : ILayoutModelListener ):Void
	{
		this.dispatcher.addListener( listener );
	}

	public function removeListener( listener : ILayoutModelListener ):Void
	{
		this.dispatcher.removeListener( listener );
	}
}