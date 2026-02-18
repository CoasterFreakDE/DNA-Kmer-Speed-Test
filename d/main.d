import std.conv : to;
import std.datetime.stopwatch : StopWatch, AutoStart;
import std.stdio : writeln;

char convert(char c) {
    final switch (c) {
        case 'A': return 'C';
        case 'C': return 'G';
        case 'G': return 'T';
        case 'T': return 'A';
    }
    return ' ';
}

void main(string[] args) {
    if (args.length < 2) {
        writeln("Usage: d_kmer <length>");
        return;
    }

    auto len = args[1].to!size_t;
    char[] s = new char[](len);
    char[] sLast = new char[](len);
    s[] = 'A';
    sLast[] = 'T';

    auto sw = StopWatch(AutoStart.yes);
    long counter = 1;

    while (s != sLast) {
        counter++;
        for (size_t i = 0; i < len; i++) {
            auto old = s[i];
            s[i] = convert(old);
            if (old != 'T') {
                break;
            }
        }
    }

    sw.stop();
    auto deltaMs = sw.peek.total!"msecs";
    writeln("Number of generated k-mers: ", counter, " - took ", deltaMs, "ms");
}
