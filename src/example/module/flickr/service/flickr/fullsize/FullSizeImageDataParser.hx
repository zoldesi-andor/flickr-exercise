package example.module.flickr.service.flickr.fullsize;

import example.module.flickr.vo.FlickrPhotoSizeVO;
import example.module.flickr.vo.FlickrPhotoVO;
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
	
	public function parse( serializedContent : Dynamic, target : Dynamic = null) : Dynamic 
	{
		var sizeData = Json.parse(serializedContent).sizes.size[5];
		
		var data = new FlickrPhotoSizeVO();
		
		data.height = sizeData.height;
		data.source = sizeData.source;
		
		var result = new ServiceResultVO<FlickrPhotoSizeVO>();
		
		result.data = data;
		result.success = true;
		
		return result;
	}
}