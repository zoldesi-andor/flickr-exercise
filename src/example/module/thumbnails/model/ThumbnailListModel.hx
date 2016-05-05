package example.module.thumbnails.model;
import example.vo.image.ImageVO;

/**
 * ...
 * @author azoldesi
 */
class ThumbnailListModel implements IThumbnailListModel
{
	var dispatcher: ThumbnailListModelDispatcher;
	
	var thumbnails: Array<ThumbnailModel>;

	public function new() 
	{
		this.dispatcher = new ThumbnailListModelDispatcher();
		this.thumbnails = [];
	}
	
	public function createThumbnail(image: ImageVO): Void
	{
		if (image == null)
		{
			return;
		}
		
		var thumbnail = new ThumbnailModel(image);
		this.thumbnails.push(thumbnail);
		this.dispatcher.onThumbnailListChanged(thumbnail);
	}
	
	public	function getThumbnails(): Array<IThumbnailModelRO>
	{
		return cast this.thumbnails;
	}
	
	public function addListener( listener:IThumbnailListModelListener ) : Void 
	{
		this.dispatcher.addListener( listener );
	}
	
	public function removeListener( listener:IThumbnailListModelListener ) : Void 
	{
		this.dispatcher.removeListener( listener );
	}
}