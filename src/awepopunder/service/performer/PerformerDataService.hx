package awepopunder.service.performer;

import awepopunder.service.performer.PerformerDataParser;
import awepopunder.vo.performer.PerformerDataVO;
import hex.service.ServiceResultVO;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.http.HTTPServiceEvent;

/**
 * ...
 * @author duke
 */
class PerformerDataService extends HTTPService<HTTPServiceEvent, HTTPServiceConfiguration> implements IPerformerDataService
{

	public function new() 
	{
		super();
		
	}
	
	@postConstruct
	override public function createConfiguration() : Void
	{
		this.setConfiguration( new HTTPServiceConfiguration() );
		this._serviceEventClass = HTTPServiceEvent;
		
		this.setParser( new PerformerDataParser() );
	}
	
	public function getPerformerData( ):ServiceResultVO<PerformerDataVO>
	{
		return this._result;
	}
	
}