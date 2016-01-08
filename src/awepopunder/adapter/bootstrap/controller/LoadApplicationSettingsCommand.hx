package awepopunder.adapter.bootstrap.controller;

import awepopunder.service.settings.application.ApplicationSettingsServiceParameters;
import awepopunder.service.settings.application.IApplicationSettingsService;
import awepopunder.vo.settings.application.ApplicationSettingsVO;
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
	
	@inject("name=chatWebSocketService")
	public var chatWebSocketService:IChatWebSocketService;

	override public function execute(?e:IEvent):Void 
	{
		//TODO: get connection params from config
		var config:HTTPServiceConfiguration = new HTTPServiceConfiguration( "http://promo.awempire.com/live_feeds/get_settings_base.php" );
		config.parameters = new ApplicationSettingsServiceParameters( "", "en", "jasmin", "popunder" );
		
		this.applicationSettingsService.setConfiguration( config );
		
		this.applicationSettingsService.addHTTPServiceListener( this );
		this.applicationSettingsService.call();
	}
	
	public function onServiceComplete(e:HTTPServiceEvent):Void 
	{
		var config:ChatWebSocketServiceConfiguration = this.chatWebSocketService.getConfiguration();
		
		var settings:ApplicationSettingsVO = this.applicationSettingsService.getApplicationSettings().data;
		
		config.host = settings.chatHost;
		config.port = settings.chatPort;
		config.path = settings.chatPath;
		config.resource = settings.chatResource;
		config.roomHost = settings.chatRoomHost;
		
		this._handleComplete();
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