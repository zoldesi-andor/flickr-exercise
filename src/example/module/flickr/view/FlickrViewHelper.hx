package example.module.flickr.view;

import example.module.flickr.message.FlickrModuleMessage;
import example.module.flickr.model.IImageModelListener;
import example.module.flickr.model.IImageModelRO;
import example.module.flickr.view.message.FlickrViewMessage;

import hex.control.request.StringRequest;
import hex.view.viewhelper.ViewHelper;

/**
 * ...
 * @author azoldesi
 */
class FlickrViewHelper extends ViewHelper implements IImageModelListener implements IFlickrViewListener
{
	var _flickrView: IFlickrView;
	
	@Inject
	var _model: IImageModelRO;	
	
	public function new( view: IFlickrView ) 
	{
		super();
	}
	
	override function _initialize():Void 
	{
		super._initialize();
		
		this._flickrView = cast this._view;
		this._flickrView.addHandler( FlickrViewMessage.CLICK, this, this.onClick );
		
		this._model.addListener(this);
	}
	
	public function onClick(): Void 
	{
		this.dispatcher.dispatch( FlickrModuleMessage.CHANGE_IMAGE, [] );
	}
	
	public function onTitleChange(): Void
	{
		this._flickrView.setTitle(this._model.getTitle());
	}
	
	public function onUrlChange(): Void
	{
		this._flickrView.setUrl(this._model.getUrl());
	}
}