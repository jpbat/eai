package services;

import javax.ejb.Stateful;

import models.Account;
import dbContext.CRUD;

@Stateful
public class AccountService extends CRUD<Account>{

    public AccountService() {
        // TODO Auto-generated constructor stub
    }

}
