macos-manuals
=============

What is this?
-------------

It's a simple Makefile for collecting open source manual pages for 
macOS so that they can be read on the go or on a non-macOS operating 
system.


Why?
----

I don't have a Mac, and I try to write cross-platform code. The only 
way to do that is with good documentation. :)


Dependencies
------------

  - make

  - ksh

  - curl

  - mandoc


OK how do I use it?
-------------------

```
make
MANPATH=/path/to/manroot apropos
MANPATH=/path/to/manroot man
```


Can't I distribute the collected manuals instead of a Makefile?
---------------------------------------------------------------

It's open source, so it's probably fine. But I'm not a lawyer, so I'm 
going to err on the side of not redistributing Apple's copyrighted 
works.
