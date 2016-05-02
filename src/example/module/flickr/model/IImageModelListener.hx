package example.module.flickr.model;
import hex.model.IModelListener;

/**
 * @author azoldesi
 */
interface IImageModelListener extends IModelListener
{
	function onImageChange(title: String, url: String): Void;
}