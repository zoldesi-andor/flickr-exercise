package awepopunder.service.performer.performerdata;

import awepopunder.service.performer.performerdata.IPerformerDataService;
import awepopunder.service.performer.performerdata.PerformerDataParser;
import awepopunder.vo.performer.PerformerDataVO;
import hex.core.IAnnotationParsable;
import hex.service.ServiceResultVO;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;

/**
 * ...
 * @author duke
 */
@:rtti
class PerformerDataService extends HTTPService<HTTPServiceConfiguration> implements IPerformerDataService implements IAnnotationParsable
{
	
	@url("performerData")
	public var serviceUrl:String;

	public function new() 
	{
		super();
		
	}
	
	@postConstruct
	override public function createConfiguration() : Void
	{
		this.setConfiguration( new HTTPServiceConfiguration(this.serviceUrl) );
		this.setParser( new PerformerDataParser() );
	}
	
	public function getPerformerData( ):ServiceResultVO<PerformerDataVO>
	{
		return this._result;
	}
	
}