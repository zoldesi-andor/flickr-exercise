package awepopunder.service.performer.performerdata;
import awepopunder.vo.performer.PerformerDataVO;
import hex.service.ServiceResultVO;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.http.IHTTPService;

/**
 * @author duke
 */

interface IPerformerDataService extends IHTTPService<HTTPServiceConfiguration>
{
	
	function getPerformerData():ServiceResultVO<PerformerDataVO>;
	
	
}