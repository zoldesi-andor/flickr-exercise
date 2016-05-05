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
	
	public function getImageUrl(): String
	{
		return this.image.url;
	}
	
	public function getImageId(): String
	{
		return this.image.id;
	}
}