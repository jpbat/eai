package movieStatsService;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 2.5.1
 * 2013-12-15T05:57:05.769Z
 * Generated source version: 2.5.1
 * 
 */
@WebService(targetNamespace = "http://services/", name = "IMovieStats")
@XmlSeeAlso({ObjectFactory.class})
public interface IMovieStats {

    @WebResult(name = "result", targetNamespace = "")
    @RequestWrapper(localName = "Get", targetNamespace = "http://services/", className = "movieStatsService.Get")
    @WebMethod(operationName = "Get")
    @ResponseWrapper(localName = "GetResponse", targetNamespace = "http://services/", className = "movieStatsService.GetResponse")
    public java.lang.String get(
        @WebParam(name = "option", targetNamespace = "")
        int option
    );
}
