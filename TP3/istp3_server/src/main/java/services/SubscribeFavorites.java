package services;

import javax.jws.WebResult;

public class SubscribeFavorites implements ISubscribeFavorites {

	public String test(String name, String email, String password) {
		
		return "Name: " + name +
				"\nEmail: " + email +
				"\nPassword: " + password;
	}

}
