package example.service.flickr.fullsize;

import hex.service.stateless.http.HTTPServiceParameters;

/**
 * ...
 * @author azoldesi
 */
class FullSizeImageServiceParams extends HTTPServiceParameters
{
	public var method: String = "flickr.photos.getSizes";
	public var api_key: String;
	public var user_id: String;
	public var format: String = "json";
	public var nojsoncallback: String = "1";
	public var per_page: String = "100";
	public var photo_id: String;
	
	public function new(api_key: String, user_id: String, photoId: String)
	{
		super();
		
		this.api_key = api_key;
		this.user_id = user_id;
		this.photo_id = photoId;
	}
}