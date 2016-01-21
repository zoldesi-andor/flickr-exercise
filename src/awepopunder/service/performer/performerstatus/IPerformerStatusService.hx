package awepopunder.service.performer.performerstatus;
import hex.service.stateful.IStatefulService;

/**
 * @author 
 */

interface IPerformerStatusService extends IStatefulService<PerformerStatusServiceConfiguration>
{
	
	function startCheckPerformer(performerId:String):Void;
	function stopCheckPerformer(performerId:String):Void;
	
	
}