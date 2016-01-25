package awepopunder.module.navigator.request;
import awepopunder.module.navigator.vo.NavigatorSettingsVO;
import hex.control.Request;

/**
 * ...
 * @author Chris
 */
class SetNavigatorSettingsRequest extends Request
{
	public var navigatorSettings:NavigatorSettingsVO;

	public function new( navigatorSettings:NavigatorSettingsVO ) 
	{
		super();
		this.navigatorSettings = navigatorSettings;
	}
	
}