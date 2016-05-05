package example.module.mainimage.model;
import hex.model.IModelRO;

/**
 * @author azoldesi
 */
interface IImageModelRO extends IModelRO<IImageModelListener>
{
	function getTitle(): String;
	
	function getUrl(): String;
}