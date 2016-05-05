package example.module.thumbnails.view;

import example.module.thumbnails.message.ThumbnailsModulePublicMessage;
import hex.control.request.StringRequest;

import example.module.thumbnails.model.IThumbnailListModelListener;
import example.module.thumbnails.model.IThumbnailListModelRO;
import example.module.thumbnails.model.IThumbnailModelRO;
import example.module.thumbnails.view.message.ThumbnailViewMessage;

import hex.view.viewhelper.ViewHelper;

/**
 * ...
 * @author azoldesi
 */
class ThumbnailsViewHelper extends ViewHelper implements IThumbnailListModelListener implements IThumbnailsViewListener
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
		
		this.thumbnailsView.addHandler( ThumbnailViewMessage.THUMBNAIL_CLICKED, this, this.onThumbnailClicked );	
		
		this.model.addListener(this);
	}
	
	public function onThumbnailClicked(request: StringRequest): Void
	{
		this.getOwner().getLogger().debug("thumbnail clicked");
		
		this.getOwner().dispatchPublicMessage( ThumbnailsModulePublicMessage.THUMBNAIL_SELECTED, [request] );
	}
	
	public function onThumbnailListChanged(thumbnail: IThumbnailModelRO): Void
	{
		this.thumbnailsView.createThumbnail(thumbnail);
	}
}