package awepopunder.adapter.bootstrap.controller;

import awepopunder.vo.performer.PerformerDataVO;
import com.module.stream.player.hlsplayer.IHlsPlayerModule;
import com.module.stream.player.hlsplayer.vo.HlsVO;
import hex.control.command.BasicCommand;
import hex.control.Request;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author 
 */
class SetHlsStreamCommand extends BasicCommand implements ISpeedInjectorContainer
{
	@Inject("hlsPlayerModule")
	public var hlsPlayer:IHlsPlayerModule;
	
	@Inject
	public var performerData:PerformerDataVO;

	override public function execute(?request:Request):Void 
	{
		//TODO: read stream url from configuration
		var streamVO = new HlsVO();
		streamVO.streamUrl = this.performerData.streamUrl;
		
		this.hlsPlayer.setStream( streamVO );
	}
	
}