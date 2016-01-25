package awepopunder.adapter.switchperformer.controller;

import com.module.stream.player.hlsplayer.IHlsPlayerModule;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author duke
 */
@:rtti
class StopHlsStreamCommand extends BasicCommand
{
	@Inject("name=hlsPlayerModule")
	public var hlsPlayer:IHlsPlayerModule;

	override public function execute(?request:Request):Void 
	{
		this.hlsPlayer.stop( );
	}
	
}