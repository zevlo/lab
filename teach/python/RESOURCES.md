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
- [HOWTO Fetch Internet Resources Using The urllib Package](https://docs.python.org/3/howto/urllib2.html)
  Official tutorial for `urlopen`, GET/POST, and exception handling. Use for: authoritative answers on HTTP with the stdlib.
- [`urllib.request` in the official docs](https://docs.python.org/3/library/urllib.request.html)
  Reference for `urlopen` and `Request`. Use for: exact signatures and parameters after the HOWTO.
- [Real Python: Python’s urllib.request for HTTP Requests](https://realpython.com/urllib-request/)
  Clear walkthrough of GET, JSON bodies, and common errors. Use for: gentler practice after the official HOWTO.

## Wisdom (Communities)

- [r/devops](https://reddit.com/r/devops)
  Active, well-moderated. Use for: what Python questions actually come up in DevOps interviews right now.
- [Python Discord](https://discord.gg/python)
  Large, beginner-friendly, fast feedback in help channels. Use for: getting unstuck on code, code review of practice scripts.
- [Exercism Python track](https://exercism.org/tracks/python)
  Free mentored exercises. Use for: interview-style practice with human feedback on idiomatic style.

## Gaps

- No vetted source yet for *DevOps-specific* Python interview question banks — need to find real examples of what gets asked (log parsing, API calls, etc.) rather than generic leetcode.
