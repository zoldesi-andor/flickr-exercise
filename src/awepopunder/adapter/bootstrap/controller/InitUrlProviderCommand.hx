package awepopunder.adapter.bootstrap.controller;

import awepopunder.vo.settings.application.InternalApplicationSettingsVO;
import com.module.asset.urlprovider.IUrlProviderModule;
import hex.control.command.BasicCommand;
import hex.control.Request;
import hex.di.ISpeedInjectorContainer;

/**
 * ...
 * @author duke
 */
class InitUrlProviderCommand extends BasicCommand implements ISpeedInjectorContainer
{
	@Inject("urlProviderModule")
	public var urlProviderModule:IUrlProviderModule;
	
	@Inject("internalApplicationSettings")
	public var internalApplicationSettings:InternalApplicationSettingsVO;

	override public function execute(?request:Request):Void 
	{
		this.urlProviderModule.setUrlData( this.internalApplicationSettings.appletUrl );
	}
	
}