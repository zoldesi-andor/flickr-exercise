package awepopunder.service.servicemonitor;

import hex.service.monitor.IServiceMonitor;
import hex.service.monitor.IServiceMonitorStrategy;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;

/**
 * ...
 * @author duke
 */
@:rtti
class MonitoredHttpService<ServiceConfigurationType:HTTPServiceConfiguration> extends HTTPService<ServiceConfigurationType>
{
	
	@Inject("name=httpServiceMonitor")
	public var serviceMonitor:IServiceMonitor;

	public function new() 
	{
		super();
		
	}
	
	@PostConstruct
	function _initMonitorStrategy() : Void
	{
		//this.serviceMonitor.getStrategy( this ).setExceptionCallback( this, this._onException );
	}
	
	override function _onError( msg : String ) : Void
	{
		var strategy = this.serviceMonitor.getStrategy( this );
		
		if ( strategy.handleError( this, new HTTPServiceException( msg ) ) )
		{
			this._reset();
			strategy.retry( this );
		}
		else
		{
			super._onError( msg );
		}
	}
	
	
	
}