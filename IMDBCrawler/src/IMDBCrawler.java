import java.io.IOException;
import java.util.Scanner;
import java.io.File;

import java.sql.Timestamp;
import java.util.Date;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class IMDBCrawler {
	
	String logFileName = "../output/log.txt";
	String outputXML = "../output/out.xml";
	String XSLTransformer = "../output/transform.xsl";
	String HTMLPage = "../output/IMDBCrawler";
	
	Crawler c;
	MovieList ml;
	
	public IMDBCrawler() throws IOException {
		this.c = new Crawler(this.logFileName);
		this.ml = new MovieList();
	}
	
	private boolean populateClasses(MovieList m) {
		
		File out = new File (this.outputXML);
		
		try {
			JAXBContext jaxbContext = JAXBContext.newInstance(MovieList.class);
			
			Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
			jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			
			jaxbMarshaller.marshal(m, out);
		
		} catch (JAXBException e) {
			return false;
		}
		
		return true;
	}
	
	private boolean start(String selected) {

		try {
			this.ml = this.c.get(selected);
			this.c.logFile.close();
			
			if (ml == null) {
				return false;
			}
			
			boolean success = populateClasses(ml);
			
			if (success) {
				System.out.println("Success outputing to " + this.outputXML);
			} else {
				System.out.println("Operation failed");
			}
			
		} catch (IOException e) {
			return false;
		}

		this.HTMLPage += "_" + selected + ".html";

		if (this.toHTML()) {
			System.out.println("Success outputing to " + this.HTMLPage);
		} else {
			System.out.println("Operation failed");
		}
		
		return true;
	}
	
	private void sendToWorkers() {
		
	}
	
	private void mainMenu() {
		
		int choice;
		String selected = null;
		
		System.out.println("######################################");
		System.out.println("##           IMDB Crawler           ##");
		System.out.println("######################################\n");
		System.out.println("Wich website do you wish to crawl?");
		System.out.println("1. Coming Soon");
		System.out.println("2. In Theaters");
		System.out.println("3. Top 250");
		System.out.println("");
		System.out.println("0. Exit");
		
		Scanner sc = new Scanner(System.in);
		do {
			choice = sc.nextInt();
		} while (choice > 3 || choice < 0);
		
		switch (choice) {
			case 1:
				selected = "Coming Soon";
				break;
			case 2:
				selected = "In Theaters";
				break;
			case 3:
				selected = "Top 250";
				break;
			case 0:
				sc.close();
				return;
			default:
				break;
		}
		sc.close();
		
		if (this.start(selected)) {
			this.sendToWorkers();
		} else {
			System.out.println("Unable to do stuff...");
		}
	}
	
	private boolean toHTML() {
		TransformerFactory factory = TransformerFactory.newInstance();
		StreamSource xslt = new StreamSource(this.XSLTransformer);
		
		try {
			
			Transformer transformer = factory.newTransformer(xslt);
			StreamSource text = new StreamSource(this.outputXML);
			transformer.transform(text, new StreamResult(this.HTMLPage));
		
		} catch (TransformerConfigurationException e) {
			return false;
		} catch (TransformerException e) {
			return false;
		}
		return true;
	}
	
	
	public static void main(String[] args) {
		
		try {
			(new IMDBCrawler()).mainMenu();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
