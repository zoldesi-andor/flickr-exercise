package example.module.gallery.model;

import hex.model.IModelListener;
import example.module.gallery.vo.PhotoVO;

/**
 * @author Andrei Bunulu
 */
interface IGalleryModelListener extends IModelListener
{
	function onPhotosLoaded( photos:Array<PhotoVO> ) : Void;
}