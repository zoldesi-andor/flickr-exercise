package example.module.mainimage.controller;

import hex.control.macro.Macro;
import example.module.mainimage.controller.GetRandomPhotosCommand;

/**
 * ...
 * @author azoldesi
 */
class GetRandomImageCommand extends Macro
{	
	override function _prepare(): Void
	{
		var getRandomPhotosMapping = this.add(GetRandomPhotosCommand);
		this.add(GetFullSizedPhotoCommand).withMappingResults([getRandomPhotosMapping]);
	}
}