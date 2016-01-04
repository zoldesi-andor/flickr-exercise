package awepopunder.adapter.bootstrap.controller;

import com.module.stream.player.hlsplayer.IHlsPlayerModule;
import com.module.stream.player.hlsplayer.vo.HlsVO;
import hex.control.command.BasicCommand;
import hex.event.IEvent;

/**
 * ...
 * @author 
 */
@:rtti
class InitHlsStreamCommand extends BasicCommand
{
	@inject
	public var hlsPlayer:IHlsPlayerModule;

	override public function execute(?e:IEvent):Void 
	{
		//TODO: read stream url from configuration
		var streamVO:HlsVO = new HlsVO();
		streamVO.streamUrl = "http://192.168.206.47:1935/dashtest/myStream/playlist.m3u8";
		this.hlsPlayer.setStream( streamVO );
	}
	
}