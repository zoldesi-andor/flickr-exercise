package awepopunder.service.performer.performerstatus;

import hex.service.ServiceConfiguration;

/**
 * ...
 * @author 
 */
class PerformerStatusServiceConfiguration extends ServiceConfiguration
{
	public var checkInterval:UInt;
	public var url:String;
	public var dispatchOfflineCheckCount:UInt;

	public function new( url:String = null, dispatchOfflineCheckCount:UInt = 5, checkInterval:UInt = 1000, timeout:UInt = 5000) 
	{
		super(timeout);
		this.checkInterval = checkInterval;
		this.url = url;
		this.dispatchOfflineCheckCount = dispatchOfflineCheckCount;
		
	}
	
}