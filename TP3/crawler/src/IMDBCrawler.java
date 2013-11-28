import java.io.File;
import java.io.IOException;
import java.util.Scanner;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

public class IMDBCrawler {

	//output directory
	String path = "../output/";
	
	//Crawler and movieList
	Crawler c;
	MovieList ml;

	private Logger logger;
	
	public IMDBCrawler() throws IOException{
		this.logger = new Logger("IMDb Crawler");
		this.c = new Crawler(this.logger);
		this.ml = new MovieList();
	}

	private void generateXMLFile() {
		
		@SuppressWarnings("resource")
		Scanner sc = new Scanner(System.in);
		System.out.print("Write your file name: ");
		String name = this.path + sc.nextLine() + ".xml";
		
		try {
			JAXBContext context = JAXBContext.newInstance(MovieList.class);
		    Marshaller m = context.createMarshaller();
		    m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		    m.marshal(this.ml, new File(name));
		
		} catch (JAXBException e) {
			this.logger.log(Logger.marshall);
			return;
		}
		System.out.println("File successfully save to: " + name);
	}
	
	private void start(String selected) {
			
		this.ml = this.c.get(selected);
		
		if (this.ml == null || this.ml.movie.size() == 0) {
			System.out.println("No movies found!");
			return;
		}
		
		generateXMLFile();
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
