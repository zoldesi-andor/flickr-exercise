package awepopunder.module.layout.view;
import awepopunder.module.layout.constant.LayoutMode;
import js.Browser;
import js.html.DivElement;
import js.html.DOMRect;
import js.html.Element;
import js.html.Event;

/**
 * ...
 * @author duke
 */
class LayoutViewJS implements ILayoutView
{
	private var _layout:DivElement;
	
	private var _chatContainer:Element;
	private var _liveLogo:Element;
	private var _offlineLabel:Element;
	private var _video:Element;
	
	private var _inverseFrameHandling:Bool = false;
	private var _layoutMode:LayoutMode;
	private var _ratio:Float;

	public function new( layout:DivElement ) 
	{
		this._layout = layout;
		
		this._chatContainer = this._layout.getElementsByClassName("embed-chat")[0];
		this._liveLogo = this._layout.getElementsByClassName("embed-live-logo")[0];
		this._offlineLabel = this._layout.getElementsByClassName("embed-status")[0];
		this._video = this._layout.getElementsByClassName("embed-video")[0];
		
		Browser.window.addEventListener( "resize", this._onWindowResize );
		
		this._onWindowResize(null);
	}
	
	private function _onWindowResize(e:Event):Void 
	{
		var rect:DOMRect = this._layout.getBoundingClientRect();
		
		var inverseFrameHandling:Bool;
		
		if ( rect.width / rect.height > this._ratio  )
		{
			inverseFrameHandling = true;
		}
		else
		{
			inverseFrameHandling = false;
		}
		
		if ( this._inverseFrameHandling != inverseFrameHandling )
		{
			this._inverseFrameHandling = inverseFrameHandling;
			this.setLayoutMode( this._layoutMode );
		}
	}
	
	public function setLayoutMode( layoutMode:LayoutMode ):Void 
	{
		this._layoutMode = InFrame;
		
		if ( layoutMode == InFrame )
		{
			if ( this._inverseFrameHandling )
			{
				this._layout.classList.add('video-full-height');
			}
			else
			{
				this._layout.classList.remove('video-full-height');
			}
		}
		else
		{
			if ( this._inverseFrameHandling )
			{
				this._layout.classList.remove('video-full-height');
			}
			else
			{
				this._layout.classList.add('video-full-height');
			}
		}
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
	
	public function showOffline( ):Void
	{
		this._offlineLabel.classList.remove("hidden");
	}
	
	public function hideOffline( ):Void
	{
		this._offlineLabel.classList.add("hidden");
	}
	
	
	public function setStreamRatio(ratio:Float):Void 
	{
		this._ratio = ratio;
		this._onWindowResize(null);
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