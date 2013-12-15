package services;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;

@WebService
public interface IMovieStats {
	
	@WebMethod
	@WebResult(name="result")
	public String Get(@WebParam(name="option") int option);
	
}
