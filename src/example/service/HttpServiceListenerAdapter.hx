package example.service;

import hex.service.*;
import hex.service.stateless.http.*;

/**
 * ...
 * @author azoldesi
 */
class HttpServiceListenerAdapter<T:ServiceConfiguration> implements IHTTPServiceListener<T>
{
	var complete: IHTTPService<T> -> Void;
	var fail: IHTTPService<T> -> Void;
	var cancel: IHTTPService<T> -> Void;
	var timeout: IHTTPService<T> -> Void;
	
	public function new(?complete: IHTTPService<T> -> Void = null, 
				 ?fail: IHTTPService<T> -> Void = null, 
				 ?cancel: IHTTPService<T> -> Void = null, 
				 ?timeout: IHTTPService<T> -> Void = null)
	{
		this.complete = complete;
		this.fail = fail;
		this.cancel = cancel;
		this.timeout = timeout;
	}
	
	public function onServiceComplete(e:IHTTPService<T>):Void 
	{
		if (complete != null)
		{
			complete(e);
		}
	}
	
	public function onServiceFail(e:IHTTPService<T>):Void 
	{
		if (fail != null)
		{
			fail(e);
		}
	}
	
	public function onServiceCancel(e:IHTTPService<T>):Void 
	{
		if (cancel != null)
		{
			cancel(e);
		}
	}

	public function onServiceTimeout(e:IHTTPService<T>):Void 
	{
		if (timeout != null)
		{
			timeout(e);
		}
	}
}