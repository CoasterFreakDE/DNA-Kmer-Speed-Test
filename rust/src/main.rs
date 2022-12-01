use std::time::Instant;

const KMER_LENGHT: usize = if cfg!(feature = "1kmers") {
    1
} else if cfg!(feature = "2kmers") {
    2
} else if cfg!(feature = "3kmers") {
    3
} else if cfg!(feature = "4kmers") {
    4
} else if cfg!(feature = "5kmers") {
    5
} else if cfg!(feature = "6kmers") {
    6
} else if cfg!(feature = "7kmers") {
    7
} else if cfg!(feature = "8kmers") {
    8
} else if cfg!(feature = "9kmers") {
    9
} else if cfg!(feature = "10kmers") {
    10
} else if cfg!(feature = "11kmers") {
    11
} else if cfg!(feature = "12kmers") {
    12
} else if cfg!(feature = "13kmers") {
    13
} else if cfg!(feature = "14kmers") {
    14
} else if cfg!(feature = "15kmers") {
    15
} else if cfg!(feature = "16kmers") {
    16
} else if cfg!(feature = "17kmers") {
    17
} else if cfg!(feature = "18kmers") {
    18
} else if cfg!(feature = "19kmers") {
    19
} else {
    15
};

fn main() {
    // get current nano time
    let start = Instant::now();

    let counter = new_run();

    let duration = start.elapsed();
    println!(
        "Number of generated k-mers: {} - took {}ms",
        counter,
        duration.as_millis()
    );
}

fn new_run() -> i128 {
    let mut chars = ['A'; KMER_LENGHT];
    let mut counter: i128 = 1;
    while !is_done(&chars) {
        counter += 1;
        //println!("Begin {} End {}", chars[0], chars[KMER_LENGHT - 1]);
        for i in 0..KMER_LENGHT {
            let c = chars[i];
            chars[i] = convert(c);
            if c != 'T' {
                break;
            }
        }
    }
    counter
}

fn convert(c: char) -> char {
    return match c {
        'A' => 'C',
        'C' => 'G',
        'G' => 'T',
        'T' => 'A',
        _ => ' ',
    };
}

fn is_done(chars: &[char]) -> bool {
    for &c in chars {
        if c != 'T' {
            return false;
        }
    }
    return true;
}