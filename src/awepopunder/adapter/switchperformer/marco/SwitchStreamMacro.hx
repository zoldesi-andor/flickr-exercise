package awepopunder.adapter.switchperformer.marco;

import awepopunder.adapter.bootstrap.controller.SetHlsStreamCommand;
import awepopunder.adapter.switchperformer.controller.SetStreamRatioCommand;
import awepopunder.adapter.switchperformer.controller.StopHlsStreamCommand;
import awepopunder.vo.performer.PerformerDataVO;
import hex.control.macro.Macro;
import hex.control.payload.ExecutionPayload;

/**
 * ...
 * @author duke
 */
class SwitchStreamMacro extends Macro
{
	@Inject
	public var performerData:PerformerDataVO;
	
	@Inject("name=previous")
	public var previousPerformerData:PerformerDataVO;

	override function _prepare():Void 
	{
		if ( this.previousPerformerData.performerId != null )
		{
			this.add(StopHlsStreamCommand);
		}
		
		var performerDataPayload = new ExecutionPayload(this.performerData, PerformerDataVO);
		
		this.add(SetHlsStreamCommand).withPayloads([performerDataPayload]);
		this.add(SetStreamRatioCommand).withPayloads([performerDataPayload]);
	}
	
}