package example.service.flickr;

import hex.service.ServiceConfiguration;
import hex.service.stateless.IStatelessService;

/**
 * @author Andrei Bunulu
 */
interface IFlickrGetPhotos extends IStatelessService<ServiceConfiguration>
{
  function getPhotos() : Array<String>;
}