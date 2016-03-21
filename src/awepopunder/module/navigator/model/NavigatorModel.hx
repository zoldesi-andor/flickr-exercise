package awepopunder.module.navigator.model;
import awepopunder.module.navigator.vo.NavigatorSettingsVO;

/**
 * ...
 * @author Chris
 */
class NavigatorModel implements INavigatorModel
{
	var _navigatorSettings:NavigatorSettingsVO;
	var _currentPerformerId:String;

	public function new() 
	{
		
	}
	
	public function setNavigatorSettings(value:NavigatorSettingsVO):Void 
	{
		this._navigatorSettings = value;
	}
	
	public function getNavigatorSettings():NavigatorSettingsVO 
	{
		return this._navigatorSettings;
	}
	
	public function setCurrentPerformerId(value:String):Void 
	{
		this._currentPerformerId = value;
	}
	
	public function getCurrentPerformerId():String 
	{
		return this._currentPerformerId;
	}
	
}