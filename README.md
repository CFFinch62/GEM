# Gem IDE

![Gem IDE banner](gem_banner.svg)

A lightweight PyQt6 IDE for Ruby, built on the Base IDE skeleton.

## Features
- Top menu bar (File, Edit, View, Theme)
- Toolbar
- Left file browser with navigation controls and bookmarks
- Tabbed editor area with line numbers, current-line highlight, and Ruby syntax highlighting
- Find/Replace dialog (Ctrl+F)
- Console/terminal panel that runs scripts with the system `ruby` interpreter, with an input
  line wired to the running process's stdin
- Status bar with cursor position
- Generic open/save workflow with error dialogs on failure
- Window size, splitter layout, and theme persisted across restarts

## Requirements
A `ruby` interpreter must be on `PATH` (e.g. `sudo apt install ruby`).

## Run
```bash
cd "/home/chuck/Dropbox/Programming/Languages_and_Code/Programming_Projects/Programming_Tools/IDES/IDE_Suite 2/GEM"
./run.sh
```
`run.sh` creates `venv/` and installs requirements automatically (via
`setup.sh`) on first run, then launches the app. Run `./setup.sh` directly
if you just want to (re)provision the environment without launching.

## Build a standalone binary
```bash
source venv/bin/activate
python build.py
```
Produces a self-contained app in `dist/GEM/` via PyInstaller (see `build.py`
and the generated `GEM.spec`).

## Ruby support
Ruby-specific behavior lives in `app/ruby_language.py`'s `RubyLanguageProvider`:
- `create_highlighter` — regex-rule highlighter for keywords, builtins, strings,
  numbers, symbols (`:sym`), and instance/class/global variables (`@`, `@@`, `$`).
- `run` — writes the editor's contents to a temp `.rb` file and runs it with
  `ruby` via `QProcess`, streaming stdout/stderr to the console as they arrive.
- `handle_input` — forwards text typed into the console's input line to the
  running process's stdin, so `gets` works interactively.

## Documentation pane
A tabbed reference-document reader sits at the far right of the window,
always full height, independently resizable, toggled from **View → Toggle
Documentation**. Stage plain text, Markdown, or HTML files in `docs/` —
double-clicking one in the file browser opens it here instead of as an
editor tab.

## Themes
Themes are JSON files in `themes/`, picked from the Theme menu or Edit →
Preferences → Theme. Drop your own `<name>.json` into
`~/.config/gem_ide/themes/` to add a custom one — any color field you
don't specify falls back to the Dark theme's value.

## Other extension points
- Expand the file browser with project management features such as new folders, rename, and delete.
- Add a preferences dialog for editor font size, tab width, etc.

## License
MIT — see [LICENSE](LICENSE).
