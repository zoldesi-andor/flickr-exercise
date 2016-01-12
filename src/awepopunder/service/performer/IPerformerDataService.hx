package awepopunder.service.performer;
import awepopunder.vo.performer.PerformerDataVO;
import hex.service.ServiceResultVO;
import hex.service.stateless.http.IHTTPService;

/**
 * @author duke
 */

interface IPerformerDataService extends IHTTPService
{
	
	function getPerformerData():ServiceResultVO<PerformerDataVO>;
	
	
}