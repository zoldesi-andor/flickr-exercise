package example.module.gallery.model;
import example.module.gallery.vo.PhotoVO;
import hex.model.IModelDispatcher;
import hex.model.Model;
import example.module.gallery.model.IGalleryModelListener;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryModel implements IGalleryModel
{
	var _photos : Array<PhotoVO>;
	
	public var dispatcher:GalleryModelDispatcher;
	
	public function new() 
	{
		dispatcher = new GalleryModelDispatcher();
	}
	
	/* INTERFACE example.module.gallery.model.IGalleryModel */
	
	public function setPhotos(photos:Array<PhotoVO>):Void 
	{
		this._photos = photos;
		dispatcher.onPhotosLoaded( this._photos );
	}
	
	public function getPhotos():Array<PhotoVO> 
	{
		return this._photos;
	}
	
	public function addListener( listener : IGalleryModelListener ):Void
	{
		this.dispatcher.addListener( listener );
	}

	public function removeListener( listener : IGalleryModelListener ):Void
	{
		this.dispatcher.removeListener( listener );
	}
	
}