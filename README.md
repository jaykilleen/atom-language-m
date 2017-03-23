# M language support in Atom

Adds syntax highlighting and snippets to [.m](https://msdn.microsoft.com/en-us/library/mt211003.aspx) files in [Atom](http://atom.io/).

## Install

Install the package `atom-language-m` in Atom (Preferences->Packages) or Atom's package manager from a shell:

```bash
$ apm install atom-language-m
```

## Bugs

Grammar rules were written from scratch. They are under construction while I learn regex. There is wrong syntax highlighting. Feel free to fix it and send a pull request, or open an issue to report it.

## Links

* [M](https://msdn.microsoft.com/en-us/library/mt211003.aspx) -- a safe, concurrent, practical language
* [Atom](http://atom.io/) -- a hackable text editor for the 21st Century

---

Resources I used to build this grammar package
http://www.apeth.com/nonblog/stories/textmatebundle.html

In particular the common standard themes list

comment
constant
constant.character.escape
constant.language
constant.numeric
declaration.section entity.name.section
declaration.tag
deco.folding
entity.name.function
entity.name.tag
entity.name.type
entity.other.attribute-name
entity.other.inherited-class
invalid
invalid.deprecated.trailing-whitespace
keyword
keyword.control.import
keyword.operator.js
markup.heading
markup.list
markup.quote
meta.embedded
meta.preprocessor
meta.section entity.name.section
meta.tag
storage
storage.type.method
string
string source
string.unquoted
support.class
support.constant
support.function
support.type
support.variable
text source
variable
variable.language
variable.other
variable.parameter
#