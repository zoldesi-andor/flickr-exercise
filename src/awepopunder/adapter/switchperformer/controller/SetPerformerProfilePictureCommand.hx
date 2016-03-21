package awepopunder.adapter.switchperformer.controller;

import awepopunder.vo.performer.PerformerDataVO;
import com.module.image.IImageModule;
import hex.control.Request;
import hex.control.command.BasicCommand;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author duke
 */
class SetPerformerProfilePictureCommand extends BasicCommand implements ISpeedInjectorContainer
{
	@Inject
	public var performerData:PerformerDataVO;
	
	@Inject("profilePictureModule")
	public var profilePictureModule:IImageModule;

	override public function execute(?request:Request):Void 
	{
		#if debug
		hex.log.Logger.DEBUG("SetPerformerProfilePictureCommand.execute");
		#end
		
		this.profilePictureModule.setUrl( this.performerData.imageUrl );
	}
	
}