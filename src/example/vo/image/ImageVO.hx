package example.vo.image;
import hex.error.IllegalStateException;

/**
 * ...
 * @author azoldesi
 */
class ImageVO
{
	public var id: String;
	public var title: String;
	
	public var sizes: Array<ImageSizeVO>;
	
	public function new() 
	{
		this.sizes = [];
	}
	
	public function getThumbnailUrl(): String
	{
		if (this.sizes.length < 6)
		{
			throw new IllegalStateException("Medium Size is not available!");
		}
		
		return this.sizes[1].url;
	}
	
	public function getMediumUrl(): String
	{
		if (this.sizes.length < 6)
		{
			throw new IllegalStateException("Medium Size is not available!");
		}
		
		return this.sizes[5].url;
	}
}