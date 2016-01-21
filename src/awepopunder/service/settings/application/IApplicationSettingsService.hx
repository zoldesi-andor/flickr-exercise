package awepopunder.service.settings.application;
import awepopunder.vo.settings.application.ApplicationSettingsVO;
import hex.service.ServiceResultVO;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.http.IHTTPService;
/**
 * @author duke
 */

interface IApplicationSettingsService extends IHTTPService<HTTPServiceConfiguration>
{
	
	function getApplicationSettings():ServiceResultVO<ApplicationSettingsVO>;
	
	
}