package example.module.flickr.view;

import example.module.flickr.view.IFlickrView;
import example.module.flickr.view.message.FlickrViewMessage;
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
class FlickrViewJS implements IFlickrView
{
	var container: Element;
	var title: Element;
	var image: Image;
	
	var dispatcher: Dispatcher<IFlickrViewListener>;
	
	public function new() 
	{
		this.dispatcher = new Dispatcher();
			
		this.title = Browser.document.getElementById("title");
		this.image = cast Browser.document.getElementById("image");
		
		this.container = Browser.document.getElementById("flickr");
		this.container.addEventListener("click", this._onClick );
	}
	
	private function _onClick(e: Event): Void 
	{
		this.dispatcher.dispatch( FlickrViewMessage.CLICK );
	}
	
	public function setTitle( title: String): Void
	{
		Browser.document.title = title;
	}
	
	public function setUrl( url: String): Void
	{
		this.image.src = url;
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