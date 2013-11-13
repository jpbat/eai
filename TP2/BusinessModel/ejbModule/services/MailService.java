package services;

import javax.ejb.LocalBean;
import javax.ejb.Singleton;
import javax.ejb.Startup;

import system.EmailDispatcher;

/**
 * Session Bean implementation class MailService
 */
@Singleton
@Startup
public class MailService {
	
	private static EmailDispatcher Dispatcher;

    public MailService() {
    	Dispatcher = new EmailDispatcher();
    }

	public static EmailDispatcher getDispatcher() {
		return Dispatcher;
	}

}
