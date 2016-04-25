package example.module.hello.view;

/**
 * ...
 * @author ali_o_kan - Laurent Deketelaere
 */
class HelloViewJS implements IHelloView
{

	public function new() 
	{
		
	}
	
	public function showMessage( message : String ) : Void
	{
		js.Browser.alert( message );
	}
	
	@:isVar public var visible(get, set):Bool;
	
	function get_visible():Bool 
	{
		return visible;
	}
	
	function set_visible(value:Bool):Bool 
	{
		return visible = value;
	}
	
}