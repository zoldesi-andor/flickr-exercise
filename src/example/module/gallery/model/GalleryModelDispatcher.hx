package example.module.gallery.model;

import hex.model.ModelDispatcher;
import example.module.gallery.vo.PhotoVO;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryModelDispatcher extends ModelDispatcher<IGalleryModelListener> implements IGalleryModelListener
{

	public function new() 
	{
		super();
		
	}
	
	public function onPhotosLoaded( photos:Array<PhotoVO> ) : Void
	{
		// the method content it's filled by Macro
	}
	
}