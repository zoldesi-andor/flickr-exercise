package awepopunder.module.performerprovider.controller;

import awepopunder.module.performerprovider.message.PerformerProviderModulePublicMessage;
import awepopunder.module.performerprovider.model.IPerformerProviderModel;
import awepopunder.service.performer.performerdata.IPerformerDataService;
import awepopunder.service.performer.performerdata.PerformerDataServiceParameters;
import awepopunder.vo.performer.PerformerDataVO;
import hex.control.Request;
import hex.control.async.AsyncCommand;
import hex.service.ServiceResultVO;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.http.IHTTPService;
import hex.service.stateless.http.IHTTPServiceListener;

/**
 * ...
 * @author 
 */
@:rtti
class LoadNextPerformerCommand extends AsyncCommand implements IHTTPServiceListener<HTTPServiceConfiguration>
{
	@Inject
	public var performerDataService:IPerformerDataService;
	
	@Inject
	public var performerProviderModel:IPerformerProviderModel;
	

	override public function execute(?request:Request):Void 
	{
		#if debug
		hex.log.Logger.DEBUG("awepopunder.module.performerprovider.controller.LoadNextPerformerCommand");
		#end
		
		this.performerProviderModel.increaseAutoPerformerSwitchCount( );
		
		var config:HTTPServiceConfiguration = this.performerDataService.getConfiguration();
		config.parameters = new PerformerDataServiceParameters( this.performerProviderModel.getFilterSettings().category, this.performerProviderModel.getSite(), "", this.performerProviderModel.getFilterSettings().preferredPerformerList, this.performerProviderModel.getFilterSettings().templateId);
		
		this.performerDataService.setConfiguration( config );
		
		this.performerDataService.addHTTPServiceListener( this );
		this.performerDataService.call();
	}
	
	public function onServiceComplete(e:IHTTPService<HTTPServiceConfiguration>):Void 
	{
		var result:ServiceResultVO<PerformerDataVO> = this.performerDataService.getPerformerData();
		
		#if debug
		hex.log.Logger.DEBUG("LoadNextPerformerCommand.onServiceComplete success: " + result.success);
		#end
		
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
	public function onServiceFail(e:IHTTPService<HTTPServiceConfiguration>):Void 
	{
		#if debug
		hex.log.Logger.DEBUG("LoadNextPerformerCommand.onServiceFail");
		#end
		this._handleFail();
	}
	
	public function onServiceCancel(e:IHTTPService<HTTPServiceConfiguration>):Void 
	{
		#if debug
		hex.log.Logger.DEBUG("LoadNextPerformerCommand.onServiceCancel");
		#end
		this._handleCancel();
	}
	
	//TODO: manage timeout
	public function onServiceTimeout(e:IHTTPService<HTTPServiceConfiguration>):Void 
	{
		#if debug
		hex.log.Logger.DEBUG("LoadNextPerformerCommand.onServiceTimeout");
		#end
		this._handleFail();
	}
	
	override function _release():Void 
	{
		#if debug
		hex.log.Logger.DEBUG("LoadNextPerformerCommand._release");
		#end
		this.performerDataService.removeHTTPServiceListener(this);
		super._release();
	}
	
}