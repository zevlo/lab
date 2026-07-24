# Python for DevOps Resources

## Knowledge

- [Official Python Tutorial](https://docs.python.org/3/tutorial/)
  The primary source for the language itself. Use for: authoritative answers on syntax, data types, and the standard library.
- [Automate the Boring Stuff with Python — Al Sweigart (free online)](https://automatetheboringstuff.com/)
  Beginner book aimed exactly at scripting/automation people, not software engineers. Use for: gentle first exposure to each concept before drilling it.
- [Real Python: DevOps With Python learning path](https://realpython.com/learning-paths/python-devops/)
  Curated path covering running/packaging scripts, pip, CI/CD, and boto3. Use for: the DevOps-specific layer once fundamentals are in place.
- [freeCodeCamp: Bash & Python for Real DevOps Automation (5 production use cases)](https://www.freecodecamp.org/news/how-to-use-bash-python-for-real-devops-automation-handbook-with-production-use-cases/)
  Production-style scenarios (log correlation, drift detection, secrets rotation). Use for: capstone-style practice near interview readiness.
- [Python Module of the Day: `subprocess` docs](https://docs.python.org/3/library/subprocess.html)
  The one module every bash person must master. Use for: replacing shell pipelines with Python.
- [`sys.argv` in the official docs](https://docs.python.org/3/library/sys.html#sys.argv)
  The list of command-line arguments passed to a script. Use for: making scripts take a filename or other input instead of hardcoding paths.
- [Automate the Boring Stuff, Chapter 12 — Designing and Deploying Command Line Programs](https://automatetheboringstuff.com/3e/chapter12.html)
  Practical intro to building CLI programs. Use for: gentler walkthrough after the official `sys.argv` docs.
- [`pathlib` in the official docs](https://docs.python.org/3/library/pathlib.html)
  Object-oriented filesystem paths, including `Path.rglob`. Use for: walking directory trees and matching files by pattern.
- [Real Python: How to Get a List of All Files in a Directory](https://realpython.com/get-all-files-in-directory-python/)
  Clear comparison of `iterdir`, `glob`, and `rglob`. Use for: choosing the right listing method after the official docs.
- [Official HOWTO: Fetch Internet Resources Using urllib](https://docs.python.org/3/howto/urllib2.html)
  Authoritative intro to `urlopen`, responses, and `URLError`/`HTTPError`. Use for: hitting APIs with the standard library.
- [`urllib.request` module docs](https://docs.python.org/3/library/urllib.request.html)
  Full reference for `urlopen` and `Request`. Use for: details beyond the HOWTO.
- [Real Python: Python’s urllib.request for HTTP Requests](https://realpython.com/urllib-request/)
  Practical walkthrough including JSON APIs. Use for: a gentler second pass after the official HOWTO.
- [`os.environ` in the official docs](https://docs.python.org/3/library/os.html#os.environ)
  Mapping of process environment variables. Use for: reading deploy/config settings and secrets from the environment.
- [`os.getenv` in the official docs](https://docs.python.org/3/library/os.html#os.getenv)
  Convenience wrapper around `os.environ.get`. Use for: the same pattern with a slightly shorter call.
- [Official Tutorial — Reading and Writing Files](https://docs.python.org/3/tutorial/inputoutput.html#reading-and-writing-files)
  Modes (`r`/`w`/`a`), `write()`, and why `with` matters. Use for: writing reports and saving script output to disk.
- [Official Tutorial — Executing modules as scripts](https://docs.python.org/3/tutorial/modules.html#executing-modules-as-scripts)
  How `__name__` becomes `"__main__"` when a file is run. Use for: the standard script entry-point idiom.
- [`__main__` — Top-level code environment](https://docs.python.org/3/library/__main__.html)
  Authoritative explanation of the idiom and the idiomatic `main()` pattern. Use for: why the guard exists and how to structure scripts.
- [Real Python: What Does `if __name__ == "__main__"` Do?](https://realpython.com/if-name-main-python/)
  Clear walkthrough with examples. Use for: a gentler second pass after the official tutorial section.
- [Official Tutorial — A First Look at Classes](https://docs.python.org/3/tutorial/classes.html#a-first-look-at-classes)
  Authoritative intro to `class`, instances, `__init__`, and methods. Use for: enough OOP to read others' code — stop before inheritance unless needed.
- [Real Python: Python Classes](https://realpython.com/python-classes/)
  Practical walkthrough of attributes and methods. Use for: a gentler second pass after the official “first look” section.
- [Official Tutorial — List Comprehensions](https://docs.python.org/3/tutorial/datastructures.html#list-comprehensions)
  Canonical intro to `[expr for item in iterable if condition]`. Use for: the authoritative first read; stop before nested comprehensions unless needed.
- [Real Python: List Comprehension](https://realpython.com/list-comprehension-python/)
  Gentler walkthrough with filter and transform examples. Use for: a second pass after the official tutorial section.

## Wisdom (Communities)

- [r/devops](https://reddit.com/r/devops)
  Active, well-moderated. Use for: what Python questions actually come up in DevOps interviews right now.
- [Python Discord](https://discord.gg/python)
  Large, beginner-friendly, fast feedback in help channels. Use for: getting unstuck on code, code review of practice scripts.
- [Exercism Python track](https://exercism.org/tracks/python)
  Free mentored exercises. Use for: interview-style practice with human feedback on idiomatic style.

## Gaps

- No vetted source yet for *DevOps-specific* Python interview question banks — need to find real examples of what gets asked (log parsing, API calls, etc.) rather than generic leetcode.
