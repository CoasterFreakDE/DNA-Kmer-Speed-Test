use std::time::Instant;

fn main() {
    // get current nano time
    let start = Instant::now();

    println!("Start");

    let opt = "ACGT";
    let mut s = "".to_owned();
    let mut s_last= "".to_owned();
    let len_str = 15;

    for _ in 0..len_str {
        s += &opt.chars().nth(0).unwrap().to_string();
    }

    for _ in 0..len_str {
        s_last += &opt.chars().last().unwrap().to_string();
    }

    let mut counter = 1;

    while s.eq(&s_last) == false {
        counter += 1;

        // println!("kmer: {} ", s);
        for i in 0..len_str {
            if s.chars().nth(i).eq(&opt.chars().last()) {
                s.replace_range(i..(i + 1), convert(s.chars().nth(i).unwrap()).to_string().as_str());
            } else {
                s.replace_range(i..(i + 1), convert(s.chars().nth(i).unwrap()).to_string().as_str());
                break;
            }
        }
    }

    let duration = start.elapsed();
    println!("Nummer of generated k-mers: {} - took {}ms", counter, duration.as_millis());
    println!("End");
}

fn convert(c: char) -> char {
    return match c {
        'A' => 'C',
        'C' => 'G',
        'G' => 'T',
        'T' => 'A',
        _ => ' ',
    }
}
