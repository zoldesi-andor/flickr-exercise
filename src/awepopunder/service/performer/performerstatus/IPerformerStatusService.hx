package awepopunder.service.performer.performerstatus;
import hex.service.stateful.IStatefulService;

/**
 * @author 
 */

interface IPerformerStatusService extends IStatefulService
{
	
	function startCheckPerformer(performerId:String):Void;
	function stopCheckPerformer(performerId:String):Void;
	
	
}