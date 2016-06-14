package example.module.thumbnails.view;

import example.module.thumbnails.message.*;
import example.module.thumbnails.model.IThumbnailListModelListener;
import example.module.thumbnails.model.IThumbnailListModelRO;
import example.module.thumbnails.model.IThumbnailModelRO;
import example.vo.image.ImageVO;
import hex.control.request.ValueRequest;
import hex.view.viewhelper.ViewHelper;



/**
 * ...
 * @author azoldesi
 */
class ThumbnailsViewHelper extends ViewHelper implements IThumbnailListModelListener
{
	var thumbnailsView: IThumbnailsView;
	
	@Inject
	var model: IThumbnailListModelRO;	
	
	public function new( view: IThumbnailsView ) 
	{
		super();
	}
	
	override function _initialize():Void 
	{
		super._initialize();
		
		this.thumbnailsView = cast this._view;
		
		this.thumbnailsView.thumbnailClickStream.then(this.onThumbnailClicked);
		
		this.model.addListener(this);
	}
	
	public function onThumbnailClicked(image: ImageVO): Void
	{
		this.getOwner().dispatchPublicMessage( ThumbnailsModulePublicMessage.THUMBNAIL_SELECTED, [new ValueRequest(image)] );
	}
	
	public function onThumbnailListChanged(thumbnail: IThumbnailModelRO): Void
	{
		this.thumbnailsView.createThumbnail(thumbnail);
	}
}