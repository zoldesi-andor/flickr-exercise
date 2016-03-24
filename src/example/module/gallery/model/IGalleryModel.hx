package example.module.gallery.model;

import example.module.gallery.vo.PhotoVO;

/**
 * @author Andrei Bunulu
 */
interface IGalleryModel extends IGalleryModelRO
{
	function setPhotos( photos : Array<PhotoVO> ) : Void;
}