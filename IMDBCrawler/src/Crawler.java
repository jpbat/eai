import java.io.IOException;
import java.math.BigDecimal;
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
	
	public MyFile logFile;
	
	public Crawler (String logFile) throws IOException {
		this.logFile = new MyFile(logFile, MyFile.W);
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
			return doc;
		} catch (IOException e) {
			return null;
		}
	}
	
	private Movie parseMovie(String url, String name) throws IOException {
		
		this.log("starting to fetch " + name);
		Movie m = new Movie();
		m.genres = new Genres();
		m.stars = new Stars();
		m.genres.genre = new ArrayList<String>();
		m.stars.star = new ArrayList<String>();
		
		Document doc = getDocument(url);
		
		if (doc == null) {
			this.log("Unable to fetch data!");
			return null;
		}
		
		m.image = doc.select("#img_primary img").attr("src");
		m.description = doc.select("#titleStoryLine .canwrap p").text();
		m.launchDate = doc.select("#overview-top .infobar .nobr a").text();
		m.duration = doc.select("#overview-top .infobar time").text();
		m.director = doc.select("#overview-top .txt-block h4").get(0).parent().getElementsByTag("span").text();
		
		String score = doc.select("#overview-top .star-box-giga-star").text();
		if (score.length() == 0) {
			m.score = new BigDecimal(-1);
		} else {
			m.score = new BigDecimal(score);
		}
		
		
		ArrayList<String> genres = new ArrayList<>();
		for (Element e : doc.select("#overview-top .infobar a .itemprop")) {
			genres.add(e.text());
		}
		m.genres.genre.addAll(genres);
		ArrayList<String> stars = new ArrayList<>();
		try {
			for (Element e : doc.select("#overview-top .txt-block h4").get(2).parent().getElementsByTag("a")) {
				if (e.text().indexOf("See full") != -1)
					break;
				
				stars.add(e.text());
			}
		} catch (Exception e) {
			stars.add("ERROR");
		}
		
		m.stars.star.addAll(stars);
		
		this.log("finished fetching " + name);
		
		return m;
	}
	
	private MovieList parseElements(Elements elements) throws IOException {
		MovieList retval = new MovieList();
		retval.movie = new ArrayList<Movie>();
		
		for (int i = 0; i < elements.size(); i++) {
			Element e = elements.get(i);
			System.out.println(i + 1 + "/" + elements.size() + " Done");
			
			String aux = e.attr("href");

			if (aux.indexOf("/title/") == 0) {
				Movie m = parseMovie(base + aux, e.text());
				if (m != null)
					retval.movie.add(m);
					
			} else {
				//System.out.println("[" + aux.indexOf("/title/") + "] " + aux);
			}
		}
		
		return retval;
	}
	
	public MovieList get(String parameter) throws IOException {
		
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
			System.out.println("Failed");
			this.log("Unable to fecth remote website!");
			return null;
		}
		
		return parseElements(doc.select(selector));
	}
}
