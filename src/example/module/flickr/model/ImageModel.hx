package example.module.flickr.model;

/**
 * ...
 * @author azoldesi
 */
class ImageModel implements IImageModel
{
	var _dispatcher: ImageModelDispatcher;
	
	var _title: String;
	var _url: String;

	public function new() 
	{
		this._dispatcher = new ImageModelDispatcher();
	}
	
	public function getTitle(): String 
	{
		return this._title;
	}
	
	public function setTitle(title: String): Void 
	{
		this._title = title;
		this._dispatcher.onTitleChange();
	}
	
	public function getUrl(): String
	{
		return this._url;
	}
	
	public function setUrl(url: String): Void 
	{
		this._url = url;
		this._dispatcher.onUrlChange();
	}
	
	public function addListener( listener:IImageModelListener ) : Void 
	{
		this._dispatcher.addListener( listener );
	}
	
	public function removeListener( listener:IImageModelListener ) : Void 
	{
		this._dispatcher.removeListener( listener );
	}
}