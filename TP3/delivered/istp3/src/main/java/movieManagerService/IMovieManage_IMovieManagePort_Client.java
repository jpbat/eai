
package movieManagerService;

/**
 * Please modify this class to meet your needs
 * This class is not complete
 */

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
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
 * 2013-12-15T03:56:34.011Z
 * Generated source version: 2.5.1
 * 
 */
public final class IMovieManage_IMovieManagePort_Client {

    private static final QName SERVICE_NAME = new QName("http://services/", "IMovieManageService");

    private IMovieManage_IMovieManagePort_Client() {
    }

    public static void main(String args[]) throws java.lang.Exception {
    	
    	QName SERVICE_NAME = new QName("http://services/", "IMovieManageService");
    	
        URL wsdlURL = IMovieManageService.WSDL_LOCATION;
        if (args.length > 0 && args[0] != null && !"".equals(args[0])) { 
            File wsdlFile = new File(args[0]);
            try {
                if (wsdlFile.exists()) {
                    wsdlURL = wsdlFile.toURI().toURL();
                } else {
                    wsdlURL = new URL(args[0]);
                }
            } catch (MalformedURLException e) {
                e.printStackTrace();
            }
        }
      
        IMovieManageService ss = new IMovieManageService(wsdlURL, SERVICE_NAME);
        IMovieManage port = ss.getIMovieManagePort();  
        
        {
        System.out.println("Invoking add...");
        java.lang.String _add_movieXml = "";
        java.lang.String _add__return = port.add(_add_movieXml);
        System.out.println("add.result=" + _add__return);


        }

        System.exit(0);
    }

}
