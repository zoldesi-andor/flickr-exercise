package mobilememberclient.view.layout;

import mobilememberclient.module.layout.view.ILayoutView;
import mobilememberclient.view.stream.StreamView;
import mobilememberclient.view.startprivate.StartPrivateView;
import mobilememberclient.view.chat.chatinput.ChatInputView;
import mobilememberclient.view.chat.chatbox.ChatBoxView;

using riot.RiotTools;

@:tagName('layout')
@:templateFile('mobilememberclient/view/layout/layout.html')
@:keep
class LayoutView implements riot.IRiotComponent implements ILayoutView {
	public var view:Dynamic;

	function mount() {
		
	}

	public function new(v,opts) {
		bind_view(v);
		view.on('mount', mount);
	}

	public function setLayoutMode(layoutMode:String):Void	{
		this.view.i = layoutMode;
	}

	@:isVar public var visible(get, set):Bool;

	function get_visible():Bool	{
		return visible;
	}

	function set_visible(value:Bool):Bool	{
		return visible = value;
	}
}
