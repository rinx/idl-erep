IDL-EREP
===
Useful interactive environment for IDL (Interactive Data Language).

* idl\_erep.rb

### idl\_erep.rb
This is the *IDL Enhanced REPl*
which gives an enhanced interactive environment.


Installation
---

`idl_erep.rb` requires to install `rb-readline` gem.

    $ bundle install

or just execute

    $ gem install rb-readline

Then, you can execute `idl_erep.rb`.


Usage
---

Just execute `idl_erep.rb` like following:

    $ ruby idl_erep.rb

or

    $ ./idl_erep.rb

It is recommended to make symbolic link to this ruby script in your PATH.


Key mappings
---
Key mappings depends on `rb-readline`.

| key mappings | description                                                                   |
|:-------------|:------------------------------------------------------------------------------|
| Tab          | Auto-complete files and folder names                                          |
| Ctrl + A     | Go to the beginning of the line you are currently typing on                   |
| Ctrl + E     | Go to the end of the line you are currently typing on                         |
| Ctrl + U     | Clears the line before the cursor position. If you are at the end of the line, clears the entire line. |
| Ctrl + H     | Same as backspace                                                             |
| Ctrl + R     | Let's you search through previously used commands                             |
| Ctrl + W     | Delete the word before the cursor                                             |
| Ctrl + K     | Clear the line after the cursor                                               |
| Ctrl + T     | Swap the last two characters before the cursor                                |
| Esc + T      | Swap the last two words before the cursor                                     |
| Alt + F      | Move cursor forward one word on the current line                              |
| Alt + B      | Move cursor backward one word on the current line                             |


Configurations
---

In `~/.idl_profile`, you can set some configurations of this environment.

| variable   | default                   | description                                          |
|:-----------|:--------------------------|:-----------------------------------------------------|
| `idlbin`   | 'idl'                     | PATH of IDL executable file                          |
| `prompt`   | 'IDL-EREP> '              | prompt string of this environment                    |
| `idlhist`  | '~/.idl/idl/rbuf/history' | PATH of default IDL history file (used only reading) |
| `homehist` | '~/.idl\_history'         | PATH of IDL-EREP history file in home directory      |
| `currhist` | './.idl\_history'         | PATH of IDL-EREP history file in current directory   |
| `histlim`  | 10000                     | limit number of IDL-EREP history file elements       |


