package example.module.gallery.view;

import hex.log.Logger;
import hex.view.viewhelper.ViewHelper;
import example.module.gallery.vo.PhotoVO;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryViewHelper extends ViewHelper
{
	var _layoutView : IGalleryView;
	
	public function new() 
	{
		super();
		
	}
	
	override function _initialize():Void 
	{
		super._initialize();
		
		this._layoutView = cast this._view;
		Logger.DEBUG(this._layoutView);
	}
	
	public function setPhotos( photos : Array<PhotoVO> ) : Void
	{
		this._layoutView.setPhotos( photos );
	}
	
}