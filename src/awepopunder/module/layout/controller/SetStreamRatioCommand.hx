package awepopunder.module.layout.controller;

import awepopunder.module.layout.model.ILayoutModel;
import awepopunder.module.layout.request.SetStreamRatioRequest;
import hex.control.command.BasicCommand;
import hex.control.Request;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author 
 */
class SetStreamRatioCommand extends BasicCommand implements ISpeedInjectorContainer
{
	@Inject
	public var layoutModel:ILayoutModel;

	override public function execute(?request:Request):Void 
	{
		var setStreamRatioRequest:SetStreamRatioRequest = cast request;
		
		#if debug
		hex.log.Logger.DEBUG("awepopunder.module.layout.controller.SetStreamRatioCommand ratio: " + setStreamRatioRequest.ratio);
		#end
		
		this.layoutModel.setStreamRatio( setStreamRatioRequest.ratio );
	}
	
}