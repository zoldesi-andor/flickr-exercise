package hex.control.request;

import hex.control.payload.ExecutionPayload;

/**
 * ...
 * @author ali_o_kan - Laurent Deketelaere
 */
class StringRequest extends Request
{
	public var value : String; 
	
	public function new( value : String, ?executionPayloads : Array<ExecutionPayload> ) 
	{
		super(executionPayloads);
		this.value = value;
	}
	
}