package awepopunder.adapter.switchperformer;

import awepopunder.adapter.bootstrap.controller.InitHlsStreamCommand;
import awepopunder.adapter.switchperformer.controller.LoadNextPerformerCommand;
import awepopunder.adapter.bootstrap.controller.SetOnlineCommand;
import awepopunder.adapter.switchperformer.controller.SetStreamRatioCommand;
import awepopunder.adapter.switchperformer.controller.SubscribeChatRoomCommand;
import awepopunder.vo.performer.PerformerDataVO;
import hex.control.async.AsyncCommand;
import hex.control.async.AsyncHandler;
import hex.control.payload.ExecutionPayload;
import hex.event.MacroAdapterStrategy;

/**
 * ...
 * @author 
 */
@:rtti
class SwitchPerformerMacro extends MacroAdapterStrategy
{
	//private var _performerData:PerformerDataVO;

	public function new(target:Dynamic, method:Dynamic) 
	{
		super(this, this.onAdapt);
		
	}
	
	override function _prepare():Void 
	{
		this.add(LoadNextPerformerCommand).withCompleteHandlers(new AsyncHandler(this, this._onPerformerDataLoaded));
	}
	
	private function _onPerformerDataLoaded( command:AsyncCommand ):Void
	{
		var performerDataPayload:ExecutionPayload = new ExecutionPayload(command.getPayload()[0], PerformerDataVO);
		this.add(InitHlsStreamCommand).withPayloads([performerDataPayload]);
		this.add(SetStreamRatioCommand).withPayloads([performerDataPayload]);
		this.add(SubscribeChatRoomCommand).withPayloads([performerDataPayload]);
		this.add(SetOnlineCommand);
	}
	
	
	public function onAdapt( /*performerData:PerformerDataVO*/ ) : Void
	{
		//this._performerData = performerData;
	}
}