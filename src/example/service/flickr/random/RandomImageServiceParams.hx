package example.service.flickr.random;

import hex.service.stateless.http.HTTPServiceParameters;

/**
 * ...
 * @author azoldesi
 */
class RandomImageServiceParams extends HTTPServiceParameters
{
	public var method: String = "flickr.people.getPublicPhotos";
	public var api_key: String;
	public var user_id: String;
	public var format: String = "json";
	public var nojsoncallback: String = "1";
	public var per_page: String = "100";
	
	public function new(api_key: String, user_id: String)
	{
		super();
		
		this.api_key = api_key;
		this.user_id = user_id;
	}
}