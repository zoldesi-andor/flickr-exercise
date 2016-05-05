package example.module.mainimage.view;

import example.module.mainimage.message.MainImageModuleMessage;
import example.module.mainimage.model.IImageModelListener;
import example.module.mainimage.model.IImageModelRO;
import example.module.mainimage.view.message.MainImageViewMessage;

import hex.control.request.StringRequest;
import hex.view.viewhelper.ViewHelper;

/**
 * ...
 * @author azoldesi
 */
class MainImageViewHelper extends ViewHelper implements IImageModelListener implements IMainImageViewListener
{
	var _flickrView: IMainImageView;
	
	@Inject
	var _model: IImageModelRO;	
	
	public function new( view: IMainImageView ) 
	{
		super();
	}
	
	override function _initialize():Void 
	{
		super._initialize();
		
		this._flickrView = cast this._view;
		this._flickrView.addHandler( MainImageViewMessage.CLICK, this, this.onClick );
		
		this._model.addListener(this);
	}
	
	public function onClick(): Void 
	{
		this.dispatcher.dispatch( MainImageModuleMessage.CHANGE_IMAGE, [] );
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