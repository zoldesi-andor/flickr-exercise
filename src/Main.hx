package;

import com.module.chat.chatbox.ChatBoxModule;
import com.module.chat.chatbox.IChatBoxModule;
import com.module.chat.chatbox.view.ChatBoxView;
import com.module.layout.ILayoutModule;
import com.module.layout.LayoutModule;
import com.module.layout.view.ILayoutView;
import com.module.layout.view.LayoutViewJS;
import com.module.stream.player.hlsplayer.HlsPlayerModule;
import com.module.stream.player.hlsplayer.IHlsPlayerModule;
import com.module.stream.player.hlsplayer.view.ILoadingView;
import com.module.stream.player.hlsplayer.view.IVideoView;
import com.module.stream.player.hlsplayer.view.LoadingViewJS;
import com.service.net.chatwebsocket.ChatWebSocketService;
import com.service.net.chatwebsocket.ChatWebSocketServiceConfiguration;
import com.service.net.chatwebsocket.event.ReceivedRoomMessageEvent;
import com.service.net.chatwebsocket.IChatWebSocketService;
import com.service.net.websocket.event.WebSocketServiceEventType;
import com.service.stream.hls.HlsService;
import com.service.stream.hls.IHlsService;
import com.service.stream.hlsjs.HlsJsService;
import com.vo.artifact.ArtifactVO;
import com.vo.chat.artifact.ChatArtifactVO;
import com.vo.chat.ChatMessageVO;
import hex.config.stateful.ServiceLocator;
import hex.service.ServiceEvent;
import js.Browser;
import js.html.Element;
import js.html.HtmlElement;
//import modules.stream.player.hlsplayer.view.IButtonView;


#if js
import com.module.stream.player.hlsplayer.view.VideoViewJS;
import com.module.stream.player.hlsplayer.vo.HlsVO;
//import modules.stream.player.hlsplayer.view.ButtonViewJS;
import js.html.VideoElement;
import js.html.Event;
#elseif flash
#end

/**
 * ...
 * @author duke
 */
class Main
{
	/*#if flash
	private static var nc:NetConnection;
	#end*/
	private var hlsPlayerModule:IHlsPlayerModule;
	private var chatBoxModule:IChatBoxModule;
	private var layoutModule:ILayoutModule;
	
	private var hlsService:HlsService;
	
	private static var self:Main;
	private var webSocketService:ChatWebSocketService;

	static public function main() : Void
	{
		self = new Main();
	}
	
	public function new()
	{
		var videoView:IVideoView;
		//var buttonView:IButtonView;
		//#if js
			
			videoView = new VideoViewJS(cast this.getElement("video"));
			
			
			//buttonView = new ButtonViewJS( cast this.getElement("stopButton") );
			
			if ( cast(this.getElement("video"),VideoElement).canPlayType("application/vnd.apple.mpegurl") != "" )
			{
				hlsService = new HlsService();
				hlsService.createConfiguration();
			}
			else
			{
				hlsService = new HlsJsService();
				hlsService.createConfiguration();
			}
			
			hlsService.video =  cast this.getElement("video");
			
			var loadingView:ILoadingView = new LoadingViewJS(cast this.getElement("loading"));
			
			
			var hlsPlayerServiceLocator:ServiceLocator = new ServiceLocator();
			hlsPlayerServiceLocator.addService(IHlsService, hlsService);
			var hlsPlayer:IHlsPlayerModule = new HlsPlayerModule(videoView, loadingView, hlsPlayerServiceLocator);
			
			var streamVO:HlsVO = new HlsVO();
			streamVO.streamUrl = "http://192.168.206.47:1935/dashtest/myStream/playlist.m3u8";
			hlsPlayer.setStream( streamVO );
			
			js.Browser.document.addEventListener("click", this.onClick);
			
			this.hlsPlayerModule = hlsPlayer;
			
			
			webSocketService = new ChatWebSocketService();
			webSocketService.createConfiguration();
			webSocketService.setConfiguration( new ChatWebSocketServiceConfiguration("jasmin.com", "js-client", "192.168.0.79", 5280, "docler-ws") );
			webSocketService.addHandler(ReceivedRoomMessageEvent.RECEIVED_ROOM_MESSAGE, this._onReceivedRoomMessage );
			webSocketService.addHandler(WebSocketServiceEventType.CONNECTED, this._onwebSocketConnected);
			webSocketService.connect();
			
			
			var chatServiceLocator:ServiceLocator = new ServiceLocator();
			chatServiceLocator.addService(IChatWebSocketService, webSocketService);
			
			//TODO: implement special artifacts
			var chatArtifactList:ChatArtifactVO = new ChatArtifactVO();
			chatArtifactList.artifactList = new Array<ArtifactVO>();
			
			var view:ChatBoxView = new ChatBoxView(cast this.getElement("chatBox"));
			
			this.chatBoxModule = new ChatBoxModule(chatServiceLocator, chatArtifactList, view);
			
			
			var layoutView:ILayoutView = new LayoutViewJS(this.getElement("layout"));
			this.layoutModule = new LayoutModule(layoutView);
			
			this.layoutModule.setOnline();
			
			//this.hlsPlayerModule.
			
			
		/*#elseif flash
			var video:Video = new Video();
			flash.Lib.current.stage.addChild(video);
			
			videoView = new VideoViewFlash(video);
		
			
			nc = new NetConnection();
			nc.addEventListener("netStatus", onConnected );
			nc.connect("rtmp://192.168.206.47:1935/dashtest");
			nc.client = { };
			
			var text:TextField = new TextField();
			text.text = "Stop";
			text.border = true;
			text.width = 100;
			text.height = 20;
			text.selectable = false;
			text.background = true;
			
			var sprite:Sprite = new Sprite();
			sprite.addChild(text);
			
			flash.Lib.current.stage.addChild(sprite);
			
			videoView = new VideoViewFlash(video);
			
			//buttonView = new ButtonViewFlash(text);
		#end*/
	}
	
	function _onwebSocketConnected(e:ServiceEvent):Void
	{
		this.webSocketService.subscribeRoom("hostTest", "admintest" );
	}
	
	function _onReceivedRoomMessage( e:ServiceEvent ):Void
	{
		var event:ReceivedRoomMessageEvent = cast e;
		var chatMessageVO:ChatMessageVO = new ChatMessageVO();
		chatMessageVO.message = event.message;
		chatMessageVO.userNick = event.sender;
		
		this.chatBoxModule.addNewLine( chatMessageVO );
	}
	
	private function getElement( id:String ):Element
	{
		return Browser.document.getElementById(id);
	}
	
	private function onClick(e:Event):Void 
	{
		js.Browser.document.removeEventListener("click", this.onClick);
		trace("click");
		this.hlsPlayerModule.play( );
	}
	
	/*#if flash
	static private function onConnected(e:Event):Void 
	{
		
		var netStream:HlsVOFlash = new HlsVOFlash();
		netStream.netStream = new NetStream(nc);
		netStream.netStream.play("myStream");
		netStream.netStream.client = { };
		setStream( netStream );
		
	}
	#end*/
	
	private function setStream( netStream:HlsVO ):Void
	{
		
		this.hlsPlayerModule.setStream(netStream);
	}
	
}