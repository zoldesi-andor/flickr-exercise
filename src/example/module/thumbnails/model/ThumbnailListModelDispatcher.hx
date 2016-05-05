package example.module.thumbnails.model;

import hex.model.ModelDispatcher;

/**
 * ...
 * @author azoldesi
 */
class ThumbnailListModelDispatcher extends ModelDispatcher<IThumbnailListModelListener>
{
	public function new()
	{
		super();
	}
	
	public function onThumbnailListChanged(thumbnail: IThumbnailModelRO): Void
	{
		// Auto Generated
	}
}