package example.module.flickr;

import hex.control.request.StringRequest;

/**
 * @author azoldesi
 */
interface IFlickrModule 
{
	function loadImage(?request: StringRequest): Void;
}