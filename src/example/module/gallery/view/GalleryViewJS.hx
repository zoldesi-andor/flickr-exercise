package example.module.gallery.view;

import hex.log.Logger;
import js.html.DOMElement;
import example.module.gallery.vo.PhotoVO;
import js.html.Image;
import js.html.ImageElement;


/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryViewJS implements IGalleryView
{
	
	var _layout:DOMElement;
	
	public function new( layout:DOMElement ) 
	{
		this._layout = layout;
	}
	
	public function setPhotos( photos : Array<PhotoVO> ) : Void
	{
		Logger.DEBUG(photos);
		
		for ( photo in photos)
		{
			var img : ImageElement = new Image();
			img.src = photo.url;
			img.alt = photo.name;
			
			this._layout.appendChild(img);
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