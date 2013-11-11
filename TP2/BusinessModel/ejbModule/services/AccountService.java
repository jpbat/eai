package services;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateful;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Root;

import models.Account;
import models.Actor;
import dbContext.CRUD;

@Stateful(mappedName = "as")
public class AccountService extends CRUD<Account>{

	private Account CurrentUser = null;
	
    public AccountService() {
        super();
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
    
    public Account getCurrentUser(){
    	return this.CurrentUser;
    }
}
