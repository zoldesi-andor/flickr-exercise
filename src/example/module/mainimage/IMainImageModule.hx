package example.module.mainimage;

import hex.control.request.StringRequest;

/**
 * @author azoldesi
 */
interface IMainImageModule 
{
	function loadImage(?request: StringRequest): Void;
}