# How to Install C Compiler

## Windows

We recommend installing [MinGW-w64](http://mingw-w64.org/) or [TDM-GCC](https://jmeubank.github.io/tdm-gcc/):

1. Download the installer from the official website.
2. Follow the installation instructions.
3. Add the `bin` directory of the compiler to your `PATH` environment variable.

## macOS

Open a terminal and run:

```sh
xcode-select --install
```

This will install the Xcode Command Line Tools, including `gcc` and `clang`.

## Linux (Debian/Ubuntu)

Open a terminal and run:

```sh
sudo apt update
sudo apt install build-essential
```

This will install `gcc`, `g++`, and other essential tools for compiling C programs.

## Check your installation

From the command line, check the compiler version:

```sh
gcc --version
```
or
```sh
clang --version
```
