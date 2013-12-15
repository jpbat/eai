package movieManagerService;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceFeature;
import javax.xml.ws.Service;

/**
 * This class was generated by Apache CXF 2.5.1
 * 2013-12-15T03:56:34.028Z
 * Generated source version: 2.5.1
 * 
 */
@WebServiceClient(name = "IMovieManageService", 
                  wsdlLocation = "http://localhost:8081/MovieManager?wsdl",
                  targetNamespace = "http://services/") 
public class IMovieManageService extends Service {

    public final static URL WSDL_LOCATION;

    public final static QName SERVICE = new QName("http://services/", "IMovieManageService");
    public final static QName IMovieManagePort = new QName("http://services/", "IMovieManagePort");
    static {
        URL url = null;
        try {
            url = new URL("http://localhost:8081/MovieManager?wsdl");
        } catch (MalformedURLException e) {
            java.util.logging.Logger.getLogger(IMovieManageService.class.getName())
                .log(java.util.logging.Level.INFO, 
                     "Can not initialize the default wsdl from {0}", "http://localhost:8081/MovieManager?wsdl");
        }
        WSDL_LOCATION = url;
    }

    public IMovieManageService(URL wsdlLocation) {
        super(wsdlLocation, SERVICE);
    }

    public IMovieManageService(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public IMovieManageService() {
        super(WSDL_LOCATION, SERVICE);
    }
    
    //This constructor requires JAX-WS API 2.2. You will need to endorse the 2.2
    //API jar or re-run wsdl2java with "-frontend jaxws21" to generate JAX-WS 2.1
    //compliant code instead.
    public IMovieManageService(WebServiceFeature ... features) {
        super(WSDL_LOCATION, SERVICE, features);
    }

    //This constructor requires JAX-WS API 2.2. You will need to endorse the 2.2
    //API jar or re-run wsdl2java with "-frontend jaxws21" to generate JAX-WS 2.1
    //compliant code instead.
    public IMovieManageService(URL wsdlLocation, WebServiceFeature ... features) {
        super(wsdlLocation, SERVICE, features);
    }

    //This constructor requires JAX-WS API 2.2. You will need to endorse the 2.2
    //API jar or re-run wsdl2java with "-frontend jaxws21" to generate JAX-WS 2.1
    //compliant code instead.
    public IMovieManageService(URL wsdlLocation, QName serviceName, WebServiceFeature ... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     *
     * @return
     *     returns IMovieManage
     */
    @WebEndpoint(name = "IMovieManagePort")
    public IMovieManage getIMovieManagePort() {
        return super.getPort(IMovieManagePort, IMovieManage.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns IMovieManage
     */
    @WebEndpoint(name = "IMovieManagePort")
    public IMovieManage getIMovieManagePort(WebServiceFeature... features) {
        return super.getPort(IMovieManagePort, IMovieManage.class, features);
    }

}
