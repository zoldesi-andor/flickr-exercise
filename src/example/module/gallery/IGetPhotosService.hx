package example.module.gallery;

import hex.service.ServiceConfiguration;
import hex.service.stateless.http.IHTTPService;
import hex.service.stateless.IStatelessService;
import hex.service.stateless.http.HTTPServiceConfiguration;

/**
 * @author Andrei Bunulu
 */
interface IGetPhotosService extends IHTTPService<HTTPServiceConfiguration>
{
  function getPhotos() : Array<String>;
}