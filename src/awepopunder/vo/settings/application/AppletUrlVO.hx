package awepopunder.vo.settings.application;
import com.module.asset.urlprovider.vo.UrlVO;
import haxe.ds.StringMap;

/**
 * ...
 * @author 
 */
class AppletUrlVO 
{
	public static var urlList:Map<String, UrlVO> = [
		"applicationSettings" => new UrlVO("http://promo.awempire.com/live_feeds/get_settings_base.php"),
		"performerData" => new UrlVO("http://promo.awempire.com/live_feeds/get_performer_base.php"),
		"modelStatus" => new UrlVO("http://promo.awempire.com/model_status/index.php"),
		"jumpSite" => new UrlVO("http://jmp.awempire.com/")];
}