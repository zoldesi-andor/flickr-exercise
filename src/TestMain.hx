package ;

//import hex.config.stateful.ServiceLocator;
import hex.control.async.AsyncCommandEventTest;
import hex.HexCoreSuite;
import hex.HexInjectSuite;
import hex.HexMVCSuite;
import hex.unittest.runner.ExMachinaUnitCore;

class TestMain
{
    static public function main() : Void
    {
		var emu : ExMachinaUnitCore = new ExMachinaUnitCore();
		
		#if js
			js.Browser.document.getElementById("console").style.display = "block";
			emu.addListener( new hex.unittest.notifier.BrowserUnitTestNotifier("console") );
		#elseif flash
			emu.addListener( new hex.unittest.notifier.FlashUnitTestNotifier(flash.Lib.current) );
		#end
		
		emu.addTest( HexFullSuite );
        emu.run();
		
		
    }
	
}