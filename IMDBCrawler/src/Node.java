import java.util.ArrayList;


public class Node {

	private String name;
	private String image;
	private float score;
	private String description;
	private String launchDate;
	private ArrayList<String> types;
	private String duration;
	private String director;
	
	public Node(String name, String image, float score, String description, String launchDate, ArrayList<String> types, String duration, String director) {
		this.name = name;
		this.image = image;
		this.score = score;
		this.description = description;
		this.types = types;
		this.launchDate = launchDate;
		this.director = director;
		this.duration = duration;
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

	public ArrayList<String> getTypes() {
		return types;
	}

	public void setTypes(ArrayList<String> types) {
		this.types = types;
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
				"\n\ttypes=" + types +
				"\n\tdirector=" + director +
				"\n\tdescription=" + description + "\n";
	}
	
	
}
