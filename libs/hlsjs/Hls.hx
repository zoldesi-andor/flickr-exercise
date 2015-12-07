package hlsjs;
import js.html.VideoElement;

/**
 * ...
 * @author duke
 */
extern class Hls
{
	static var Events:HlsEvents;

	static function isSupported():Bool;
	
	function new(?config:hlsjs.HlsConfig);
	
	function attachMedia(videoElement:VideoElement):Void;
	
	function detachVideo():Void;
	
	function loadSource(url:String):Void;
	
	function on( event:String, callback:String->Dynamic->Void ) : Void;
	
}