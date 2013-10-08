import java.util.ArrayList;

public class Node {

	private String name;
	private String image;
	private float score;
	private String description;
	private String launchDate;
	private ArrayList<String> genre;
	private String duration;
	private String director;
	private ArrayList<String> stars;

	public Node(String name, String image, float score, String description, String launchDate, ArrayList<String> genre, String duration, String director, ArrayList<String> stars) {
		this.name = name;
		this.image = image;
		this.score = score;
		this.description = description;
		this.genre = genre;
		this.launchDate = launchDate;
		this.director = director;
		this.duration = duration;
		this.stars = stars;
	}
	
	public ArrayList<String> getStars() {
		return stars;
	}

	public void setStars(ArrayList<String> stars) {
		this.stars = stars;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLaunchDate() {
		return launchDate;
	}

	public void setLaunchDate(String launchDate) {
		this.launchDate = launchDate;
	}

	public ArrayList<String> getGenre() {
		return genre;
	}

	public void setGenre(ArrayList<String> genre) {
		this.genre = genre;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	@Override
	public String toString() {
		return name +
				"\n\timage=" + image +
				"\n\tscore=" + score +
				"\n\tduration=" + duration +
				"\n\tlaunchDate=" + launchDate +
				"\n\tgenre=" + genre +
				"\n\tdirector=" + director +
				"\n\tstars=" + stars +
				"\n\tdescription=" + description + "\n";
	}
	
	public String toXML() {
		String retval = "\t<movie>" +  
				"\n\t\t<name>" + name + "</name>" + 
				"\n\t\t<image>" + image + "</image>" + 
				"\n\t\t<score>" + score + "</score>" +
				"\n\t\t<duration>" + duration + "</duration>" +
				"\n\t\t<launchDate>" + launchDate + "</launchDate>" +
				"\n\t\t<genres>"; 
				for (int i = 0; i < genre.size(); i++) {
					retval += "\n\t\t\t<genre>" + genre.get(i) + "</genre>";
				}
				retval += "\n\t\t</genres>" +
				"\n\t\t<director>" + director + "</director>" +
				"\n\t\t<stars>";
				for (int i = 0; i < stars.size(); i++) {
					retval += "\n\t\t\t<star>" + stars.get(i) + "</star>";
				}
				retval += "\n\t\t</stars>" + 
				"\n\t\t<description>" + description +  "</description>\n" +
				"\t</movie>";
						
		return retval;
	}
}
