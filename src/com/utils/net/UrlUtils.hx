package com.utils.net;

/**
 * ...
 * @author duke
 */
class UrlUtils
{

	public static function buildUrl( scheme:String, host:String, ?port:UInt, ?path:String, ?query:String, ?fragment:String, ?user:String, ?password:String, ?useSchemeSeparator:Bool = true, ?usePathSeparator:Bool = true ):String
	{
		return scheme + ":" + 
			   (useSchemeSeparator ? "//" : "" ) + 
			   (user != null ? user : "") +
			   (password != null ? ":" + password : "") +
			   host + 
			   (port != null && !Math.isNaN(port) ? ":" + port : "") +
			   (path != null ? (usePathSeparator ? "/" : "") + path : "") +
			   (query != null ? "?" + query : "") +
			   (fragment != null ? "#" + fragment : "");
	}
}