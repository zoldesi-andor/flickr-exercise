package example.module.gallery.view;

import example.module.gallery.vo.PhotoVO;
import flash.display.Loader;
import flash.display.Sprite;
import flash.net.URLRequest;
import hex.log.Logger;


/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryViewFlash implements IGalleryView
{
	
	var _layout:Sprite;
	
	public function new( layout:Sprite ) 
	{
		this._layout = layout;
	}
	
	public function setPhotos( photos : Array<PhotoVO> ) : Void
	{
		Logger.DEBUG(photos);
		
		for ( photo in photos)
		{
			var loader = new Loader();
			//loader.contentLoaderInfo.addEventListener (Event.COMPLETE, loader_onComplete);
			loader.load (new URLRequest(photo.url));
			
			this._layout.addChild(loader);
		}
		
		
	}
	
	@:isVar public var visible(get, set):Bool;
	
	function get_visible():Bool 
	{
		return visible;
	}
	
	function set_visible(value:Bool):Bool 
	{
		return visible = value;
	}
	
}