import java.io.*;

public class MyFile {
	
	public static final int R = 0, W = 1;
	
	private String fileName;
	private int fileMode;
	
	private BufferedReader fR;
	private BufferedWriter fW;
	
	public MyFile(String fileName, int fileMode) throws IOException {
		
		this.fileName = fileName;
		this.fileMode = fileMode;
		
		if (fileMode == R)
			fR = new BufferedReader(new FileReader(fileName));
		
		else if (fileMode == W)
			fW = new BufferedWriter(new FileWriter(fileName));
	}
	
	public String getNome() {
		return fileName;
	}
	
	public int getModo() {
		return fileMode;
	}
	
	public String readln() throws IOException {
		return fR.readLine();
	}
	
	public void write(Object obj) throws IOException {
		String line = obj.toString();
		fW.write(line,0,line.length());
	}
	
	public void writeln(Object obj) throws IOException {
		String line = obj.toString();
		fW.write(line,0,line.length());
		fW.newLine();
	}
	
	public void close() throws IOException {
		if (fR != null)
			fR.close();
		else if (fW != null)
			fW.close();
	}
}
