package awepopunder.service.performer.performerstatus;

import awepopunder.service.performer.performerstatus.constant.PerformerStatus;
import awepopunder.service.performer.performerstatus.IPerformerStatusService;
import awepopunder.service.performer.performerstatus.message.PerformerStatusServiceMessage;
import haxe.Json;
import haxe.Timer;
import hex.core.IAnnotationParsable;
import hex.data.IParser;
import hex.service.ServiceResultVO;
import hex.service.stateful.StatefulService;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.http.HTTPServiceParameters;
import hex.service.stateless.http.IHTTPService;
import hex.service.stateless.http.IHTTPServiceListener;

/**
 * Can periodically check for a performer status and notify about it, but it has timeout behavior,
 * so after a certain time it will says Offline even if the server answered online, 
 * because the checking was not stopped, so something is wrong.
 * @author dukr
 */
@:rtti
class PerformerStatusService extends StatefulService<PerformerStatusServiceConfiguration> implements IPerformerStatusService implements IHTTPServiceListener<HTTPServiceConfiguration> implements IAnnotationParsable
{
	@url("modelStatus")
	public var serviceUrl:String;
	
	var _performerStatusHttpSerice:PerformerStatusHttpSerice;
	
	var _performerId:String;
	
	var _checkTimer:Timer;
	var _checkTimerCounter:UInt = 0;

	public function new() 
	{
		super();
	}
	
	@postConstruct
	override public function createConfiguration():Void 
	{
		this.setConfiguration( new PerformerStatusServiceConfiguration(this.serviceUrl) );
	}
	
	public function startCheckPerformer( performerId:String ):Void
	{
		trace("PerformerStatusService.startCheckPerformer", performerId);
		this._lock();
		
		this._performerId = performerId;
		
		this._createNewService( );
		
		this._checkTimer = new Timer(this._configuration.checkInterval);
		this._checkTimerCounter = 0;
		
		this._performerStatusHttpSerice.call();
		this._checkTimer.run = this._onTimer;
		
	}
	
	public function stopCheckPerformer( performerId:String ):Void
	{
		trace("PerformerStatusService.stopCheckPerformer", performerId);
		this._performerStatusHttpSerice.release();
		this._performerStatusHttpSerice.removeHTTPServiceListener( this );
		this._performerStatusHttpSerice = null;
		this._checkTimer.stop();
		
		this._release();
	}
	
	public function onServiceComplete(service:IHTTPService<HTTPServiceConfiguration>):Void 
	{
		var status:PerformerStatus = this._performerStatusHttpSerice.getPerformerStatus().data.status;
		//trace("PerformerStatusService.onServiceComplete", status);
		
		if ( status == PerformerStatus.FreeChat )
		{
			this._compositeDispatcher.dispatch( PerformerStatusServiceMessage.ONLINE, [this._performerStatusHttpSerice.getPerformerStatus().data] );
		}
		else
		{
			this._compositeDispatcher.dispatch( PerformerStatusServiceMessage.OFFLINE, [this._performerStatusHttpSerice.getPerformerStatus().data] );
		}
		
		this._createNewService( );
	}
	
	function _createNewService() 
	{
		if ( this._performerStatusHttpSerice != null )
		{
			this._performerStatusHttpSerice.removeHTTPServiceListener(this);
		}
			
		
		this._performerStatusHttpSerice = new PerformerStatusHttpSerice();
		this._performerStatusHttpSerice.createConfiguration();
		this._performerStatusHttpSerice.addHTTPServiceListener(this);
		
		var params= new PerformerStatusHttpServiceParameters();
		params.performerId = this._performerId;
		
		var config:HTTPServiceConfiguration = this._performerStatusHttpSerice.getConfiguration();
		config.serviceUrl = this._configuration.url;
		config.parameters = params;
	}
	
	function _onTimer():Void
	{
		this._checkTimerCounter++;
		//trace("PerformerStatusService._onTimer", this._checkTimerCounter);
		
		if ( this._checkTimerCounter >= this._configuration.dispatchOfflineCheckCount )
		{
			this._setPerformerOffline( );
			this.stopCheckPerformer( this._performerId );
		}
		else if ( !this._performerStatusHttpSerice.wasUsed )
		{
			this._performerStatusHttpSerice.call();
		}
	}
	
	/**
	 * We propagate the performer offline even if the service says it's only, because checking is still required, so something is wrong.
	 */
	function _setPerformerOffline() 
	{
		var performerStatus= new PerformerStatusVO( );
		performerStatus.performerId = this._performerId;
		performerStatus.status = PerformerStatus.Offline;
		
		this._compositeDispatcher.dispatch( PerformerStatusServiceMessage.OFFLINE, [performerStatus] );
	}
	
	public function onServiceFail(service:IHTTPService<HTTPServiceConfiguration>):Void 
	{
		trace("PerformerStatusService.onServiceFail");
		this._createNewService( );
	}
	
	public function onServiceCancel(service:IHTTPService<HTTPServiceConfiguration>):Void 
	{
		trace("PerformerStatusService.onServiceCancel");
		this._createNewService( );
	}
	
	public function onServiceTimeout(service:IHTTPService<HTTPServiceConfiguration>):Void 
	{
		trace("PerformerStatusService.onServiceTimeout");
		this._createNewService( );
	}
	
}

private class PerformerStatusHttpSerice extends HTTPService<HTTPServiceConfiguration>
{
	override public function createConfiguration():Void 
	{
		this.setConfiguration( new HTTPServiceConfiguration() );
		this.setParser( new PerformerStatusHttpServiceParser() );
	}
	
	public function getPerformerStatus( ):ServiceResultVO<PerformerStatusVO>
	{
		return this._result;
	}
}

private class PerformerStatusHttpServiceParameters extends HTTPServiceParameters
{
	public var performerId:String;
	public var responseFormat:String = "json";
	
	public function new()
	{
		super();
	}
}

private class PerformerStatusHttpServiceParser implements IParser
{
	public function new( )
	{
		
	}
	
	public function parse(serializedContent:Dynamic, target:Dynamic = null):Dynamic 
	{
		var result= new ServiceResultVO<PerformerStatusVO>();
		
		var jsonData:Dynamic;
		try
		{
			jsonData = Json.parse(serializedContent);
		}
		catch (error:Dynamic)
		{
			jsonData = { };
		}
		
		result.data = new PerformerStatusVO();
		
		result.success = false;
		
		for ( n in Reflect.fields(jsonData) )
		{
			if ( n.length > 0 )
			{
				result.data.performerId = n;
				
				switch (Reflect.field(jsonData, n))
				{
					case "member_chat": result.data.status = PerformerStatus.MemberChat;
					case "free_chat": result.data.status = PerformerStatus.FreeChat;
					case "offline": result.data.status = PerformerStatus.Offline;
					default: result.data.status = PerformerStatus.Offline;
				}
			}
			
			break;
		}
		
		return result;
	}
}