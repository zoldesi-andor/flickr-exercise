package;

import hex.config.stateful.ServiceLocator;
import hex.service.ServiceEvent;
import module.stream.player.hlsplayer.HlsPlayerModule;
import module.stream.player.hlsplayer.IHlsPlayerModule;
import service.stream.hls.HlsService;
import service.stream.hls.IHlsService;
import service.stream.hlsjs.HlsJsService;
//import modules.stream.player.hlsplayer.view.IButtonView;
import module.stream.player.hlsplayer.view.IVideoView;


#if js
import module.stream.player.hlsplayer.view.VideoViewJS;
import module.stream.player.hlsplayer.vo.HlsVO;
//import modules.stream.player.hlsplayer.view.ButtonViewJS;
import js.html.VideoElement;
#elseif flash
import module.stream.player.hlsplayer.view.VideoViewFlash;
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
	private static var module:Dynamic;

	static public function main() : Void
	{
		
		
		var videoView:IVideoView;
		//var buttonView:IButtonView;
		//#if js
			
			videoView = new VideoViewJS(cast js.Browser.document.getElementById("video"));
			
			
			//buttonView = new ButtonViewJS( cast js.Browser.document.getElementById("stopButton") );
			
			//var hlsService:HlsService<ServiceEvent> = new HlsService();
			var hlsService:HlsJsService<ServiceEvent> = new HlsJsService();
			hlsService.video =  cast js.Browser.document.getElementById("video");
			
			var serviceLocator:ServiceLocator = new ServiceLocator();
			serviceLocator.addService(IHlsService, hlsService);
			var hlsPlayer:IHlsPlayerModule = new HlsPlayerModule(videoView, serviceLocator);
			
			var streamVO:HlsVO = new HlsVO();
			streamVO.streamUrl = "http://192.168.206.47:1935/dashtest/myStream/playlist.m3u8";
			hlsPlayer.setStream( streamVO );
			
			hlsPlayer.play( );
			
			Main.module = hlsPlayer;
			
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
	
	static private function setStream( netStream:HlsVO ):Void
	{
		
		Main.module.setStream(netStream);
	}
	
}