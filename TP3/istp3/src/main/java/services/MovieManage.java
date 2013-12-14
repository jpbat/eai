package services;

import javax.jws.WebParam;
import javax.jws.WebResult;

public class MovieManage implements IMovieManage {

	@Override
	@WebResult(name = "Data")
	public String Add(@WebParam(name = "MovieXml") String MovieXml) {
		return MovieXml;
	}

}
