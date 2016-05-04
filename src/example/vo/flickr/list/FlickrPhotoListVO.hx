package example.vo.flickr.list;

/**
 * ...
 * @author azoldesi
 */
class FlickrPhotoListVO
{
	public var page: Int;
	public var pages: Int;
	public var perpage: Int;
	public var photo: Array<FlickrPhotoVO>
	public var total: String;
	
	public function new() 
	{
		
	}
	
import example.vo.flickr.list.FlickrPhotoVO;
}