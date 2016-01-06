package awepopunder.module.layout.view;

import awepopunder.module.layout.constant.LayoutMode;
import awepopunder.module.layout.model.ILayoutModelListener;
import awepopunder.module.layout.model.ILayoutModelRO;
import hex.view.IView;
import hex.view.viewhelper.ViewHelper;

/**
 * ...
 * @author duke
 */
class LayoutViewHelper extends ViewHelper implements ILayoutModelListener
{
	var _layoutView:ILayoutView;
	
	@inject
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
		switch( layoutMode )
		{
			case InFrame: this._layoutView.setInFrameLayoutMode( );
			case OutFrame: this._layoutView.setOutFrameLayoutMode( );
		}
		
	}
	
	public function onOnline():Void 
	{
		this._layoutView.showChat( );
		this._layoutView.showLive( );
	}
	
	public function onOffline():Void 
	{
		this._layoutView.hideChat( );
		this._layoutView.hideLive( );
	}
	
	override public function release():Void
	{
		this.layoutModel.removeListener( this );
		super.release();
	}
	
}