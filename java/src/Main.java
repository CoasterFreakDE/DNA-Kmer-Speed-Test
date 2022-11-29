import java.util.Arrays;

public class Main {
	public static void main(String[] args) {
		var length = Integer.parseInt(System.getProperty("length"));
		var start = System.nanoTime();
		var base = "ACGT";
		var end = base.charAt(base.length() - 1);
		var s = "";
		for (var i = 0; i < length; i++) {
			s += base.charAt(0);
		}
		var sLast = "";
		for (var i = 0; i < length; i++) {
			sLast += end;
		}
		var ss = s.toCharArray();
		var ssLast = sLast.toCharArray();
		long counter = 1;
		while (!Arrays.equals(ss, ssLast)) {
			counter++;
			// System.out.println(new String(ss));
			for (var i = 0; i < length; i++) {
				var old = ss[i];
				ss[i] = convert(old);
				if (old != end) {
					break;
				}
			}
		}
		var delta = System.nanoTime() - start;
		System.out.printf("Number of generated k-mers: %d - took %dms\n", counter, (delta / 1000) / 1000);
	}

	public static char convert(char c) {
		return switch (c) {
			case 'A' -> 'C';
			case 'C' -> 'G';
			case 'G' -> 'T';
			case 'T' -> 'A';
			default -> ' ';
		};
	}
}
