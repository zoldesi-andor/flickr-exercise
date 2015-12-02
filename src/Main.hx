package;

import modules.stream.player.hlsplayer.HlsPlayerModule;
import modules.stream.player.hlsplayer.view.IButtonView;
import modules.stream.player.hlsplayer.view.IVideoView;
import modules.stream.player.hlsplayer.vo.INetStreamVO;


#if js
import modules.stream.player.hlsplayer.view.VideoViewJS;
import modules.stream.player.hlsplayer.vo.NetStreamVOJS;
import modules.stream.player.hlsplayer.view.ButtonViewJS;
import js.html.VideoElement;
#elseif flash
import modules.stream.player.hlsplayer.view.VideoViewFlash;
import modules.stream.player.hlsplayer.vo.NetStreamVOFlash;
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
	#if flash
	private static var nc:NetConnection;
	#end
	private static var module:HlsPlayerModule;

	static public function main() : Void
	{
		
		
		var videoView:IVideoView;
		var buttonView:IButtonView;
		#if js
			
			videoView = new VideoViewJS(cast js.Browser.document.getElementById("video"));
			var netStream:NetStreamVOJS = new NetStreamVOJS();
			netStream.streamUrl = "http://localhost:1935/dashtest/myStream/playlist.m3u8";
			
			buttonView = new ButtonViewJS( cast js.Browser.document.getElementById("stopButton") );
			
		#elseif flash
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
			
			buttonView = new ButtonViewFlash(text);
		#end
		
		Main.module = new HlsPlayerModule(videoView, buttonView);
		
		#if js
			Main.setNetStream(netStream);
		#end
	}
	
	#if flash
	static private function onConnected(e:Event):Void 
	{
		
		var netStream:NetStreamVOFlash = new NetStreamVOFlash();
		netStream.netStream = new NetStream(nc);
		netStream.netStream.play("myStream");
		netStream.netStream.client = { };
		setNetStream( netStream );
		
	}
	#end
	
	static private function setNetStream( netStream:INetStreamVO ):Void
	{
		
		Main.module.setNetStream(netStream);
	}
	
}