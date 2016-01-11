package awepopunder.service.performer;
import awepopunder.vo.performer.PerformerDataVO;
import hex.service.ServiceResultVO;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.http.HTTPServiceEvent;
import hex.service.stateless.http.IHTTPService;

/**
 * @author duke
 */

interface IPerformerDataService extends IHTTPService<HTTPServiceEvent, HTTPServiceConfiguration>
{
	
	function getPerformerData():ServiceResultVO<PerformerDataVO>;
	
	
}