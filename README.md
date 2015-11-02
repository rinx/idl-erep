IDL-EREP
===
[![Gem Version](https://badge.fury.io/rb/idl_erep.png)](http://badge.fury.io/rb/idl_erep)

An enhanced interactive environment for IDL (Interactive Data Language).

It provides stronger command history, tab-completion, and key shortcuts.

### idl\_erep
This is the *IDL Enhanced REPl*
which gives an enhanced interactive environment.


Installation
---

Just execute

    $ gem install idl_erep

Then, you can execute `idl_erep`.


Usage
---

Just execute `idl_erep` like following:

    $ idl_erep


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


Command History
---

When start this program, if there's a `.idl_history` file in current directory,
it will be loaded and `~/.idl_history` won't be loaded.
If there's no `.idl_history`, `~/.idl_hisoty` will be loaded.

It will allow you to keep command history only inside the project.


Configurations
---

In `~/.idl_profile`, you can set some configurations of this environment.

| variable       | default                   | description                                          |
|:---------------|:--------------------------|:-----------------------------------------------------|
| `idlbin`       | 'idl'                     | PATH of IDL executable file                          |
| `prompt`       | 'IDL-EREP> '              | prompt string of this environment                    |
| `idlhist`      | '~/.idl/idl/rbuf/history' | PATH of default IDL history file (used only reading) |
| `homehist`     | '~/.idl\_history'         | PATH of IDL-EREP history file in home directory      |
| `currhist`     | './.idl\_history'         | PATH of IDL-EREP history file in current directory   |
| `histlim`      | 10000                     | limit number of IDL-EREP history file elements       |
| `defcomplist`  | ['help', 'plot', etc..]   | default completion keywords list                     |
| `compfuncs`    | ['defcomplist', etc...]   | completion functions                                 |

There are some regex patterns for colorize stdout and stderr outputs.  
If you want to customize these patterns, please see the source code.

| variable             | description                 |
|:---------------------|:----------------------------|
| `stderr_blink_prtn`  | blink patterns for stderr   |
| `stdout_blue_ptrn`   | blue patterns for stdout    |
| `stdout_green_ptrn`  | green patterns for stdout   |
| `stdout_yellow_ptrn` | yellow patterns for stdout  |


About Completion Functions
---

You can add completion functions in `~/.idl_profile`.
The functions must return array of completion keywords like following:

```ruby
compfuncs = ["defcomplist", "get_dir_elems", "get_dir_pros"]

def get_dir_elems()
  Dir::entries(Dir::pwd)
end

def get_dir_pros()
  pros = Dir::entries(Dir::pwd).select do |i|
    i =~ /\.pro$/
  end
  pros.map! do |i|
    i.gsub(/\.pro$/, '')
  end
  pros
end
```



