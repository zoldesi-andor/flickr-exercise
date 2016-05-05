package example.module.thumbnails.model;

/**
 * @author azoldesi
 */
interface IThumbnailModelRO 
{
	function getMediumSizeUrl(): String;
	
	function getThumbnailUrl(): String;
	
	function getImageId(): String;
}