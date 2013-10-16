import java.io.IOException;
import java.sql.Timestamp;


public class Logger {
	
	//JBoss comm
	public static String jbossConnection = "Unable to connect to JBoss! Sleeping for 5 seconds...";
	public static String jbossPublish = "Failed to publish on topic... Sleeping for 5 seconds...";
	public static String jbossClose = "Failed to close connection to jboss";
	public static String jbossFetching = "Failed to get message from jboss topic!";
	public static String jbossConnected = "Connected to jboss!";

	//Back thread
	public static String threadKilled = "Thread is being killed...";
	public static String poolSize = "Messages in queue: ";
	public static String poolClosed = " messages were lost...";
	
	//Log
	public static String failedWeb = "Unable to fetch webpage: ";
	public static String logFileError = "Unable to write to log file!";
	public static String sleep = "Thread interrupted on sleep";
	public static String flush = "Unable to flush!";

	//Web Crawler
	public static String startParse = "Starting to parse ";
	public static String finishParse = "Finished to parse ";
	public static String xsdFile = "Failed to access XSD file.";
	public static String xmlValid = "XML validated successfully";
	public static String xmlInvalid = "XML validated failed";
	public static String start = "Starting to fetch ";
	public static String finishFailed = "Failed to fetch ";
	public static String finishSuccess = "Finished to fetch ";
	public static String failedMatch = "The tag href isn't a movie! ";
	
	//Receiver Apps
	public static String successHTML = "HTML file successfuly generated!";
	public static String successXML = "XML file successfuly generated!";
	public static String failedHTML = "Failed to open HTML file!";
	public static String failedXML = "Failed to open XML file!";
	public static String marshall = "Unable to marshall";
	public static String unmarshall = "Unable to unmarshall";
	public static String listening = "Ready to receive messages...";
	public static String shutdown = "Shutting down...";
	public static String received = "Message received!";

	//File paths	
	private String logPath = "../output/log";
	
	public MyFile logFile;
	
	public Logger(String app) throws IOException {
		String timestamp = new Timestamp((new java.util.Date()).getTime()).toString();
		String name = logPath + "_" + app + "_" + timestamp + ".txt";
		this.logFile = new MyFile(name);
	}
	
	public void terminate() throws IOException {
		this.logFile.close();
	}
	
	public void log(String s) {
		String time = new Timestamp(new java.util.Date().getTime()).toString();
		while (time.length() < 23) {
			time += '0';
		}
		
		try {
			this.logFile.writeln("[" + time + "] " + s);
		} catch (IOException e) {
			System.out.println("[" + time + "] " + Logger.logFileError);
			System.out.println("[" + time + "] " + s);
			e.printStackTrace();
		}
		
		try {
			this.logFile.flush();
		} catch (IOException e) {
			this.log(Logger.flush);
		}
	}
	
}
