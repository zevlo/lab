# Terminal, vim, tmux Glossary

Shared vocabulary for this workspace. Terms are added only once you have demonstrated understanding of them; this file grows with you, not ahead of you.

## Shell

**Pipeline**:
A chain of commands where each command's stdout feeds the next command's stdin, joined by `|`.
_Avoid_: pipe-stream (acceptable alias).

## vim

**Mode**:
A distinct editing state in vim (normal, insert, visual, command-line) that determines how keystrokes are interpreted. The same key means different things in different modes.
_Avoid_: editor state.

**Normal mode**:
The default vim mode for moving and operating on text; keystrokes are interpreted as commands, not as literal text input.
_Avoid_: command mode (conflicts with command-line mode).

**Insert mode**:
The vim mode where keystrokes insert literal text into the buffer.
_Avoid_: typing mode, edit mode.

**Operator**:
A normal-mode command that performs an action (delete, change, yank, indent, etc.) on the text selected by an accompanying motion or text-object. Always the verb of a vim sentence.
_Avoid_: action, command.

**Motion**:
A normal-mode keystroke that moves the cursor across text in some structural direction (word, line, document, search). Used after an operator, the moved-over text becomes the operator's target.
_Avoid_: movement, navigation key.

**Text object**:
A two-character normal-mode selector (e.g. `iw`, `a"`, `ip`) that names a structural unit of text rather than a direction. Pairs with an operator to act on that unit. Comes in `i` (inner, excludes delimiters) and `a` (around, includes delimiters) variants.
_Avoid_: selection, region.

## tmux

**Prefix**:
A two-key chord (default `C-b`) that precedes every tmux command, sent from inside a tmux session. Disambiguates tmux commands from application input.
_Avoid_: trigger key.

**Session**:
A named, persistent tmux workspace containing one or more windows. Survives detach and SSH drops.
_Avoid_: workspace (acceptable alias).

**Window**:
A numbered tab within a tmux session, occupying the full terminal area, containing one or more panes.
_Avoid_: tab (acceptable alias).

**Pane**:
A rectangular subregion of a tmux window running its own shell. Panes share the window's area.
_Avoid_: split, frame.
