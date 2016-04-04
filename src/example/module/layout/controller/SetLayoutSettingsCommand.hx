package example.module.layout.controller;

import awepopunder.vo.settings.application.LayoutSettingsVO;
import example.module.layout.model.ILayoutModel;
import example.module.layout.request.SetLayoutSettingsRequest;
import hex.control.command.BasicCommand;
import hex.control.Request;
import hex.di.IInjectorContainer;

/**
 * ...
 * @author duke
 */
class SetLayoutSettingsCommand extends BasicCommand implements IInjectorContainer
{
	@Inject
	public var layoutModel:ILayoutModel;

	override public function execute(?request:Request):Void 
	{
		var settings:LayoutSettingsVO = cast(request, SetLayoutSettingsRequest).layoutSettings;
		
		#if debug
		hex.log.Logger.DEBUG("awepopunder.module.layout.controller.SetLayoutSettingsCommand layoutMode: " + settings.layoutMode + ", chatMode: " + settings.chatMode);
		#end
		
		this.layoutModel.setLayoutMode(settings.layoutMode);
		this.layoutModel.setChatMode(settings.chatMode);
	}
	
}