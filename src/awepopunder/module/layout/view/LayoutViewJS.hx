package awepopunder.module.layout.view;
import js.html.Element;

/**
 * ...
 * @author duke
 */
class LayoutViewJS implements ILayoutView
{
	private var _layout:Element;
	
	private var _chatContainer:Element;
	private var _liveLogo:Element;

	public function new( layout:Element ) 
	{
		this._layout = layout;
		
		this._chatContainer = this._layout.getElementsByClassName("embed-chat")[0];
		this._liveLogo = this._layout.getElementsByClassName("embed-live-logo")[0];
	}
	
	public function showChat( ):Void
	{
		this._chatContainer.classList.add("chat-open");
	}
	
	public function hideChat( ):Void
	{
		this._chatContainer.classList.remove("chat-open");
	}
	
	public function showLive( ):Void
	{
		this._liveLogo.classList.remove("hidden");
	}
	
	public function hideLive( ):Void
	{
		this._liveLogo.classList.add("hidden");
	}
	
	public function setInFrameLayoutMode():Void 
	{
		this._layout.classList.remove('video-full-height');
	}
	
	public function setOutFrameLayoutMode():Void 
	{
		this._layout.classList.add('video-full-height');
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