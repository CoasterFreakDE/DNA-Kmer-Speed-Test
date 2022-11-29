my %map = (
    A => 'C',
    C => 'G',
    G => 'T',
    T => 'A',
);

my $start = time();
print "Start

";

my @opt = split //, "ACGT";
my $len_str = 13;
my $s = $opt[0] x $len_str;
my $s_last = $opt[-1] x $len_str;
my $last_char = $opt[-1];

my $counter = 1;
while ($s ne $s_last) {
    $counter += 1;
    for my $idx (0 .. $len_str) {
        my $char = substr $s, $idx, 1;
        substr $s, $idx, 1, $map{$char};
        last if $char ne $last_char;
    }
}

my $elapsed = time() - $start;
print "Number of generated k-mers: $counter - took ", $elapsed*1000, "ms

";
print "Finish!

";