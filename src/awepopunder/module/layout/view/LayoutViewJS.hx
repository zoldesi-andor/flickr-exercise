package awepopunder.module.layout.view;
import js.html.Element;

/**
 * ...
 * @author duke
 */
class LayoutViewJS implements ILayoutView
{
	private var _layout:Element;

	public function new( layout:Element ) 
	{
		this._layout = layout;
	}
	
	public function showChat( ):Void
	{
		this._layout.classList.add("chat-open");
	}
	
	public function hideChat( ):Void
	{
		this._layout.classList.remove("chat-open");
	}
	
	@:isVar public var visible(get, set):Bool;
	
	function get_visible():Bool 
	{
		return visible;
	}
	
	function set_visible(value:Bool):Bool 
	{
		trace("AAA", value);
		return visible = value;
	}
	
}