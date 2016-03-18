package awepopunder.adapter.switchperformer.controller;

import awepopunder.vo.performer.PerformerDataVO;
import com.module.image.IImageModule;
import hex.control.Request;
import hex.control.command.BasicCommand;

/**
 * ...
 * @author duke
 */
@:rtti
class SetPerformerProfilePictureCommand extends BasicCommand
{
	@Inject
	public var performerData:PerformerDataVO;
	
	@Inject("name=profilePictureModule")
	public var profilePictureModule:IImageModule;

	override public function execute(?request:Request):Void 
	{
		#if debug
		hex.log.Logger.DEBUG("SetPerformerProfilePictureCommand.execute");
		#end
		
		this.profilePictureModule.setUrl( this.performerData.imageUrl );
	}
	
}