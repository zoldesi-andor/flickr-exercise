package awepopunder.adapter.bootstrap.controller;

import awepopunder.service.performer.IPerformerDataService;
import awepopunder.service.performer.PerformerDataServiceParameters;
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
class LoadPerformerDataCommand extends AsyncCommand implements IHTTPServiceListener<HTTPServiceEvent>
{
	@inject("name=performerDataService")
	public var performerDataService:IPerformerDataService;
	
	@inject("name=initialApplicationSettings")
	public var initialApplicationSettings:InitialApplicationSettingsVO;


	override public function execute(?e:IEvent):Void 
	{
		//TODO: get connection params from config
		var config:HTTPServiceConfiguration = new HTTPServiceConfiguration( "http://promo.awempire.com/live_feeds/get_performer_base.php" );
		config.parameters = new PerformerDataServiceParameters( this.initialApplicationSettings.filterSettings.category, this.initialApplicationSettings.filterSettings.tId, "", this.initialApplicationSettings.siteSettings.site );
		
		this.performerDataService.setConfiguration( config );
		
		this.performerDataService.addHTTPServiceListener( this );
		this.performerDataService.call();
	}
	
	public function onServiceComplete(e:HTTPServiceEvent):Void 
	{
		if ( this.performerDataService.getPerformerData().success )
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
		return [this.performerDataService.getPerformerData().data];
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
		this.performerDataService.removeHTTPServiceListener(this);
		super._release();
	}
	
}