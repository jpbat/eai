package client;

import java.io.IOException;
import java.io.StringWriter;
import java.net.URL;
import java.util.Scanner;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.namespace.QName;

import movieManagerService.IMovieManage;
import movieManagerService.IMovieManageService;

public class IMDBCrawler {

	//Crawler and movieList
	Crawler c;
	MovieList ml;

	public IMDBCrawler() throws IOException{
		this.c = new Crawler();
		this.ml = new MovieList();
	}
	
	private void start(String selected) {
			
		this.ml = this.c.get(selected);
		
		if (this.ml == null || this.ml.movie.size() == 0) {
			System.out.println("No movies found!");
			return;
		}
		
		StringWriter sw = new StringWriter();
		
		try {
			JAXBContext jaxbContext = JAXBContext.newInstance(MovieList.class);
			
			Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
			jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			jaxbMarshaller.marshal(this.ml, sw);
		
		} catch (JAXBException e) {
			return;
		}
		
		callWebService(sw.toString());
	}
	
	private void callWebService(String xml) {
		QName SERVICE_NAME = new QName("http://services/", "IMovieManageService");
    	
        URL wsdlURL = IMovieManageService.WSDL_LOCATION;
              
        IMovieManageService ss = new IMovieManageService(wsdlURL, SERVICE_NAME);
        IMovieManage port = ss.getIMovieManagePort();  
        
        {
        System.out.println("Invoking add...");
        java.lang.String _add__return = port.add(xml);
        System.out.println("add.result=" + _add__return);
        }
	}
	
	private void mainMenu() {
		
		int choice;
		String selected;
		
		while (true) {
			selected = null;
			
			System.out.println("######################################");
			System.out.println("##           IMDB Crawler           ##");
			System.out.println("######################################\n");
			System.out.println("Wich list do you wish to crawl?");
			System.out.println("1. Coming Soon");
			System.out.println("2. In Theaters");
			System.out.println("3. Tops");
			System.out.println("4. Custom url");
			System.out.println("");
			System.out.println("0. Exit");
			
			@SuppressWarnings("resource")
			Scanner sc = new Scanner(System.in);
			do {
				choice = sc.nextInt();
			} while (choice > 4 || choice < 0);
			
			switch (choice) {
				case 1:
					selected = "Coming Soon";
					break;
				case 2:
					selected = "In Theaters";
					break;
				case 3:
					selected = "Tops";
					break;
				case 4:
					selected = "custom";
					break;
				case 0:
					return;
				default:
					break;
			}
			if (selected != null)
				this.start(selected);
		}
	}
	
	public static void main(String[] args) {
		
		IMDBCrawler imdb = null;
		
		try {
			imdb = new IMDBCrawler();
		} catch (IOException e) {
			imdb = null;
			System.out.println(Logger.logFileError);
		}
		
		if (imdb != null) {
			imdb.mainMenu();
		}
	}
}
