package awepopunder.module.layout.controller;

import awepopunder.module.layout.model.ILayoutModel;
import awepopunder.module.layout.request.SetStreamRatioRequest;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author 
 */
@:rtti
class SetStreamRatioCommand extends BasicCommand
{
	@inject
	public var layoutModel:ILayoutModel;

	override public function execute(?request:Request):Void 
	{
		var setStreamRatioRequest:SetStreamRatioRequest = cast request;
		this.layoutModel.setStreamRatio( setStreamRatioRequest.ratio );
	}
	
}