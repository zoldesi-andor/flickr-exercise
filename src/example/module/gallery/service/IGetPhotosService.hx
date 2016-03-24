package example.module.gallery.service;

import hex.service.ServiceConfiguration;
import hex.service.stateless.http.IHTTPService;
import hex.service.stateless.IStatelessService;
import hex.service.stateless.http.HTTPServiceConfiguration;
import example.module.gallery.vo.PhotoVO;

/**
 * @author Andrei Bunulu
 */
interface IGetPhotosService extends IHTTPService<HTTPServiceConfiguration>
{
  function getPhotos() : Array<PhotoVO>;
}