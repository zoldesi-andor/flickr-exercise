package example.module.flickr.model;
import hex.model.ModelDispatcher;

/**
 * ...
 * @author azoldesi
 */
class ImageModelDispatcher extends ModelDispatcher<IImageModelListener>
{
	public function onImageChange( title: String, url: String): Void 
	{
		// I hope it will work
	}
}