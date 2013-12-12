package services;

import javax.jws.WebParam;
import javax.jws.WebResult;

public class SubscribeFavorites implements ISubscribeFavorites {

	@Override
	@WebResult(name = "Data")
	public String Add(@WebParam(name = "Email") String email,
			@WebParam(name = "Type") String Type) {
		// TODO Auto-generated method stub
		return email;
	}

	@Override
	@WebResult(name = "Data")
	public String Remove(@WebParam(name = "Email") String email) {
		// TODO Auto-generated method stub
		return email;
	}

}
