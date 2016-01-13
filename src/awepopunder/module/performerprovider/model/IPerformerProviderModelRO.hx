package awepopunder.module.performerprovider.model;
import awepopunder.vo.performer.PerformerDataVO;
import awepopunder.vo.settings.application.FilterSettingsVO;
/**
 * @author 
 */

interface IPerformerProviderModelRO 
{
	
	function getPerformerData():PerformerDataVO;
	
	function getFilterSettings():FilterSettingsVO;
	
	function getSite():String;
	
}