package example.module.gallery.view;

import example.module.gallery.model.IGalleryModelListener;
import example.module.gallery.model.IGalleryModelRO;
import hex.di.ISpeedInjectorContainer;
import hex.log.Logger;
import hex.view.viewhelper.ViewHelper;
import example.module.gallery.vo.PhotoVO;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryViewHelper extends ViewHelper implements IGalleryModelListener
{
	var _layoutView : IGalleryView;
	
	@Inject
	var _model:IGalleryModelRO;
	
	public function new() 
	{
		super();
		
	}
	
	override function _initialize():Void 
	{
		super._initialize();
		
		this._layoutView = cast this._view;
		Logger.DEBUG(this._layoutView);
		
		this._model.addListener(this);
	}
	
	public function onPhotosLoaded( photos:Array<PhotoVO> ) : Void
	{
		this._layoutView.setPhotos( photos );
	}
	
}