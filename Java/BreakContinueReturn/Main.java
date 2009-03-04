import java.io.*;

public class Main {

    public static void main(String[] args) throws IOException {
	Main main = new Main();
	// main.findStuff();
	// main.readme();
	// main.continueIsUnnecessary();
	main.namedContinue();
    }

    public void findStuff() {
	System.out.println(find(3, new int[] { 1, 2, 3, 4, 5, 6 }));
	System.out.println(find(9, new int[] { 1, 2, 3, 4, 5, 6 }));
	System.out.println(find(-9, new int[] { 1, 2, 3, 4, 5, 6 }));
    }

    public boolean find(int value, int[] values) {
	for (int i = 0; i < values.length; i++) {
	    if (value == values[i]) {
		found = true;
		break;
	    }
	}
	return false;
    }

    public void readme() throws IOException {
	BufferedReader input = new BufferedReader(new FileReader("Main.java"));
	while (true) {
	    String line = input.readLine();
	    if (line == null)
		break;
	    System.out.println(line);
	}
	input.close();
    }

    public void continueIsUnnecessary() {
	for (int i = 0; i < 100; i++) {
	    if (i % 2 == 1) continue;
	    System.out.print(i + " ");
	}
	System.out.println();
    }

    public void namedContinue() {
	outer:
	for (int i = 0; i < 10; i++) {
	    for (int j = 0; j < 10; j++) {
		if (i == j)
		    continue outer;
		System.out.println(i + " " + j);
	    }
	}
    }

}