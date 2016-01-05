package;

import com.module.chat.chatbox.ChatBoxModule;
import com.module.chat.chatbox.IChatBoxModule;
import com.module.chat.chatbox.view.ChatBoxView;
import awepopunder.module.layout.ILayoutModule;
import awepopunder.module.layout.LayoutModule;
import awepopunder.module.layout.view.ILayoutView;
import awepopunder.module.layout.view.LayoutViewJS;
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
import hex.ioc.assembler.ApplicationAssembler;
import hex.ioc.assembler.ApplicationContext;
import hex.ioc.parser.xml.XMLContextParser;
import hex.ioc.parser.xml.XMLParserCollection;
import hex.ioc.parser.xml.XMLParserUtil;
import hex.service.ServiceEvent;
import js.Browser;
import js.html.Element;
import js.html.HtmlElement;
import awepopunder.adapter.chat.ChatRoomMessageStrategy;
import com.service.net.chatwebsocket.event.ReceivedRoomMessageEvent;
import awepopunder.module.contextmock.ContextMockModule;
import hex.event.EventProxy;
import awepopunder.module.layout.view.LayoutViewJS;
import js.RegExp;
import awepopunder.adapter.bootstrap.BootstrapMacro;


#if js
import com.module.stream.player.hlsplayer.view.VideoViewJS;
import com.module.stream.player.hlsplayer.vo.HlsVO;
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
	
	private var _applicationAssembler:ApplicationAssembler;
	private var _applicationContext:ApplicationContext;
	private var _contextParser:XMLContextParser;

	static public function main() : Void
	{
		self = new Main(); 
	}
	
	public function new()
	{
		
		var source:String = XMLParserUtil.getConcatenatedConfig( ["moduleConfig", "serviceConfig", "orderConfig", "viewConfig"] );
		
		var xml : Xml = Xml.parse( source );
		
		this._applicationAssembler 	= new ApplicationAssembler();
		this._applicationContext 	= this._applicationAssembler.getApplicationContext( "applicationContext" );
		
		#if js
		this._applicationAssembler.getBuilderFactory( this._applicationContext ).getCoreFactory().register( "dom", js.Browser.document );
		#end
		
		this._build( xml );
		
		/*
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
			
			
			this.webSocketService = new ChatWebSocketService();
			this.webSocketService.createConfiguration();
			this.webSocketService.addHandler(ReceivedRoomMessageEvent.RECEIVED_ROOM_MESSAGE, this._onReceivedRoomMessage );
			this.webSocketService.addHandler(WebSocketServiceEventType.CONNECTED, this._onwebSocketConnected);
			this.webSocketService.setConfiguration( new ChatWebSocketServiceConfiguration("jasmin.com", "js-client", "192.168.0.79", 5280, "docler-ws") );
			this.webSocketService.connect();
			
			
			var chatServiceLocator:ServiceLocator = new ServiceLocator();
			chatServiceLocator.addService(IChatWebSocketService, this.webSocketService);
			
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
	
	private function _build( xml : Xml, applicationContext : ApplicationContext = null ) : Void
	{
		this._contextParser = new XMLContextParser();
		this._contextParser.setParserCollection( new XMLParserCollection() );
		this._contextParser.parse( applicationContext != null ? applicationContext : this._applicationContext, this._applicationAssembler, xml );
		
		this._applicationAssembler.buildEverything();
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