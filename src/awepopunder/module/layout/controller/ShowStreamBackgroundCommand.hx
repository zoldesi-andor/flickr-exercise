package awepopunder.module.layout.controller;
import awepopunder.module.layout.view.LayoutViewHelper;
import hex.control.Request;
import hex.control.command.BasicCommand;

@:rtti
class ShowStreamBackgroundCommand extends BasicCommand
{
	@Inject
	public var layoutViewHelper:LayoutViewHelper;

	override public function execute( ?request : Request ) : Void
	{
		this.layoutViewHelper.showStreamBackground( );
	}
}
