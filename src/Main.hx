package;

import hex.config.stateful.ServiceLocator;
import hex.service.ServiceEvent;
import com.module.stream.player.hlsplayer.HlsPlayerModule;
import com.module.stream.player.hlsplayer.IHlsPlayerModule;
import com.service.net.chatwebsocket.ChatWebSocketService;
import com.service.net.chatwebsocket.ChatWebSocketServiceConfiguration;
import com.service.net.websocket.WebSocketServiceConfiguration;
import com.service.net.websocket.WebSocketServiceJS;
import com.service.stream.hls.HlsService;
import com.service.stream.hls.IHlsService;
import com.service.stream.hlsjs.HlsJsService;
//import modules.stream.player.hlsplayer.view.IButtonView;
import com.module.stream.player.hlsplayer.view.IVideoView;


#if js
import com.module.stream.player.hlsplayer.view.VideoViewJS;
import com.module.stream.player.hlsplayer.vo.HlsVO;
//import modules.stream.player.hlsplayer.view.ButtonViewJS;
import js.html.VideoElement;
import js.html.Event;
#elseif flash
import com.module.stream.player.hlsplayer.view.VideoViewFlash;
import module.stream.player.hlsplayer.vo.HlsVOFlash;
import modules.stream.player.hlsplayer.view.ButtonViewFlash;
import flash.media.Video;
import flash.net.NetConnection;
import flash.net.NetStream;
import flash.events.Event;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
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
	private var module:Dynamic;
	private var hlsService:HlsService;
	
	private static var self:Main;

	static public function main() : Void
	{
		self = new Main();
	}
	
	public function new()
	{
		var videoView:IVideoView;
		//var buttonView:IButtonView;
		//#if js
			
			videoView = new VideoViewJS(cast js.Browser.document.getElementById("video"));
			
			
			//buttonView = new ButtonViewJS( cast js.Browser.document.getElementById("stopButton") );
			
			if ( cast(js.Browser.document.getElementById("video"),VideoElement).canPlayType("application/vnd.apple.mpegurl") != "" )
			{
				hlsService = new HlsService();
			}
			else
			{
				hlsService = new HlsJsService();
			}
			
			hlsService.video =  cast js.Browser.document.getElementById("video");
			
			
			var serviceLocator:ServiceLocator = new ServiceLocator();
			serviceLocator.addService(IHlsService, hlsService);
			var hlsPlayer:IHlsPlayerModule = new HlsPlayerModule(videoView, serviceLocator);
			
			var streamVO:HlsVO = new HlsVO();
			streamVO.streamUrl = "http://192.168.206.47:1935/dashtest/myStream/playlist.m3u8";
			hlsPlayer.setStream( streamVO );
			
			js.Browser.document.addEventListener("click", this.onClick);
			
			this.module = hlsPlayer;
			
			
			var webSocketService:ChatWebSocketService = new ChatWebSocketService();
			webSocketService.setConfiguration( new ChatWebSocketServiceConfiguration("jasmin.com", "js-client", "192.168.0.79", 5280, "docler-ws") );
			webSocketService.connect();
			
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
	
	private function onClick(e:Event):Void 
	{
		js.Browser.document.removeEventListener("click", this.onClick);
		trace("click");
		this.module.play( );
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
		
		this.module.setStream(netStream);
	}
	
}