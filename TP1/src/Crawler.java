import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Scanner;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

@SuppressWarnings("resource")
public class Crawler {
	
	private final String base = "http://www.imdb.com";
	private final String[] tops = {base + "/chart/", ".titleColumn a"};
	private final String[] commingSoon = {base + "/movies-coming-soon", "#main td h4 a"};
	private final String[] inTheaters = {base + "/movies-in-theaters", "#main td h4 a"};
	
	private Logger l;
	
	public Crawler (Logger l) {
		this.l = l;
	}

	private Document getDocument(String url) {
		
		Document doc = null;
		try {
			doc = Jsoup.connect(url).userAgent("Chrome").header("Accept-Language", "en-US").get();
			return doc;
		} catch (IllegalArgumentException e) {
			this.l.log(Logger.failedWeb + url);
			return null;
		} catch (MalformedURLException e1) {
			this.l.log(Logger.failedWeb + url);
			return null;
		} catch (IOException e2) {
			this.l.log(Logger.failedWeb + url);
			return null;
		}
	}
	
	private Movie parseMovie(String url, String name) {
		
		this.l.log(Logger.start + name);
		Movie m = new Movie();
		m.genres = new Genres();
		m.stars = new Stars();
		m.genres.genre = new ArrayList<String>();
		m.stars.star = new ArrayList<String>();
		
		Document doc = getDocument(url);
		
		if (doc == null) {
			this.l.log(Logger.finishFailed + name);
			return null;
		}
		
		m.name = doc.select("#overview-top h1 .itemprop").text();
		m.image = doc.select("#img_primary img").attr("src");
		m.description = doc.select("#titleStoryLine .canwrap p").text();
		m.launchDate = doc.select("#overview-top .infobar .nobr a").text();
		m.duration = doc.select("#overview-top .infobar time").text();
		m.director = doc.select("#overview-top .txt-block h4").get(0).parent().getElementsByTag("span").text();
		
		String score = doc.select("#overview-top .star-box-giga-star").text();
		if (score.length() == 0) {
			m.score = -1;
		} else {
			m.score = Float.parseFloat(score);
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
			stars.add("(not applicable)");
		}
		
		m.stars.star.addAll(stars);
		
		this.l.log(Logger.finishSuccess + name);
		
		return m;
	}
	
	private MovieList parseElements(Elements elements) {
		MovieList retval = new MovieList();
		retval.movie = new ArrayList<Movie>();
		
		for (int i = 0; i < elements.size(); i++) {
			Element e = elements.get(i);
			System.out.print("Working: " + 100 * i / elements.size() + "%\r");
			
			String aux = e.attr("href");

			if (aux.indexOf("/title/") == 0) {
				Movie m = parseMovie(base + aux, e.text());
				if (m != null)
					retval.movie.add(m);
					
			} else {
				this.l.log(Logger.failedMatch + aux);
			}
		}
		
		return retval;
	}
	
	private String commingSoon() {
		String year, month;
		Scanner sc = new Scanner(System.in);
		System.out.print("Which year? ");
		year = sc.next().trim();
		System.out.print("Which month? ");
		month = sc.next().trim();
		
		return this.commingSoon[0] + "/" + year + "-" + month;
	}
	
	private String tops() {
		String choice;
		Scanner sc = new Scanner(System.in);
		
		System.out.println("1. Top 250");
		System.out.println("2. Bottom 100");
		choice = sc.next().trim();
		
		return choice.equals("1") ? this.tops[0] + "top" : this.tops[0] + "bottom";
	}
	
	public MovieList get(String parameter) {
		
		String url, selector;
		Document doc;
		
		Scanner sc = new Scanner(System.in);
		
		if (parameter.equals("custom")) {
			System.out.print("url: ");
			url = sc.nextLine();
			System.out.print("filter: ");
			selector = sc.nextLine();
		} else if (parameter.equals("Coming Soon")) {
			url = commingSoon();
			selector = this.commingSoon[1];
		} else if (parameter.equals("Tops")) {
			url = tops();
			selector = this.tops[1];
		} else {
			switch (parameter) {
				case "In Theaters":
					url = this.inTheaters[0];
					selector = this.inTheaters[1];
					break;
				default:
					url = null;
					selector = null;
					break;
			}
		}
		this.l.log(Logger.startParse + url);
		doc = getDocument(url);
		
		if (doc == null) {
			return null;
		}
		this.l.log(Logger.finishParse + url);
		
		return parseElements(doc.select(selector));
	}
}
