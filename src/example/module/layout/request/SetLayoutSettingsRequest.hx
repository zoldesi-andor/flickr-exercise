package example.module.layout.request;

import awepopunder.vo.settings.application.LayoutSettingsVO;
import hex.control.Request;

/**
 * ...
 * @author duke
 */
class SetLayoutSettingsRequest extends Request
{
	public var layoutSettings:LayoutSettingsVO;

	public function new(layoutSettings:LayoutSettingsVO) 
	{
		super();
		this.layoutSettings = layoutSettings;
		
	}
	
}