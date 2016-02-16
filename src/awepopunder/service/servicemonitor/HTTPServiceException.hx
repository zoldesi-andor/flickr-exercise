package awepopunder.service.servicemonitor;

import hex.error.Exception;
import haxe.PosInfos;

/**
 * ...
 * @author duke
 */
class HTTPServiceException extends Exception
{

	public function new(message:String, ?posInfos:PosInfos) 
	{
		super(message, posInfos);
		
	}
	
}