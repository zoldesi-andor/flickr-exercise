package example.service.image.flickr.parser;

import example.vo.flickr.list.FlickrPhotoVO;
import example.vo.image.ImageVO;
import hex.service.ServiceResultVO;

import haxe.Json;

import hex.parser.JsonResultParser;
import hex.data.IParser;

/**
 * ...
 * @author azoldesi
 */
class RandomImagesDataParser implements IParser
{
	public var count: Int;
	
	public function new(count: Int) 
	{
		this.count = count;
	}
	
	public function parse( serializedContent : Dynamic, target : Dynamic = null) : Array<ImageVO> 
	{
		var photoList: Array<Dynamic> = Json.parse(serializedContent).photos.photo;
		var randomStartIndex = Math.floor(Math.random() * (photoList.length - count));
		var photos = photoList.splice(randomStartIndex, this.count);
		
		return photos.map(function(photo)
		{
			var data = new ImageVO();
			
			data.id = photo.id;
			data.title = photo.title;
			
			return data;
		});
	}
}