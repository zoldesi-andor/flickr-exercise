package awepopunder.module.layout.controller;

import awepopunder.module.layout.model.ILayoutModel;
import awepopunder.module.layout.request.LayoutModeRequest;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author duke
 */
@:rtti
class SetLayoutModeCommand extends BasicCommand
{
	@Inject
	public var model:ILayoutModel;
	
	override public function execute(?request:Request):Void 
	{
		
		this.model.setLayoutMode( cast(request, LayoutModeRequest).mode );
	}
	
}