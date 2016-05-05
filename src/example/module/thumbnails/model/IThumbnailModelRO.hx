package example.module.thumbnails.model;
import example.vo.image.ImageVO;

/**
 * @author azoldesi
 */
interface IThumbnailModelRO 
{
	function getMediumSizeUrl(): String;
	
	function getThumbnailUrl(): String;
	
	function getImageId(): String;
	
	function getImage(): ImageVO;
}