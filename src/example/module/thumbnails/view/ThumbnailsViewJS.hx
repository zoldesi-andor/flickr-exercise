package example.module.thumbnails.view;

import example.module.mainimage.view.IMainImageView;
import example.module.thumbnails.view.message.ThumbnailViewMessage;
import example.module.thumbnails.model.IThumbnailModelRO;
import hex.control.request.StringRequest;
import hex.control.request.ValueRequest;
import hex.event.Dispatcher;
import hex.event.MessageType;
import js.Browser;
import js.html.Element;
import js.html.Event;
import js.html.Image;

/**
 * ...
 * @author azoldesi
 */
class ThumbnailsViewJS implements IThumbnailsView
{
	var container: Element;
	
	var dispatcher: Dispatcher<IThumbnailsViewListener>;
	
	public function new() 
	{
		this.dispatcher = new Dispatcher();
			
		this.container = Browser.document.getElementById("thumbnails");
	}
	
	private function thumbnailClicked(thumbnail: IThumbnailModelRO): Void 
	{
		this.dispatcher.dispatch( ThumbnailViewMessage.THUMBNAIL_CLICKED, [new ValueRequest(thumbnail.getImage())] );
	}
	
	public function createThumbnail(thumbnail: IThumbnailModelRO): Void
	{
		var image = Browser.document.createImageElement();
		image.src = thumbnail.getThumbnailUrl();
		image.setAttribute("height", "100%");
		image.addEventListener("click", function(e: Event) { this.thumbnailClicked(thumbnail); });
		
		this.container.appendChild(image);
	}
	
	public function addHandler( messageType : MessageType, scope : Dynamic, callback : Dynamic ) : Bool
	{
		return this.dispatcher.addHandler( messageType, scope, callback );
	}
	
	public function removeHandler( messageType : MessageType, scope : Dynamic, callback : Dynamic ) : Bool
	{
		return this.dispatcher.removeHandler( messageType, scope, callback );
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