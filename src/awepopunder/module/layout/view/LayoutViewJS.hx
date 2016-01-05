package awepopunder.module.layout.view;
import js.html.Element;

/**
 * ...
 * @author duke
 */
class LayoutViewJS implements ILayoutView
{
	private var _layout:Element;
	
	private var chatContainer:Element;

	public function new( layout:Element ) 
	{
		this._layout = layout;
		
		this.chatContainer = this._layout.getElementsByClassName("embed-chat")[0];
	}
	
	public function showChat( ):Void
	{
		this.chatContainer.classList.add("chat-open");
	}
	
	public function hideChat( ):Void
	{
		this.chatContainer.classList.remove("chat-open");
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