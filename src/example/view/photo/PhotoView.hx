package example.view.photo;

import example.module.gallery.view.IGalleryView;
import example.module.gallery.view.IPhotoView;
import hex.log.Logger;
import js.html.Image;
import js.html.ImageElement;
import js.html.VideoElement;
import hex.event.BasicEvent;
import example.module.gallery.vo.PhotoVO;

using riot.RiotTools;

@:tagName('photo')
@:templateFile('example/view/photo/photo.html')
@:keep
class PhotoView implements riot.IRiotComponent implements IGalleryView {
	public var view:Dynamic;
	
	@:isVar
	public var visible( get, set ) : Bool;

	private function get_visible():Bool 
	{
		return this.visible;
	}

	function mount() {
		trace(this);
	}
	
	private function set_visible(b:Bool):Bool 
	{
		this.visible = b;
		return this.visible;
	}

	public function new(v, opts) 
	{
		//Logger.DEBUG('this' + this);
		bind_view(v);
		
		this.initView( );
		//trace('opts', opts);
		
		//Logger.DEBUG('view' + view);
		//view.on('mount', mount);
	}
	
	@:bind
	public function initView( ):Void
	{
		this.view.photos = [];
	}
	
	@:bind
	public function setPhotos( photos : Array<PhotoVO> ) : Void
	{
		Logger.DEBUG(this);
		Logger.DEBUG(photos);
		//this.view.photos.push( { "url": "aute est culpa nisi laborum" } );
		this.view.photos = [ { "url": "aute est culpa nisi laborum" } ];
		this.update();
		//this.view.photos = photos;
		/*
		for ( photo in photos)
		{
			var img : ImageElement = new Image();
			img.src = photo.url;
			img.alt = photo.name;
			
			this.view.appendChild(img);
			//this._layout.appendChild(img);
		}
		*/
		
		
	}

	//@:bind function handleStreamClick(e)	
	//{
    //		trace('Stream clicked');
	//}

	public function addClickHandler(callback:BasicEvent -> Void):Void 
	{
		
	}
}
