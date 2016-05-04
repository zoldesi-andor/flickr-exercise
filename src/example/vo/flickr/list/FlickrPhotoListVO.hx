package example.vo.flickr.list;

import example.vo.flickr.list.FlickrPhotoVO;

/**
 * ...
 * @author azoldesi
 */
class FlickrPhotoListVO
{
	public var page: Int;
	public var pages: Int;
	public var perpage: Int;
	public var photo: Array<FlickrPhotoVO>;
	public var total: String;
	
	public function new() 
	{
		
	}
}