package services;

import javax.jws.WebParam;
import javax.jws.WebService;

@WebService
public interface ISubscribeFavorites {
	public String test(@WebParam(name="name") String name, @WebParam(name="email") String email, @WebParam(name="password") String password);
}
