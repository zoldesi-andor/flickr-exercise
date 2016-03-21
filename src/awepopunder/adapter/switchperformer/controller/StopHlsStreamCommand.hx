package awepopunder.adapter.switchperformer.controller;

import com.module.stream.player.hlsplayer.IHlsPlayerModule;
import hex.control.command.BasicCommand;
import hex.control.Request;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author duke
 */
class StopHlsStreamCommand extends BasicCommand implements ISpeedInjectorContainer
{
	@Inject("hlsPlayerModule")
	public var hlsPlayer:IHlsPlayerModule;

	override public function execute(?request:Request):Void 
	{
		#if debug
		hex.log.Logger.DEBUG("StopHlsStreamCommand.execute");
		#end
		
		this.hlsPlayer.stop( );
	}
	
}