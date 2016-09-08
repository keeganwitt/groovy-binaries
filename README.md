# groovy-binaries
Experimental replacement for [Groovy native launcher](https://github.com/groovy/groovy-native-launcher) binaries.

## Windows

### Instructions
1. Install prerequisites.
1. Add prerequisites to path.
1. Run `mingw32-make`.

### Prerequisites
* [MinGW](http://www.mingw.org/) g++ (also available through [Cygwin](https://www.cygwin.com/))
* [GNU Make](https://www.gnu.org/software/make/) (included in MinGW, also available through [Cygwin](https://www.cygwin.com/))
* sed (available through MinGW [MSYS](http://www.mingw.org/wiki/msys), [Cygwin](https://www.cygwin.com/), etc)


## Linux

### Instructions
1. Install prerequisites.
1. Run `make`.

### Prerequisites
* [g++](https://gcc.gnu.org/)
* GNU [Make](https://www.gnu.org/software/make/)
* [sed](https://www.gnu.org/software/sed/)
* [MinGW](http://www.mingw.org/) (for windows.h)
