package example.module.mainimage.model;

/**
 * @author azoldesi
 */
interface IImageModel extends IImageModelRO
{
	function setTitle(title: String): Void;
	
	function setUrl(url: String): Void;
}