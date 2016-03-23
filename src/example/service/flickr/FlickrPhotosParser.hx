package example.service.flickr;

import hex.data.IParser;

/**
 * ...
 * @author Andrei Bunulu
 */
class FlickrPhotosParser implements IParser
{

	public function new() 
	{
		
	}
	
	/* INTERFACE hex.data.IParser */
	
	public function parse(serializedContent:Dynamic, target:Dynamic = null):Dynamic 
	{
		trace("parse");
		var jsonString : String = serializedContent;
		jsonString = jsonString.substr(14);
		jsonString = jsonString.substr(0, -1);
		var json = haxe.Json.parse(jsonString);
		trace(jsonString);
		return json;
	}
	
}