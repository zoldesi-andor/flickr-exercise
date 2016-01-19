package awepopunder.module.performerprovider.controller;

import awepopunder.module.performerprovider.message.PerformerProviderModulePublicMessage;
import awepopunder.module.performerprovider.model.IPerformerProviderModel;
import awepopunder.service.performer.performerdata.IPerformerDataService;
import awepopunder.service.performer.performerdata.PerformerDataServiceParameters;
import awepopunder.vo.performer.PerformerDataVO;
import hex.control.async.AsyncCommand;
import hex.control.Request;
import hex.service.ServiceResultVO;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.http.IHTTPService;
import hex.service.stateless.http.IHTTPServiceListener;

/**
 * ...
 * @author 
 */
@:rtti
class LoadNextPerformerCommand extends AsyncCommand implements IHTTPServiceListener
{
	@inject
	public var performerDataService:IPerformerDataService;
	
	@inject
	public var performerProviderModel:IPerformerProviderModel;
	

	override public function execute(?request:Request):Void 
	{
		this.performerProviderModel.increaseAutoPerformerSwitchCount( );
		
		var config:HTTPServiceConfiguration = cast this.performerDataService.getConfiguration();
		config.parameters = new PerformerDataServiceParameters( this.performerProviderModel.getFilterSettings().category, this.performerProviderModel.getFilterSettings().templateId, "", this.performerProviderModel.getSite() );
		
		this.performerDataService.addHTTPServiceListener( this );
		this.performerDataService.call();
	}
	
	public function onServiceComplete(e:IHTTPService):Void 
	{
		var result:ServiceResultVO<PerformerDataVO> = this.performerDataService.getPerformerData();
		
		if ( result.success )
		{
			this.performerProviderModel.setPerformerData( result.data );
			this._handleComplete();
			
			this._owner.dispatchPublicMessage( PerformerProviderModulePublicMessage.PERFORMER_DATA_UPDATED, [result.data] );
		}
		else
		{
			this._handleFail();
		}
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