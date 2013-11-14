package services;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import models.Account;
import dbContext.CRUD;

/**
 * Session Bean implementation class AccountManagerService
 */
@Stateless
public class AccountManagerService extends CRUD<Account>{
	
    public AccountManagerService() {
        super(Account.class);
    }

}
