package awepopunder.adapter.navigator;
import hex.event.AdapterStrategy;
import awepopunder.module.navigator.constant.TargetPage;

/**
 * ...
 * @author Chris
 */
@:rtti
class StreamClickStrategy extends AdapterStrategy
{

	public function new(target:Dynamic, method:Dynamic) 
	{
		super(this, this.onAdapt);
		
	}
	private function onAdapt( rest:Array<Dynamic> ):String
	{
		return TargetPage.CHAT_ROOM;
	}
	
}