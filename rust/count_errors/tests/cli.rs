use std::fs::{self, File};
use std::io::Write;
use std::process::Command;
use tempfile::tempdir;

#[test]
fn test_missing_arguments() {
    let output = Command::new("cargo")
        .args(["run", "-q"])
        .output()
        .expect("Failed to execute command");

    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(stderr.contains("usage: count_tree_errors <directory>"));
}

#[test]
fn test_missing_directory() {
    let output = Command::new("cargo")
        .args(["run", "-q", "--", "some_missing_dir_123"])
        .output()
        .expect("Failed to execute command");

    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(stderr.contains("error: not a directory"));
}

#[test]
fn test_sample_directory() {
    // 1. Create a temporary directory that will automatically delete itself
    let temp = tempdir().expect("Failed to create temp dir");
    let root = temp.path();

    // 2. Create the exact same folder structure as the bash script
    fs::create_dir_all(root.join("web")).unwrap();
    fs::create_dir_all(root.join("db")).unwrap();

    // 3. Create the dummy files and write the ERROR lines into them
    let mut app_log = File::create(root.join("app.log")).unwrap();
    writeln!(app_log, "INFO start\nERROR disk full\nINFO ok\nERROR timeout").unwrap();

    let mut access_log = File::create(root.join("web/access.log")).unwrap();
    writeln!(access_log, "INFO hit\nERROR 500").unwrap();

    let mut query_log = File::create(root.join("db/query.log")).unwrap();
    writeln!(query_log, "INFO query ok").unwrap();

    let mut notes = File::create(root.join("db/notes.txt")).unwrap();
    writeln!(notes, "not a log").unwrap();

    // 4. Run the program pointing it at our temporary directory
    let output = Command::new("cargo")
        .args(["run", "-q", "--", root.to_str().unwrap()])
        .output()
        .expect("Failed to execute command");

    // 5. Verify the output is exactly "3 errors found"
    let stdout = String::from_utf8_lossy(&output.stdout);
    assert!(stdout.contains("3 errors found"));
    
    // As soon as this function finishes, the `temp` variable goes out of scope
    // and Rust automatically deletes the temporary folder and all its contents from your hard drive!
}
