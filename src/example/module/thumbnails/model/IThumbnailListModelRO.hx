package example.module.thumbnails.model;

import hex.model.IModelRO;

/**
 * @author azoldesi
 */
interface IThumbnailListModelRO extends IModelRO<IThumbnailListModelListener>
{
	function getThumbnails(): Array<IThumbnailModelRO>;
}