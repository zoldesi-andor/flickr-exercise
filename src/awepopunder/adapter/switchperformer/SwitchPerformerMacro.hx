package awepopunder.adapter.switchperformer;

import awepopunder.adapter.bootstrap.controller.SetHlsStreamCommand;
import awepopunder.adapter.switchperformer.controller.ClearChatMessagesCommand;
import awepopunder.adapter.switchperformer.controller.LoadNextPerformerCommand;
import awepopunder.adapter.switchperformer.controller.MaxAutoPerformerSwitchValidatorCommand;
import awepopunder.adapter.switchperformer.controller.SetOfflineCommand;
import awepopunder.adapter.switchperformer.controller.SetOnlineCommand;
import awepopunder.adapter.switchperformer.controller.PlayHlsStreamCommand;
import awepopunder.adapter.switchperformer.controller.SetStreamRatioCommand;
import awepopunder.adapter.switchperformer.controller.StopHlsStreamCommand;
import awepopunder.adapter.switchperformer.controller.SubscribeChatRoomCommand;
import awepopunder.vo.performer.PerformerDataVO;
import hex.control.async.AsyncCommand;
import hex.control.async.AsyncHandler;
import hex.control.payload.ExecutionPayload;
import hex.event.MacroAdapterStrategy;

/**
 * ...
 * @author duke
 */
@:rtti
class SwitchPerformerMacro extends MacroAdapterStrategy
{

	public function new(target:Dynamic, method:Dynamic) 
	{
		super(this, this.onAdapt);
		
	}
	
	override function _prepare():Void 
	{
		//TODO: add manual switch support
		this.add(MaxAutoPerformerSwitchValidatorCommand).withFailHandlers(new AsyncHandler(this, this._onMaxSwitchPerformerValidationFailed));
		this.add(LoadNextPerformerCommand).withCompleteHandlers(new AsyncHandler(this, this._onPerformerDataLoaded));
	}
	
	function _onMaxSwitchPerformerValidationFailed( command:AsyncCommand ):Void
	{
		this.add(StopHlsStreamCommand);
		this.add(SetOfflineCommand);
	}
	
	private function _onPerformerDataLoaded( command:AsyncCommand ):Void
	{
		trace("SwitchPerformerMacro._onPerformerDataLoaded", command.getPayload()[0]);
		
		var performerDataPayload:ExecutionPayload = new ExecutionPayload(command.getPayload()[0], PerformerDataVO);
		
		this.add(StopHlsStreamCommand);
		this.add(SetHlsStreamCommand).withPayloads([performerDataPayload]);
		this.add(PlayHlsStreamCommand);
		this.add(SetStreamRatioCommand).withPayloads([performerDataPayload]);
		this.add(ClearChatMessagesCommand);
		this.add(SubscribeChatRoomCommand).withPayloads([performerDataPayload]);
		this.add(SetOnlineCommand);
	}
	
	
	public function onAdapt( ) : Void
	{
		
	}
}