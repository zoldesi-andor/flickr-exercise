package example.module.hello.controller;

import example.module.hello.model.IMessageModel;
import hex.control.command.BasicCommand;
import hex.control.request.StringRequest;
import hex.di.IInjectorContainer;

/**
 * ...
 * @author ali_o_kan - Laurent Deketelaere
 */
class SetMessageCommand extends BasicCommand implements IInjectorContainer
{
	@Inject
	public var messageModel:IMessageModel;
	
	public function execute( ?request:StringRequest ) : Void 
	{
		this.getLogger().debug("SetMessageCommand execute message : " + request.value);
		messageModel.setMessage( request.value );
	}
	
}