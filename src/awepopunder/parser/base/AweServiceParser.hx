package awepopunder.parser.base;
import haxe.Json;
import hex.data.IParser;
import hex.error.VirtualMethodException;
import hex.service.ServiceResultVO;

/**
 * ...
 * @author duke
 */
class AweServiceParser<DataType> implements IParser
{

	public function new() 
	{
		
	}
	
	public function parse(serializedContent:Dynamic, target:Dynamic = null):Dynamic 
	{
		var jsonResult:Dynamic = Json.parse(serializedContent);
		
		var serviceResultVO:ServiceResultVO<DataType> = new ServiceResultVO<DataType>();
		
		serviceResultVO.success = jsonResult.status == "OK";
		serviceResultVO.errorCode = jsonResult.errorCode;
		
		serviceResultVO.data = this._parseData( jsonResult.data );
		
		return serviceResultVO;
	}
	
	private function _parseData( data:Dynamic ):DataType
	{
		throw new VirtualMethodException("Override");
		return null;
	}
}