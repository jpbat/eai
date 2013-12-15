package services;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;

@WebService
public interface ISubscribeFavorites {

	@WebMethod
	@WebResult(name="Data")
	public String Add(@WebParam(name="Email") String email, @WebParam(name="Type") String Type);
	
	@WebMethod
	@WebResult(name="Data")
	public String Remove(@WebParam(name="Email") String email);
}
