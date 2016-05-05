package example.module.thumbnails.model;

import hex.model.IModelListener;

/**
 * @author azoldesi
 */
interface IThumbnailListModelListener extends IModelListener
{
	function onThumbnailListChanged(thumbnail: IThumbnailModelRO): Void;
}