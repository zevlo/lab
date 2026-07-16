# Methods-as-functions layer is solid

Completed Lesson 0020 with 3/3 on the quiz and a correct from-memory script. User can now write `class Host` with `__init__` storing attributes **plus** a `summary(self)` method that reads them — the exact layer Learning Record 0020 said to reintroduce.

## Evidence

Quiz 3/3. Pasted code matches the exercise spec exactly, including the "under the hood" check `print(Host.summary(web))` producing the same output as `web.summary()`.

## Gotcha surfaced

User had to troubleshoot **missing parentheses** when calling the method — i.e. writing `print(web.summary)` (references the method object) vs `print(web.summary())` (calls it). This is the call-vs-reference distinction. Worth one quick reinforcement in a future exercise, but it is a normal stumbling point, not a conceptual gap.

## Implications

- The OOP remediation arc is complete: attributes (0019) → methods reading attributes (0020). Lesson 0018's full script (Host + summary + main + argv + entry guard) is now within reach because every piece has been practiced in isolation.
- Good next move: a **small combine** that reassembles the familiar pieces (a `Host`/`Server` class with attributes + a method, a `main()` that builds instances from `sys.argv`, an entry guard). This is Lesson 0018 done at the right pace — not a difficulty escalation, just assembly of known parts.
- Do not introduce inheritance, `@classmethod`, `@staticmethod`, or `__str__` yet.
- Reinforce `method()` vs `method` (call vs reference) once in the next exercise's expected output.
