package example.service.flickr;

import example.module.gallery.vo.PhotoVO;
import hex.data.IParser;
import hex.log.Logger;

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
		
		var photosList = new Array<PhotoVO>();
		
		/*
			https://farm1.staticflickr.com/2/1418878_1e92283336_m.jpg
			farm-id: 1
			server-id: 2
			photo-id: 1418878
			secret: 
			size: m
			
			id : 25271824726, 
			owner : 134406781@N06, 
			secret : edc6cb8191, 
			server : 1555, 
			farm : 2, 
			title : DSC_0226-Pano, 
			ispublic : 1, 
			isfriend : 0, 
			isfamily : 0
		*/
		for (n in Reflect.fields(json.photos.photo))
		{
			var photo = Reflect.field(json.photos.photo, n);
			var url = "https://farm" + photo.farm + ".staticflickr.com/" + photo.server + "/" + photo.id + "_" + photo.secret + "_b.jpg";
			photosList.push( new PhotoVO(url, photo.title) );
		}
		
		return photosList;
	}
	
}