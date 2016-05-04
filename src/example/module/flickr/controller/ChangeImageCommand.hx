package example.module.flickr.controller;

import example.module.flickr.model.IImageModel;
import example.service.flickr.fullsize.FullSizeImageServiceParams;
import example.service.flickr.fullsize.IFullSizeImageService;
import example.service.flickr.random.IRandomImageService;
import example.service.flickr.random.RandomImageServiceParams;
import example.vo.flickr.list.FlickrPhotoVO;
import example.service.HttpServiceListenerAdapter;

import hex.control.async.AsyncCommand;
import hex.service.stateless.http.IHTTPServiceListener;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.ServiceConfiguration;
import hex.service.ServiceResultVO;
import hex.service.stateless.http.HTTPServiceConfiguration;
import hex.service.stateless.http.IHTTPService;
import hex.service.stateless.http.IHTTPServiceListener;
import hex.control.command.BasicCommand;
import hex.control.request.StringRequest;
import hex.di.IInjectorContainer;

/**
 * ...
 * @author azoldesi
 */
class ChangeImageCommand extends AsyncCommand implements IInjectorContainer
{
	private var userId: String = "36587311@N08";
	private var apiKey: String = "80882b00609df75b919104b460459462"; 
	private var flickrEndpoingUrl: String = "https://api.flickr.com/services/rest/";
	
	private var title: String;
	
	@Inject
	public var imageModel: IImageModel;
	
	@Inject
	public var randomImageService: IRandomImageService;
	
	@Inject
	public var fullSizeImageService: IFullSizeImageService;
	
	public function execute( ?requestList: StringRequest ) : Void 
	{			
		
		this.getLogger().debug("ChangeImageCommand executed");
		
		this.randomImageService.getConfiguration().parameters = new RandomImageServiceParams(apiKey, userId);
		this.randomImageService.addHTTPServiceListener(this.createHttpListener(this.onPhotoListLoaded));
		this.randomImageService.call();
	}
		
	public function onPhotoListLoaded(e:IHTTPService<HTTPServiceConfiguration>):Void 
	{		
		var result:ServiceResultVO<FlickrPhotoVO> = this.randomImageService.getRandomImage();

		this.title = result.data.title;
		
		this.fullSizeImageService.getConfiguration().parameters = new FullSizeImageServiceParams(apiKey, userId, result.data.id);
		this.fullSizeImageService.addHTTPServiceListener(this.createHttpListener(this.onFullSizeLoaded));
		this.fullSizeImageService.call();
	}
	
	public function onFullSizeLoaded(e:IHTTPService<HTTPServiceConfiguration>):Void 
	{
		var result = this.fullSizeImageService.getFullSizeImage();
		this.imageModel.setUrl(result.data.source);
		this.imageModel.setTitle(this.title);
		
		this._handleComplete();
	}
	
	private function createHttpListener(
		success: IHTTPService<HTTPServiceConfiguration> -> Void, 
		?fail: IHTTPService<HTTPServiceConfiguration> -> Void = null, 
		?cancel: IHTTPService<HTTPServiceConfiguration> -> Void = null, 
		?timeout: IHTTPService<HTTPServiceConfiguration> -> Void = null): IHTTPServiceListener<HTTPServiceConfiguration>
	{
		var onComplete = function (e: IHTTPService<HTTPServiceConfiguration>): Void
		{
			var result = e.getResult();
			
			if ( result.success )
			{
				success(e);
			}
			else
			{
				this._handleFail();
			}
		};
		
		var onFail = function (e: IHTTPService<HTTPServiceConfiguration>): Void
		{
			if (fail != null)
			{
				fail(e);
			}
			
			this._handleFail();
		};
		
		var onCancel = function (e: IHTTPService<HTTPServiceConfiguration>): Void
		{
		
			if (cancel != null)
			{
				cancel(e);
			}
			
			this._handleCancel();
		};
		
		var onTimeout = function (e: IHTTPService<HTTPServiceConfiguration>): Void
		{
			if (timeout != null)
			{
				timeout(e);
			}
			
			this._handleFail();
		};
		
		return new HttpServiceListenerAdapter<HTTPServiceConfiguration>(
			onComplete, 
			onFail, 
			onCancel, 
			onTimeout);
	}
}