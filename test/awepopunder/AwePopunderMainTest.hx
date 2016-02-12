package awepopunder;

//import hex.config.stateful.ServiceLocator;
import hex.inject.InjectorTest;
import hex.unittest.event.ITestRunnerListener;
import hex.unittest.notifier.BrowserUnitTestNotifier;
import hex.unittest.notifier.WebSocketNotifier;
import hex.unittest.notifier.WebSocketNotifierEvent;
import hex.unittest.runner.ExMachinaUnitCore;

class AwePopunderMainTest
{
	#if js
	static var notifier:ITestRunnerListener;
	#end
	static var emu:ExMachinaUnitCore;
	
    static public function main() : Void
    {
		emu = new ExMachinaUnitCore();
		emu.addTest( AwePopunderSuite );
		//emu.addTestMethod( InjectorTest, 'one_named_parameter_constructor_injection_fulfilled' );
		
		#if js
			js.Browser.document.getElementById("console").style.display = "block";
			notifier = new WebSocketNotifier( "ws://localhost:6660" );
			//notifier.addEventListener( WebSocketNotifierEvent.CONNECTED, _onConnected);
			//emu.addListener( new hex.unittest.notifier.BrowserUnitTestNotifier("console") );
			
			emu.addListener( notifier );
			notifier = new BrowserUnitTestNotifier("console");
			
			emu.addListener( notifier );
			emu.run();
		#elseif flash
			emu.addListener( new hex.unittest.notifier.FlashUnitTestNotifier(flash.Lib.current) );
			emu.run();
		#end
		
    }
	
	static function _onConnected( e:WebSocketNotifierEvent ):Void 
	{
		emu.run();
	}
	
}