package services;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {
	
	public static String getEmailHash(String email) {
		MessageDigest md;
		String hash = null;

		try {
			md = MessageDigest.getInstance("MD5");
			byte[] digest = md.digest(email.getBytes());
			BigInteger bigInt = new BigInteger(1, digest);

			hash = bigInt.toString(16);
			
			while (hash.length() < 32) {
				hash = "0" + hash;
			}
			
		} catch (NoSuchAlgorithmException e) {
		}

		return hash;
	}

}
