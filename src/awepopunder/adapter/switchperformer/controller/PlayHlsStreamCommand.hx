package awepopunder.adapter.switchperformer.controller;

import com.module.stream.player.hlsplayer.IHlsPlayerModule;
import hex.control.command.BasicCommand;
import hex.control.Request;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author duke
 */
class PlayHlsStreamCommand extends BasicCommand implements ISpeedInjectorContainer
{
	@Inject("hlsPlayerModule")
	public var hlsPlayer:IHlsPlayerModule;

	override public function execute(?request:Request):Void 
	{
		#if debug
		hex.log.Logger.DEBUG("PlayHlsStreamCommand.execute");
		#end
		
		this.hlsPlayer.play( );
	}
}