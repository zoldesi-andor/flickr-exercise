package example.module.gallery.vo;

/**
 * ...
 * @author Andrei Bunulu
 */
class PhotoVO
{
	public var url:String;
	public var name:String;
	
	public function new(url:String, name:String="") 
	{
		this.url = url;
		this.name = name;
	}
	
}