package services;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateful;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Root;

import models.Account;
import models.Genre;
import dbContext.CRUD;

@Stateful(mappedName = "as")
public class AccountService extends CRUD<Account>{

	@EJB
	private GenreService genreService;
	
	private Account CurrentUser = null;
	
    public AccountService() {
        super(Account.class);
    }
    
    public Account login(String username,String password){
 
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();

        CriteriaQuery<Account> q = cb.createQuery(Account.class);
        Root<Account> c = q.from(Account.class);
        q.select(c);

        Expression<String> path = c.get("Username");
        Expression<String> path2 = c.get("Password");

        q.where(cb.and(
                cb.like(path, username),
                cb.like(path2, password)));
        
        List<Account> result = entityManager.createQuery(q).getResultList();
        
        if(result.isEmpty())
        	return null;
        else{
        	CurrentUser =result.get(0);
        	return CurrentUser;
        }
    }
    
    public Account getCurrentUser() {
    	return this.CurrentUser;
    }
    
    public void logout() {
    	this.CurrentUser = null;
    }
    
	public Boolean addFavorite(ArrayList<Genre> genre) throws Exception{
		System.out.println("Current favs "+CurrentUser.getFavorites().size());
		System.out.println("Favs to add "+CurrentUser.getFavorites().size());
		if(genre.isEmpty()){
			return false;
		} else {
			CurrentUser.setFavorites(genre);
			this.update(CurrentUser);
			return true;
		}
    }
	
	public List<Account> getByName(String name, String email) throws Exception {

        CriteriaBuilder cb = entityManager.getCriteriaBuilder();

        CriteriaQuery<Account> q = cb.createQuery(Account.class);
        Root<Account> c = q.from(Account.class);
        q.select(c);

        Expression<String> username = c.get("Username");
        Expression<String> mail = c.get("Email");

        q.where(cb.or(cb.like(username, name), cb.like(mail, email)));
        
        return entityManager.createQuery(q).getResultList();
    }
}
