package example.module.hello;

import example.module.hello.controller.SetMessageCommand;
import example.module.hello.message.HelloModuleMessage;
import example.module.hello.model.IMessageModel;
import example.module.hello.model.MessageModel;
import example.module.hello.view.HelloViewHelper;
import example.module.hello.view.IHelloView;
import hex.config.stateless.StatelessCommandConfig;
import hex.config.stateless.StatelessModelConfig;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;
import hex.module.Module;



/**
 * ...
 * @author ali_o_kan - Laurent Deketelaere
 */
class HelloModule extends Module implements IHelloModule
{

	public function new( view : IHelloView ) 
	{
		super();
		
		this._addStatelessConfigClasses([CommandConfig, ModelConfig]);
		
		this.buildViewHelper( HelloViewHelper, view );
		
		// call command
		this._dispatchPrivateMessage( HelloModuleMessage.SET_MESSAGE); 
	}
	
	override function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd = new RuntimeDependencies();
		return rd;
	}
}

private class CommandConfig extends StatelessCommandConfig
{
	override public function configure():Void
	{
		this.map( HelloModuleMessage.SET_MESSAGE, SetMessageCommand );
	}
}

private class ModelConfig extends StatelessModelConfig
{
	override public function configure() : Void
	{
		this.mapModel( IMessageModel, MessageModel);
	}
}