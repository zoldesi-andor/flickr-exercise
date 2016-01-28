package awepopunder.module.layout.view;

import awepopunder.module.layout.constant.ChatMode;
import awepopunder.module.layout.constant.LayoutMode;
import awepopunder.module.layout.constant.OnlineState;
import awepopunder.module.layout.model.ILayoutModelListener;
import awepopunder.module.layout.model.ILayoutModelRO;
import hex.view.viewhelper.ViewHelper;

/**
 * ...
 * @author duke
 */
class LayoutViewHelper extends ViewHelper implements ILayoutModelListener
{
	var _layoutView:ILayoutView;
	
	@Inject
	public var layoutModel:ILayoutModelRO;

	public function new() 
	{
		super();
		
	}
	
	override function _initialize():Void 
	{
		super._initialize();
		
		this._layoutView = cast this._view;
		this.layoutModel.addListener( this );
	}
	
	public function onLayoutModeChange( layoutMode:LayoutMode ):Void
	{
		this._layoutView.setLayoutMode( layoutMode );
		
	}
	
	public function onOnline():Void 
	{
		if ( this.layoutModel.getChatMode() == ChatMode.AlwaysOn )
		{
			this._layoutView.showChat( );
		}
		this._layoutView.showLive( );
		this._layoutView.hideOffline( );
	}
	
	public function onOffline():Void 
	{
		this._layoutView.hideChat( );
		this._layoutView.hideLive( );
		this._layoutView.showOffline( );
	}
	
	override public function release():Void
	{
		this.layoutModel.removeListener( this );
		super.release();
	}
	
	public function onStreamRatioChange(ratio:Float):Void 
	{
		this._layoutView.setStreamRatio( ratio );
	}
	
	
	public function onChatModeChange(chatMode:ChatMode):Void 
	{
		if ( chatMode == ChatMode.AlwaysOn && this.layoutModel.getOnlineState() == OnlineState.Online )
		{
			this._layoutView.showChat();
		}
		else if ( chatMode == ChatMode.Hidden )
		{
			this._layoutView.hideChat();
		}
	}
	
}