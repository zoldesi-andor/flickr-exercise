package awepopunder.service.servicemonitor;

import hex.service.monitor.IServiceMonitor;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;

/**
 * ...
 * @author duke
 */
class MonitoredHttpService<ServiceConfigurationType:HTTPServiceConfiguration> extends HTTPService<ServiceConfigurationType>
{
	
	@Inject
	public var serviceMonitor:IServiceMonitor;

	public function new() 
	{
		super();
		
	}
	
	override function _onError( msg : String ) : Void
	{
		if ( !this.serviceMonitor.handleError( this, new HTTPServiceException( msg ) ) )
		{
			super._onError( msg );
		}
	}
	
}