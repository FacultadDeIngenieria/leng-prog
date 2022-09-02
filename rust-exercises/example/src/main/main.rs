use std::env;
use example::oblique_shot;

fn main() {
    let args: Vec<String> = env::args().collect();
    let argc = args.len();
    if argc == 3 && args[1] == "hello" {
        println!("Hello {}!", args[2]);
    } else if argc == 4 && args[1] == "oblique_shot" {
        let (range, time) = oblique_shot(args[2].parse().unwrap(),
                                                  args[3].parse().unwrap());
        println!("Range: {:.2}m, Time: {:.2}s", range, time);
    } else {
        usage();
    }
}

// Print usage in case of errors
//
fn usage() {
    println!("Usage:");
    println!("    hello <your name>");
    println!("    oblique_shot <angle in degrees> <velocity in m/s>");
}
