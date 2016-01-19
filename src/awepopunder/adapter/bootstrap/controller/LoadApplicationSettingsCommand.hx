package awepopunder.adapter.bootstrap.controller;

import awepopunder.service.settings.application.ApplicationSettingsServiceParameters;
import awepopunder.service.settings.application.IApplicationSettingsService;
import awepopunder.vo.settings.application.InitialApplicationSettingsVO;
import hex.control.async.AsyncCommand;
import hex.control.Request;
import hex.core.IMetadataParsable;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.http.IHTTPService;
import hex.service.stateless.http.IHTTPServiceListener;

/**
 * ...
 * @author duke
 */
@:rtti
class LoadApplicationSettingsCommand extends AsyncCommand implements IHTTPServiceListener implements IMetadataParsable
{
	@inject("name=applicationSettingsService")
	public var applicationSettingsService:IApplicationSettingsService;
	
	@inject("name=initialApplicationSettings")
	public var initialApplicationSettings:InitialApplicationSettingsVO;
	
	@url("applicationSettings")
	public var applicationSettingsUrl:String;

	override public function execute( ?request : Request ):Void 
	{
		var config:HTTPServiceConfiguration = new HTTPServiceConfiguration( this.applicationSettingsUrl );
		config.parameters = new ApplicationSettingsServiceParameters( this.initialApplicationSettings.siteSettings.cobrandId, this.initialApplicationSettings.siteSettings.language, this.initialApplicationSettings.siteSettings.site );
		
		this.applicationSettingsService.setConfiguration( config );
		
		this.applicationSettingsService.addHTTPServiceListener( this );
		this.applicationSettingsService.call();
	}
	
	public function onServiceComplete(e:IHTTPService):Void 
	{
		if ( this.applicationSettingsService.getApplicationSettings().success )
		{
			this._handleComplete();
		}
		else
		{
			this._handleFail();
		}
	}
	
	override public function getPayload():Array<Dynamic> 
	{
		return [this.applicationSettingsService.getApplicationSettings().data];
	}
	
	//TODO: manage fail
	public function onServiceFail(e:IHTTPService):Void 
	{
		this._handleFail();
	}
	
	public function onServiceCancel(e:IHTTPService):Void 
	{
		this._handleCancel( );
	}
	
	//TODO: manage timeout
	public function onServiceTimeout(e:IHTTPService):Void 
	{
		this._handleFail( );
	}
	
	override function _release():Void 
	{
		this.applicationSettingsService.removeHTTPServiceListener(this);
		super._release();
	}
	
}