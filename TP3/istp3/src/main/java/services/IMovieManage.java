package services;

import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;

@WebService
public interface IMovieManage {

	@WebResult(name="Data")
	public String Add(@WebParam(name="MovieXml") String MovieXml);
	
}
