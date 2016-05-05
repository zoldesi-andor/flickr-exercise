package example.vo.image;

/**
 * ...
 * @author azoldesi
 */
class ImageSizeVO
{
	public var label: String;
	public var url: String;
	public var width: String;
	public var height: String;	
	
	public function new(label: String, url: String, width: String, height: String) 
	{
		this.label = label;
		this.url = url;
		this.width = width;
		this.height = height;
	}	
}