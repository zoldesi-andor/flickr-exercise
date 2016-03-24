package example.module.gallery.view;

import hex.view.IView;
import example.module.gallery.vo.PhotoVO;

/**
 * @author Andrei Bunulu
 */
interface IGalleryView extends IView
{
	function setPhotos( photos : Array<PhotoVO> ) : Void;
}