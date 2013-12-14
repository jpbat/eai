package services;

import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;

@WebService
public interface IMovieStats {
	
	@WebResult(name="Data")
	public String Get(@WebParam(name="Something") String Something);
	
}
