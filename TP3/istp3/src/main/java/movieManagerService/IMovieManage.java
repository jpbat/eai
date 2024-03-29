package movieManagerService;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 2.5.1
 * 2013-12-15T03:56:34.022Z
 * Generated source version: 2.5.1
 * 
 */
@WebService(targetNamespace = "http://services/", name = "IMovieManage")
@XmlSeeAlso({ObjectFactory.class})
public interface IMovieManage {

    @WebResult(name = "Data", targetNamespace = "")
    @RequestWrapper(localName = "Add", targetNamespace = "http://services/", className = "movieManagerService.Add")
    @WebMethod(operationName = "Add")
    @ResponseWrapper(localName = "AddResponse", targetNamespace = "http://services/", className = "movieManagerService.AddResponse")
    public java.lang.String add(
        @WebParam(name = "MovieXml", targetNamespace = "")
        java.lang.String movieXml
    );
}
