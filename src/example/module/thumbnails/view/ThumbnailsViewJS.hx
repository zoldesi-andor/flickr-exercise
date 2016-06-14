package example.module.thumbnails.view;

import example.module.thumbnails.model.IThumbnailModelRO;
import example.vo.image.ImageVO;
import js.Browser;
import js.html.Element;
import js.html.Event;
import promhx.Deferred;
import promhx.Stream;

/**
 * ...
 * @author azoldesi
 */
class ThumbnailsViewJS implements IThumbnailsView
{
	var container: Element;
	
	var thumbnailClickDeferred = new Deferred<ImageVO>();
	
	public function new() 
	{			
		this.thumbnailClickStream = this.thumbnailClickDeferred.stream();
		
		this.container = Browser.document.getElementById("thumbnails");
	}
	
	public var thumbnailClickStream(default, null): Stream<ImageVO>;
	
	public function getMaxThumbnailCount(): Int
	{
		var h = this.container.clientHeight;
		var w = this.container.clientWidth;
		
		return Math.floor(w / h);
	}
	
	private function thumbnailClicked(thumbnail: IThumbnailModelRO): Void 
	{
		this.thumbnailClickDeferred.resolve(thumbnail.getImage());
	}
	
	public function createThumbnail(thumbnail: IThumbnailModelRO): Void
	{
		var image = Browser.document.createImageElement();
		image.src = thumbnail.getThumbnailUrl();
		image.setAttribute("height", "100%");
		image.addEventListener("click", function(e: Event) { this.thumbnailClicked(thumbnail); });
		
		this.container.appendChild(image);
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