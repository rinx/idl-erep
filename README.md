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


Configurations
---

In `~/.idl_profile`, you can set some configurations of this environment.

| variable   | default                   | description                                          |
|:----------:|:-------------------------:|:----------------------------------------------------:|
| `idlbin`   | 'idl'                     | PATH of IDL executable file                          |
| `prompt`   | 'IDL-EREP> '              | prompt string of this environment                    |
| `idlhist`  | '~/.idl/idl/rbuf/history' | PATH of default IDL history file (used only reading) |
| `homehist` | '~/.idl\_history'         | PATH of IDL-EREP history file in home directory      |
| `currhist` | './.idl\_history'         | PATH of IDL-EREP history file in current directory   |
| `histlim`  | 10000                     | limit number of IDL-EREP history file elements       |


