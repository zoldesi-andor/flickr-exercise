package awepopunder.module.layout.model;
import awepopunder.module.layout.constant.LayoutMode;
import hex.model.ModelDispatcher;

/**
 * ...
 * @author duke
 */
class LayoutModelDispatcher extends ModelDispatcher<ILayoutModelListener> implements ILayoutModelListener
{

/* INTERFACE awepopunder.module.layout.model.ILayoutModelListener */

	public function onOnline():Void 
	{
		
	}

	public function onOffline():Void 
	{
		
	}

	public function onLayoutModeChange(state:LayoutMode):Void 
	{
		
	}

	public function onStreamRatioChange(ratio:Float):Void 
	{
		
	}
	
	
}