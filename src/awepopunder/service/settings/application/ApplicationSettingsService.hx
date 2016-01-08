package awepopunder.service.settings.application;

import awepopunder.vo.settings.application.ApplicationSettingsVO;
import hex.service.ServiceResultVO;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.http.HTTPServiceEvent;

/**
 * ...
 * @author duke
 */
class ApplicationSettingsService extends HTTPService<HTTPServiceEvent, HTTPServiceConfiguration> implements IApplicationSettingsService
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
		
		this.setParser( new ApplicationSettingsParser() );
	}
	
	public function getApplicationSettings( ):ServiceResultVO<ApplicationSettingsVO>
	{
		return this._result;
	}
}