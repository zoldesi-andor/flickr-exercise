package example.service.flickr.parser;

import example.vo.flickr.size.FlickrPhotoSizeVO;
import example.vo.flickr.list.FlickrPhotoVO;
import hex.service.ServiceResultVO;

import haxe.Json;

import hex.parser.JsonResultParser;
import hex.data.IParser;

/**
 * ...
 * @author azoldesi
 */
class FullSizeImageDataParser implements IParser
{
	public function new() 
	{
		
	}
	
	public function parse( serializedContent : Dynamic, target : Dynamic = null) : FlickrPhotoSizeVO 
	{
		var sizeData = Json.parse(serializedContent).sizes.size[5];
		
		var data = new FlickrPhotoSizeVO();
		
		data.height = sizeData.height;
		data.source = sizeData.source;
		
		return data;
	}
}