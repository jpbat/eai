package models;

import java.io.Serializable;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Account implements Serializable {

	private static final long serialVersionUID = 8919965526212845650L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long ID;
	
	@Column(unique=true)
	private String Username;
	private String Password;
	
	private String Name;
	@Column(unique=true)
	private String Email;
	private String Picture;
	
	@ManyToMany(fetch = FetchType.EAGER)
	private Collection<Genre> Favorites;
	
	public Account(String Username, String Password, String Name, String Email) {
		super();
		this.Username = Username;
		this.Password = Password;
		this.Name = Name;
		this.Email = Email;
		this.Picture = this.getPicture(32);
	}

	public Account() {
		super();
	}	

	public String getPicture() {
		return Picture;
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

	public Collection<Genre> getFavorites() {
		return Favorites;
	}

	public void setFavorites(Collection<Genre> favorites) {
		Favorites = favorites;
	}		

	

}
