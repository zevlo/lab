# Misconception corrected: `da"` does not strip just the quotes

In Lesson 0001 Task 2, the user expected `da"` on `"8080"` to strip the quotes and leave `8080`. In fact:

- `da"` (delete **a**round) deletes the entire quoted string — content **and** quotes.
- `di"` (delete **i**nner) deletes only the content, leaving `""`.

Neither removes just the delimiters. To strip delimiters and keep content, the correct tools are `:s/"//g` (substitute) or `f"x;x` (find-quote, delete-char, repeat).

The lesson was edited to turn the bug into a deliberate teachable moment: Task 2 now has the user try **both** `da"` and `di"` and observe the difference before reading the explanation.

**Evidence**: User flagged the discrepancy unprompted after running the drill — reliable signal that they noticed the operator did something different from the lesson's claim.

**Implications**: The `i`/`a` (inner/around) distinction is now a known gotcha. Future lessons covering other paired text objects (`i(`/`a(`, `i{`/`a{`, `it`/`at`) should reinforce this contrast explicitly rather than assuming it transfers.
