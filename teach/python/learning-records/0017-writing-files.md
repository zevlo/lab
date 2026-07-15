# Writing files is solid

Completed Lesson 0016 with a correct from-memory script: argv for the output path, `open(path, "w")`, two `write` calls with explicit `\n`, and a confirmation print.

## Evidence

`exercises/write_report.py` matches the exercise spec (`sys.exit(1)` equivalent to `raise SystemExit(1)`). Re-running the same path leaves only the two written lines — overwrite behavior of `"w"` is in place.

## Implications

- User can emit interview-style report output to disk, not only print to stdout.
- Read + write + walk + argv toolkit is complete for typical file-based DevOps tasks.
- Good next topic: `if __name__ == "__main__"` script structure (interview readability and import-safe entry points).
