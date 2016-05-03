package example.module.flickr.model;
import hex.model.IModelListener;

/**
 * @author azoldesi
 */
interface IImageModelListener extends IModelListener
{
	function onUrlChange(): Void;
	
	function onTitleChange(): Void;
}