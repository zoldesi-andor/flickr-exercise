package hex.control.request;

import hex.control.payload.ExecutionPayload;

/**
 * ...
 * @author azoldesi
 */
class ValueRequest<T> extends Request
{
	public var value : T; 
	
	public function new( value : T, ?executionPayloads : Array<ExecutionPayload> ) 
	{
		super(executionPayloads);
		this.value = value;
	}
	
}