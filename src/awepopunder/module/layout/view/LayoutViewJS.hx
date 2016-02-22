package awepopunder.module.layout.view;

import awepopunder.module.layout.constant.LayoutMode;
import hex.core.IAnnotationParsable;
import js.Browser;
import js.html.DOMRect;
import js.html.DivElement;
import js.html.Element;
import js.html.Event;

/**
 * ...
 * @author duke
 */
@rtti
class LayoutViewJS implements ILayoutView implements IAnnotationParsable
{
	@language('input_text')
	var _inputText : String;
	
	var _layout:DivElement;
	
	var _chatContainer:Element;
	var _liveLogo:Element;
	var _offlineLabel:Element;
	var _video:Element;
	var _joinChatLabel:Element;
	var _wrapper:Element;
	var _blackBacground:Element;

	var _inverseFrameHandling:Bool = false;
	var _layoutMode:LayoutMode;
	var _ratio:Float;

	public function new( layout:DivElement ) 
	{
		this._layout = layout;
		
		this._chatContainer = this._layout.getElementsByClassName("embed-chat")[0];
		this._liveLogo = this._layout.getElementsByClassName("embed-live-logo")[0];
		this._offlineLabel = this._layout.getElementsByClassName("embed-status")[0];
		this._video = this._layout.getElementsByClassName("embed-video")[0];
		this._joinChatLabel = this._layout.querySelector(".embed-chat-join");
		
		Browser.window.addEventListener( "resize", this._onWindowResize );
		
		this._onWindowResize(null);
	}

	function _onWindowResize(e:Event):Void 
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
		this._layoutMode = layoutMode;
		
		if ( layoutMode == LayoutMode.OutFrame )
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
		this._layout.classList.add("end-broadcast");
	}
	
	public function hideOffline( ):Void
	{
		this._offlineLabel.classList.add("hidden");
		this._layout.classList.remove("end-broadcast");
	}
	
	public function setStreamRatio(ratio:Float):Void 
	{
		this._ratio = ratio;
		this._onWindowResize(null);
	}
	
	public function onTranslate():Void 
	{
		this._joinChatLabel.textContent = this._inputText;
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