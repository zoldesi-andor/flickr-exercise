package awepopunder.adapter.bootstrap.controller;

import awepopunder.service.settings.application.ApplicationSettingsServiceParameters;
import awepopunder.service.settings.application.IApplicationSettingsService;
import awepopunder.vo.settings.application.ApplicationSettingsVO;
import awepopunder.vo.settings.application.InitialApplicationSettingsVO;
import com.service.net.chatwebsocket.ChatWebSocketServiceConfiguration;
import com.service.net.chatwebsocket.IChatWebSocketService;
import hex.control.async.AsyncCommand;
import hex.event.IEvent;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.http.HTTPServiceEvent;
import hex.service.stateless.http.IHTTPServiceListener;

/**
 * ...
 * @author duke
 */
@:rtti
class LoadApplicationSettingsCommand extends AsyncCommand implements IHTTPServiceListener<HTTPServiceEvent>
{
	@inject("name=applicationSettingsService")
	public var applicationSettingsService:IApplicationSettingsService;
	
	@inject("name=initialApplicationSettings")
	public var initialApplicationSettings:InitialApplicationSettingsVO;

	override public function execute(?e:IEvent):Void 
	{
		//TODO: get connection params from config
		var config:HTTPServiceConfiguration = new HTTPServiceConfiguration( "http://promo.awempire.com/live_feeds/get_settings_base.php" );
		config.parameters = new ApplicationSettingsServiceParameters( this.initialApplicationSettings.siteSettings.cobrandId, this.initialApplicationSettings.siteSettings.language, this.initialApplicationSettings.siteSettings.site );
		
		this.applicationSettingsService.setConfiguration( config );
		
		this.applicationSettingsService.addHTTPServiceListener( this );
		this.applicationSettingsService.call();
	}
	
	public function onServiceComplete(e:HTTPServiceEvent):Void 
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
	public function onServiceFail(e:HTTPServiceEvent):Void 
	{
		this._handleFail();
	}
	
	public function onServiceCancel(e:HTTPServiceEvent):Void 
	{
		this._handleCancel( );
	}
	
	//TODO: manage timeout
	public function onServiceTimeout(e:HTTPServiceEvent):Void 
	{
		this._handleFail( );
	}
	
	override function _release():Void 
	{
		this.applicationSettingsService.removeHTTPServiceListener(this);
		super._release();
	}
	
}