package awepopunder.adapter.switchperformer.controller;

import awepopunder.module.performerprovider.IPerformerProviderModule;
import awepopunder.module.performerprovider.message.PerformerProviderModulePublicMessage;
import awepopunder.vo.performer.PerformerDataVO;
import hex.control.async.AsyncCommand;
import hex.control.Request;

/**
 * ...
 * @author 
 */
@:rtti
class LoadNextPerformerCommand extends AsyncCommand
{
	@inject("name=performerProviderModule")
	public var performerProviderModule:IPerformerProviderModule;

	override public function execute(?request:Request):Void 
	{
		this.performerProviderModule.loadNextPerformer();
		this.performerProviderModule.addHandler( PerformerProviderModulePublicMessage.PERFORMER_DATA_UPDATED, this, this.onLoaded );
	}
	
	override public function getPayload():Array<Dynamic> 
	{
		return [this.performerProviderModule.getActivePerformer()];
	}
	
	public function onLoaded( performerData:PerformerDataVO ):Void
	{
		this._handleComplete();
	}
	
	override function _release():Void 
	{
		this.performerProviderModule.removeHandler( PerformerProviderModulePublicMessage.PERFORMER_DATA_UPDATED, this, this.onLoaded );
		super._release();
	}
	
}