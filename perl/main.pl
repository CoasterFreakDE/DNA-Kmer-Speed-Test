use strict;
use warnings;

sub convert {
    my $c = shift;
    if ($c eq 'A') {
        return 'C';
    }
    if ($c eq 'C') {
        return 'G';
    }
    if ($c eq 'G') {
        return 'T';
    }
    if ($c eq 'T') {
        return 'A';
    }
}

my $start = time();
print "Start

";

my $opt = "ACGT";
my $s = "";
my $s_last = "";
my $len_str = 13;

for (my $i = 0; $i < $len_str; $i++) {
    $s .= substr($opt, 0, 1);
}

for (my $i = 0; $i < $len_str; $i++) {
    $s_last .= substr($opt, -1, 1);
}

my $pos = 0;
my $counter = 1;
while ($s ne $s_last) {
    $counter += 1;
    for (my $i = 0; $i < $len_str; $i++) {
        if (substr($s, $i, 1) eq substr($opt, -1, 1)) {
            $s = substr($s, 0, $i).convert(substr($s, $i, 1)).substr($s, $i + 1);
        }
        else {
            $s = substr($s, 0, $i).convert(substr($s, $i, 1)).substr($s, $i + 1);
            last;
        }
    }
}

my $elapsed = time() - $start;
print "Number of generated k-mers: $counter - took ", $elapsed*1000, "ms

";
print "Finish!

";