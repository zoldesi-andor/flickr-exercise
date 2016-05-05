package example.module.thumbnails.model;
import example.vo.image.ImageVO;

/**
 * ...
 * @author azoldesi
 */
class ThumbnailModel implements IThumbnailModel
{
	private var image: ImageVO;

	public function new(image: ImageVO) 
	{
		this.image = image;
	}
	
	public function getMediumSizeUrl(): String
	{
		return this.image.getMediumUrl();
	}
	
	public function getThumbnailUrl(): String
	{
		return this.image.getThumbnailUrl();
	}
	
	public function getImageId(): String
	{
		return this.image.id;
	}
	
	public function getImage(): ImageVO
	{
		return this.image;
	}
}