package awepopunder.service.settings.application;

import awepopunder.service.servicemonitor.MonitoredHttpService;
import awepopunder.vo.settings.application.ApplicationSettingsVO;
import hex.service.ServiceResultVO;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;

/**
 * ...
 * @author duke
 */
class ApplicationSettingsService extends HTTPService<HTTPServiceConfiguration> implements IApplicationSettingsService
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
	
	private static var i:Int = 0;
	
	override function _onData( result : String ) : Void
	{
		/*if ( i < 2 )
		{
			i++;
			this._onError('fake');
			return;
		}*/
		this._onResultHandler( result );
	}
	
	public function getApplicationSettings( ):ServiceResultVO<ApplicationSettingsVO>
	{
		return this._result;
	}
}