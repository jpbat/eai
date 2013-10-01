import java.io.IOException;
import java.util.ArrayList;


public class Boss {
	
	static String logFileName = "log.txt";

	public static void main(String[] args) {
		
		Crawler c = null;
		ArrayList<Node> colection = new ArrayList<>();
		
		try {
			File results = new File("results.txt", File.W);
			c = new Crawler(logFileName);
			colection = c.get("Coming Soon");
			c.logFile.close();
			
			if (colection == null) {
				return;
			}
			
			for (Node n : colection) {
				results.writeln(n.toString());
			}
			results.close();
		} catch (IOException e) {
			System.out.println("ERROR");
		}
	}
}
