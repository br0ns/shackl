# Lightweight MLton/Preml font-end

This program makes it easy to compile quick-and-dirty SML programs with
[MLton](http://mlton.org/)/[Preml](https://github.com/br0ns/PreML); it
auto-generates an MLB file, compiles it and cleans up.  If ``~/.shackl`` is
present it will be prepended to the MLB file.  Otherwise the line
``$(SML_LIB)/basis/basis.mlb`` will be used.

Example:

```
$ echo ';print "Hello, World!\n";' > foo.sml
$ shackl foo.sml
$ ./foo
Hello, World!
```

## Smackage

Shackl can be installed as a [Smackage](https://github.com/standardml/smackage)
package.
