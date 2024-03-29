
package subscribeFavoritesService;

/**
 * Please modify this class to meet your needs
 * This class is not complete
 */

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Scanner;

import javax.xml.namespace.QName;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 2.5.1
 * 2013-12-15T04:23:21.863Z
 * Generated source version: 2.5.1
 * 
 */
public final class ISubscribeFavorites_ISubscribeFavoritesPort_Client {

    private static final QName SERVICE_NAME = new QName("http://services/", "ISubscribeFavoritesService");

    private ISubscribeFavorites_ISubscribeFavoritesPort_Client() {
    }

    public static void main(String args[]) throws java.lang.Exception {
        
        String email = "";
        String type = "";
        String msgreturn = "";
    	URL wsdlURL = ISubscribeFavoritesService.WSDL_LOCATION;
      
        ISubscribeFavoritesService ss = new ISubscribeFavoritesService(wsdlURL, SERVICE_NAME);
        ISubscribeFavorites port = ss.getISubscribeFavoritesPort();  
        
        Scanner sc = new Scanner(System.in);
        String op;
        do {
            System.out.println("1. Subscribe");
            System.out.println("2. Unsubscribe");
            op = sc.nextLine();
        } while (!(op.equals("1") || op.equals("2")));
        
        if(op.equals("1"))
        {
	        System.out.print("email: ");
	        email = sc.nextLine();
	        do {
		        System.out.println("1.digest\n2.non-digest");
		        type = sc.nextLine();
	        } while (!(type.equals("1") || type.equals("2")));
	        
	        if (type.equals("1")) {
	        	type = " digest";
	        } else {
	        	type = " non-digest";
	        }
	        
	        System.out.println("Invoking add...");
	        msgreturn = port.add(email, type);
	        System.out.println("add.result=" + msgreturn);
        }
        else
        {
        	System.out.print("email: ");
        	email = sc.nextLine();
        
	        System.out.println("Invoking remove...");
	        msgreturn = port.remove(email);
	        System.out.println("remove.result=" + msgreturn);
        }

        System.exit(0);
    }

}
