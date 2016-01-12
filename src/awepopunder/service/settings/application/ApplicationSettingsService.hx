package awepopunder.service.settings.application;

import awepopunder.vo.settings.application.ApplicationSettingsVO;
import hex.service.ServiceResultVO;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;

/**
 * ...
 * @author duke
 */
class ApplicationSettingsService extends HTTPService implements IApplicationSettingsService
{

	public function new() 
	{
		super();
		
	}
	
	@postConstruct
	override public function createConfiguration() : Void
	{
		this.setConfiguration( new HTTPServiceConfiguration() );
		
		this.setParser( new ApplicationSettingsParser() );
	}
	
	public function getApplicationSettings( ):ServiceResultVO<ApplicationSettingsVO>
	{
		return this._result;
	}
}