package example.module.flickr.controller;

import example.module.flickr.model.IImageModel;
import example.module.flickr.service.flickr.fullsize.FullSizeImageServiceParams;
import example.module.flickr.service.flickr.fullsize.IFullSizeImageService;
import example.module.flickr.service.flickr.random.IRandomImageService;
import example.module.flickr.service.flickr.random.RandomImageServiceParams;
import example.module.flickr.vo.FlickrPhotoVO;
import example.module.flickr.service.HttpServiceListenerAdapter;

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
class GetFullSizedPhotoCommand extends AsyncCommand implements IInjectorContainer
{
	private var userId: String = "36587311@N08";
	private var apiKey: String = "80882b00609df75b919104b460459462"; 
	private var flickrEndpoingUrl: String = "https://api.flickr.com/services/rest/";
	
	private var httpListenerAdapter: HttpServiceListenerAdapter<HTTPServiceConfiguration>;
	
	@Inject
	public var imageModel: IImageModel;
	
	@Inject("photo")
	public var photo: FlickrPhotoVO;
	
	@Inject
	public var fullSizeImageService: IFullSizeImageService;
	
	public function new() 
	{
		super();
		
		this.httpListenerAdapter = new HttpServiceListenerAdapter<HTTPServiceConfiguration>(onFullSizeLoaded);
	}
	
	public function execute( ?requestList: StringRequest ) : Void 
	{			
		
		this.getLogger().debug("ChangeImageCommand executed");
		
		this.fullSizeImageService.getConfiguration().parameters = new FullSizeImageServiceParams(apiKey, userId, this.photo.id);
		this.fullSizeImageService.addHTTPServiceListener(this.httpListenerAdapter);
		this.fullSizeImageService.call();
	}
	
	public function onFullSizeLoaded(e:IHTTPService<HTTPServiceConfiguration>):Void 
	{
		var result = this.fullSizeImageService.getFullSizeImage();
		this.imageModel.setUrl(result.data.source);
		this.imageModel.setTitle(this.photo.title);
		
		this._handleComplete();
	}
}