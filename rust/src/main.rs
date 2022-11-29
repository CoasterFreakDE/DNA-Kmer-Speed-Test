use std::time::Instant;

fn main() {
    // get current nano time
    let start = Instant::now();

    let opt = "ACGT";
    let end = opt.chars().last().unwrap();
    let mut s = "".to_owned();
    let mut s_last = "".to_owned();
    let len_str = std::env::args().nth(1).unwrap().parse::<usize>().unwrap();

    for _ in 0..len_str {
        s += &opt.chars().nth(0).unwrap().to_string();
    }

    for _ in 0..len_str {
        s_last += &opt.chars().last().unwrap().to_string();
    }

    let s_last: Vec<char> = s_last.chars().collect();
    let mut s: Vec<char> = s.chars().collect();
    let mut counter: i128 = 1;

    while s.eq(&s_last) == false {
        counter += 1;

        // println!("kmer: {} ", s);
        for i in 0..len_str {
            let c: char = s[i];
            let new = convert(c);
            s[i] = new;
            if !c.eq(&end) {
                break;
            }
        }
    }

    let duration = start.elapsed();
    println!(
        "Nummer of generated k-mers: {} - took {}ms",
        counter,
        duration.as_millis()
    );
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
