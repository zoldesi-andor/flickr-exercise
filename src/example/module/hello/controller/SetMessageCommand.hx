package example.module.hello.controller;

import example.module.hello.model.IMessageModel;
import hex.control.command.BasicCommand;
import hex.control.Request;
import hex.di.IInjectorContainer;

/**
 * ...
 * @author ali_o_kan - Laurent Deketelaere
 */
class SetMessageCommand extends BasicCommand implements IInjectorContainer
{
	
	@Inject
	public var messageModel:IMessageModel;
	
	public function execute( ?request:Request ) : Void 
	{
		this.getLogger().debug("SetMessageCommand execute");
		messageModel.setMessage("Hello World");
	}
	
}