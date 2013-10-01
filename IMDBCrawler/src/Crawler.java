import java.io.IOException;
import java.net.SocketTimeoutException;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


public class Crawler {
	
	final String base = "http://www.imdb.com";
	final String[] top250 = {base + "/chart/top", "tr a"};
	final String[] commingSoon = {base + "/movies-coming-soon", "#main td h4 a"};
	final String[] inTheaters = {base + "/movies-in-theaters", "#main td h4 a"};
	
	public File logFile;
	
	public Crawler (String logFile) throws IOException {
		this.logFile = new File(logFile, File.W);
	}

	public void log(String s) throws IOException {
		String time = new Timestamp(new java.util.Date().getTime()).toString();
		String.format("%s023", time);
		this.logFile.writeln("[" + time + "] " + s);
	}
	
	private Document getDocument(String url) {
		
		Document doc = null;
		try {
			doc = Jsoup.connect(url).userAgent("Chrome").header("Accept-Language", "en-US").get();
		} catch (SocketTimeoutException e) {
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
		return doc;
	}
	
	private Node parseMovie(String url, String name) throws IOException {
		
		this.log("starting to fetch " + name);

		String image, description, launchDate, duration, director;
		float score;
		Document doc = getDocument(url);
		ArrayList<String> types = new ArrayList<>();
		
		image = doc.select("#img_primary img").attr("src");
		description = doc.select("#titleStoryLine .canwrap p").text();
		launchDate = doc.select("#overview-top .infobar .nobr a").text();
		duration = doc.select("#overview-top .infobar time").text();
		director = doc.select("#overview-top .txt-block h4").get(0).parent().getElementsByTag("span").text();
		
		try {
			score = Float.parseFloat(doc.select("#overview-top .star-box-giga-star").text());
		} catch (NumberFormatException e) {
			score = -1;
		}
		
		for (Element e : doc.select("#overview-top .infobar a .itemprop")) {
			types.add(e.text());
		}
		
		this.log("finished fetching " + name);
		
		return new Node(name, image, score, description, launchDate, types, duration, director);
	}
	
	private ArrayList<Node> parseElements(Elements elements) throws IOException {
		ArrayList<Node> retval = new ArrayList<>();
		
		for (int i = 0; i < elements.size(); i++) {
			Element e = elements.get(i);
			System.out.println(i + 1 + "/" + elements.size() + " Done");
			
			String aux = e.attr("href");

			if (aux.indexOf("/title/") == 0) {
				retval.add(parseMovie(base + aux, e.text()));
					
			} else {
				//System.out.println("[" + aux.indexOf("/title/") + "] " + aux);
			}
		}
		
		return retval;
	}
		
	//TODO
	public ArrayList<Node> parseGenre(String genre) {
		
		ArrayList<Node> retval = new ArrayList<>();
		
		return retval;
	}
	
	public ArrayList<Node> get(String parameter) throws IOException {
		
		String url, selector;
		Document doc;
		
		switch (parameter) {
			case "Top 250":
				url = this.top250[0];
				selector = this.top250[1];
				break;
			case "Coming Soon":
				url = this.commingSoon[0];
				selector = this.commingSoon[1];
				break;
			case "In Theaters":
				url = this.inTheaters[0];
				selector = this.inTheaters[1];
				break;
			default:
				url = null;
				selector = null;
				break;
		}
		
		doc = getDocument(url);
		if (doc == null) {
			System.out.println("Unable to fecth remote website!");
			return null;
		}
		
		return parseElements(doc.select(selector));
	}
}
