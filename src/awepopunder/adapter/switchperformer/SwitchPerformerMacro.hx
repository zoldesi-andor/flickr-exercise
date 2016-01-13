package awepopunder.adapter.switchperformer;

import awepopunder.adapter.bootstrap.controller.InitHlsStreamCommand;
import awepopunder.adapter.bootstrap.controller.SetOnlineCommand;
import awepopunder.adapter.switchperformer.controller.SubscribeChatRoomCommand;
import awepopunder.vo.performer.PerformerDataVO;
import hex.control.payload.ExecutionPayload;
import hex.event.MacroAdapterStrategy;

/**
 * ...
 * @author 
 */
@:rtti
class SwitchPerformerMacro extends MacroAdapterStrategy
{
	private var _performerData:PerformerDataVO;

	public function new(target:Dynamic, method:Dynamic) 
	{
		super(this, this.onAdapt);
		
	}
	
	override function _prepare():Void 
	{
		var performerDataPayload:ExecutionPayload = new ExecutionPayload(this._performerData, PerformerDataVO);
		this.add(InitHlsStreamCommand).withPayloads([performerDataPayload]);
		this.add(SubscribeChatRoomCommand).withPayloads([performerDataPayload]);
		this.add(SetOnlineCommand);
	}
	
	
	public function onAdapt( performerData:PerformerDataVO ) : Void
	{
		this._performerData = performerData;
	}
}