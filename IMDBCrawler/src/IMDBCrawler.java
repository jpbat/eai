import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;
import java.io.File;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

public class IMDBCrawler {
	
	static String logFileName = "output/log.txt";
	static String outputXML = "output/out.xml";

	@SuppressWarnings("unused")
	private static boolean toXML(ArrayList<Node> colection) {
		try{
			MyFile f = new MyFile(outputXML, MyFile.W);
			
			f.writeln("<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + "\n<movie_list timestamp=\"1308046204104\" timezone=\"GMT\" version=\"1.1\">");

			for (Node n : colection) {
				if (n != null) {
					f.writeln(n.toXML());
				}		
			}
			f.writeln("</movie_list>");
			f.close();
		}catch (IOException e) {
			return false;
		}
		
		return true;
	}
	
	private static boolean populateClasses(MovieList m) {
		
		File out = new File (outputXML);
		
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
	
	static void start(String selected) {

		Crawler c = null;
		MovieList ml = new MovieList();

		try {
			c = new Crawler(logFileName);
			ml = c.get(selected);
			c.logFile.close();
			
			if (ml == null) {
				return;
			}
			
			boolean success = populateClasses(ml);
			
			if (success) {
				System.out.println("Success outputing to out.xml");
			} else {
				System.out.println("Operation failed");
			}
			
		} catch (IOException e) {
			System.out.println("ERROR");
		}
	}
	
	public static void main(String[] args) {
		
		int choice;
		String selected = null;
		
		System.out.println("Wich website do you wish to crawl?");
		System.out.println("1. Coming Soon");
		System.out.println("2. In Theaters");
		System.out.println("3. Top 250");
		
		Scanner sc = new Scanner(System.in);
		do {
			choice = sc.nextInt();
		} while (choice > 3 || choice < 1);
		
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
		}
		
		start(selected);
		sc.close();
	}
}
