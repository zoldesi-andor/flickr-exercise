package example.module.flickr.controller;

import example.module.flickr.model.IImageModel;
import example.module.flickr.service.flickr.fullsize.FullSizeImageServiceParams;
import example.module.flickr.service.flickr.fullsize.IFullSizeImageService;
import example.module.flickr.service.flickr.random.IRandomImageService;
import example.module.flickr.service.flickr.random.RandomImageServiceParams;
import example.module.flickr.vo.FlickrPhotoVO;
import example.module.flickr.service.HttpServiceListenerAdapter;
import hex.control.payload.ExecutionPayload;

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
class GetRandomPhotosCommand extends AsyncCommand implements IInjectorContainer
{
	private var userId: String = "36587311@N08";
	private var apiKey: String = "80882b00609df75b919104b460459462"; 
	
	private var httpListenerAdapter: HttpServiceListenerAdapter<HTTPServiceConfiguration>;
	
	private var result: ServiceResultVO<FlickrPhotoVO>;
	
	@Inject
	public var randomImageService: IRandomImageService;
	
	public function new()
	{
		super();
		
		this.httpListenerAdapter = new HttpServiceListenerAdapter<HTTPServiceConfiguration>(this.onComplete);
	}
	
	public function execute( ?requestList: StringRequest ) : Void 
	{			
		
		this.getLogger().debug("GetPhotosCommand executed");
		
		this.randomImageService.getConfiguration().parameters = new RandomImageServiceParams(apiKey, userId);
		this.randomImageService.addHTTPServiceListener(this.httpListenerAdapter);
		this.randomImageService.call();
	}
	
	override function getResult(): Array<FlickrPhotoVO>
	{
		return [this.result.data];
	}
	
	override function getReturnedExecutionPayload(): Array<ExecutionPayload>
	{
		return [ new ExecutionPayload(this.result.data, FlickrPhotoVO, "photo")];
	}
	
	private function onComplete(e: IHTTPService<HTTPServiceConfiguration>): Void
	{
		this.result = this.randomImageService.getRandomImage();
		this._handleComplete();
	}
}