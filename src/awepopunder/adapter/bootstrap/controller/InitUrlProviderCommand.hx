package awepopunder.adapter.bootstrap.controller;

import awepopunder.vo.settings.application.InternalApplicationSettingsVO;
import com.module.asset.urlprovider.IUrlProviderModule;
import hex.control.command.BasicCommand;
import hex.control.Request;

/**
 * ...
 * @author duke
 */
@:rtti
class InitUrlProviderCommand extends BasicCommand
{
	@Inject("name=urlProviderModule")
	public var urlProviderModule:IUrlProviderModule;
	
	@Inject("name=internalApplicationSettings")
	public var internalApplicationSettings:InternalApplicationSettingsVO;

	override public function execute(?request:Request):Void 
	{
		this.urlProviderModule.setUrlData( this.internalApplicationSettings.appletUrl );
	}
	
}