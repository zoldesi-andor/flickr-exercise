package awepopunder.adapter.bootstrap.controller;

import awepopunder.service.performer.IPerformerDataService;
import awepopunder.service.performer.PerformerDataServiceParameters;
import awepopunder.vo.settings.application.InitialApplicationSettingsVO;
import hex.control.async.AsyncCommand;
import hex.control.Request;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.http.IHTTPService;
import hex.service.stateless.http.IHTTPServiceListener;

/**
 * ...
 * @author duke
 */
@:rtti
class LoadPerformerDataCommand extends AsyncCommand implements IHTTPServiceListener
{
	@inject("name=performerDataService")
	public var performerDataService:IPerformerDataService;
	
	@inject("name=initialApplicationSettings")
	public var initialApplicationSettings:InitialApplicationSettingsVO;


	override public function execute( ?request : Request ):Void 
	{
		//TODO: get connection params from config
		var config:HTTPServiceConfiguration = new HTTPServiceConfiguration( "http://promo.awempire.com/live_feeds/get_performer_base.php" );
		config.parameters = new PerformerDataServiceParameters( this.initialApplicationSettings.filterSettings.category, this.initialApplicationSettings.filterSettings.templateId, "", this.initialApplicationSettings.siteSettings.site );
		
		this.performerDataService.setConfiguration( config );
		
		this.performerDataService.addHTTPServiceListener( this );
		this.performerDataService.call();
	}
	
	public function onServiceComplete(e:IHTTPService):Void 
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
		this.performerDataService.removeHTTPServiceListener(this);
		super._release();
	}
	
}