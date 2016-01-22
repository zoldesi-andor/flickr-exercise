package awepopunder.adapter.switchperformer.controller;
import awepopunder.vo.settings.application.InitialApplicationSettingsVO;
import hex.control.async.AsyncCommand;
import hex.control.Request;

/**
 * ...
 * @author Chris
 */
@:rtti
class ForcePerformerValidatorCommand extends AsyncCommand
{
	@Inject("name=initialApplicationSettings")
	public var initialApplicationSettings:InitialApplicationSettingsVO;

	override public function execute(?request:Request):Void 
	{
		if ( this.initialApplicationSettings.filterSettings.forcePerformer )
		{
			this._handleFail( );
		}
		else
		{
			this._handleComplete( );
		}
	}
	
}