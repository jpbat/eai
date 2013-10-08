import java.io.IOException;
import java.util.ArrayList;
import java.io.File;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

public class IMDBCrawler {
	
	static String logFileName = "log.txt";
	static String outputXML = "out.xml";

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
		
		File out = new File ("out.xml");
		
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
	
	public static void main(String[] args) {
		
		Crawler c = null;
		MovieList ml = new MovieList();

		try {
			c = new Crawler(logFileName);
			ml = c.get("Top 250");
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
}
