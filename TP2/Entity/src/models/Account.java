package models;

import java.io.Serializable;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
public class Account implements Serializable {

	private static final long serialVersionUID = 8919965526212845650L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long ID;
	
	private String Username;
	private String Password;
	
	private String Name;
	private String Email;
	private String BigPicture;
	private String SmallPicture;
	
	@ManyToMany
	private Collection<Genre> Favorites;
	
	public Account(String Username, String Password, String Name, String Email) {
		this.Username = Username;
		this.Password = Password;
		this.Name = Name;
		this.Email = Email;
		this.BigPicture = this.getPicture(150);
		this.SmallPicture = this.getPicture(32);
	}

	public String getBigPicture() {
		return BigPicture;
	}

	public String getSmallPicture() {
		return SmallPicture;
	}

	public long getID() {
		return ID;
	}

	public String getUsername() {
		return Username;
	}

	public String getPassword() {
		return Password;
	}

	public String getName() {
		return Name;
	}

	public String getEmail() {
		return Email;
	}

	private String getPicture(int size) {
		String hash = getEmailHash();
		
		if (hash == null) {
			hash = "null";
		}

		return "http://gravatar.com/avatar/" + hash + "?s=" + size;
	}

	private String getEmailHash() {
		MessageDigest md;
		String hash = null;

		try {
			md = MessageDigest.getInstance("MD5");
			byte[] digest = md.digest(this.Email.getBytes());
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
