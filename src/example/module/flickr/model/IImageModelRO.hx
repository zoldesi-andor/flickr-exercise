package example.module.flickr.model;
import hex.model.IModelRO;

/**
 * @author azoldesi
 */
interface IImageModelRO extends IModelRO<IImageModelListener>
{
	function getTitle(): String;
	
	function getUrl(): String;
}