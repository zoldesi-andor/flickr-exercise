package awepopunder.service.performer;

import awepopunder.parser.base.AweServiceParser;
import awepopunder.vo.performer.PerformerDataVO;

/**
 * ...
 * @author duke
 */
class PerformerDataParser extends AweServiceParser<PerformerDataVO>
{

	public function new() 
	{
		super( );
	}
	
	
	//TODO: create generic parser when it is so trivial like this
	override private function _parseData(data:Dynamic):PerformerDataVO 
	{
		var result:PerformerDataVO = new PerformerDataVO();
		
		result.imageUrl = data.imageUrl;
		result.performerId = data.performerId;
		result.streamUrl = data.streamUrl;
		result.streamRatio = data.streamRatio;
		
		return result;
	}
	
}