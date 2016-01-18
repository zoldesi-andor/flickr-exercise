package awepopunder.adapter.switchperformer.controller;

import awepopunder.module.performerprovider.IPerformerProviderModule;
import hex.control.async.AsyncCommand;
import hex.control.Request;

/**
 * ...
 * @author duke
 */
@:rtti
class MaxAutoPerformerSwitchValidatorCommand extends AsyncCommand
{
	@inject("name=performerProviderModule")
	public var performerProviderModule:IPerformerProviderModule;

	override public function execute(?request:Request):Void 
	{
		if ( this.performerProviderModule.isAutoPerformerSwitchLimitReached() )
		{
			this._handleFail( );
		}
		else
		{
			this._handleComplete( );
		}
	}
	
}