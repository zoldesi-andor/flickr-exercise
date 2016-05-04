package example.service.flickr.random;

import example.vo.flickr.list.FlickrPhotoVO;
import hex.service.ServiceResultVO;

import haxe.Json;

import hex.parser.JsonResultParser;
import hex.data.IParser;

/**
 * ...
 * @author azoldesi
 */
class RandomImageDataParser implements IParser
{
	public function new() 
	{
		
	}
	
	public function parse( serializedContent : Dynamic, target : Dynamic = null) : Dynamic 
	{
		var photoList: Array<Dynamic> = Json.parse(serializedContent).photos.photo;
		var randomIndex = Math.floor(Math.random() * photoList.length);
		var photo = photoList[randomIndex];
		
		var data = new FlickrPhotoVO();
		
		data.id = photo.id;
		data.title = photo.title;
		
		var result = new ServiceResultVO<FlickrPhotoVO>();
		
		result.data = data;
		result.success = true;
		
		return result;
	}
}