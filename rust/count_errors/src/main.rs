use std::env;
use std::fs::File;
use std::io::{BufRead, BufReader};
use std::path::Path;
use std::process;
use walkdir::WalkDir;

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("usage: count_tree_errors <directory>");
        process::exit(1);
    }

    let root = Path::new(&args[1]);
    if !root.is_dir() {
        eprintln!("error: not a directory: {}", root.display());
        process::exit(1);
    }

    let mut total = 0;

    for entry in WalkDir::new(root) {
        let entry = match entry {
            Ok(e) => e,
            Err(_) => continue, 
        };

        let path = entry.path();

        if path.is_file() && path.extension().and_then(|s| s.to_str()) == Some("log") {
            
            if let Ok(file) = File::open(path) {
                let reader = BufReader::new(file);
                
                for line in reader.lines() {
                    if let Ok(text) = line {
                        if text.contains("ERROR") {
                            total += 1;
                        }
                    }
                }
            }
        }
    }

    println!("{} errors found", total);
}
