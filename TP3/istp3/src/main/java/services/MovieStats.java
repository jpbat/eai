package services;

import javax.jws.WebParam;
import javax.jws.WebResult;

public class MovieStats implements IMovieStats {

	@Override
	@WebResult(name = "Data")
	public String Get(@WebParam(name = "Something") String Something) {
		return Something;
	}

}
