# Head

Implementation of [head(1)](https://man7.org/linux/man-pages/man1/head.1.html) CLI utility from scratch in C++ following the [Build Your Own Head Tool](https://codingchallenges.fyi/challenges/challenge-head) coding challenge.


# Setting up locally
To setup and run this project locally, please follow the below steps:

## Prerequisites

1. C/C++ Compiler: 
Please make sure that you have a C/C++ compiler installed on your system, preferably gcc or clang.

2. Install make:

If you are using Mac, and have [Homebrew](https://brew.sh/) installed, use : 
```bash
brew install make
```

## Setup

1. Clone the project on your machine.
```
git clone https://github.com/MahendraDani/head.git
```

2. Build from source 

First change directory, `cd head`, then

```bash
make
```

This command will build the project from source, and output the executable `bin/cat`.

To verify clean installation, try running:
```bash
./cchead data/text.txt
```
You should be able to see first 10 lines of the [data/text.txt](https://github.com/MahendraDani/head/blob/main/data/text.txt) file printed on the console.

## Usage
For usage, please read the [man page](https://man7.org/linux/man-pages/man1/head.1.html) of head(1)

1. Read input from a file
```bash
./cchead file.txt
```

2. Read from multiple files and concatenate
```bash
./cchead file1.txt file2.txt file3.txt
```

3. Read from stdin
```bash
./cchead
```

3. Show first n lines
```bash
./cchead -n4 file.txt
```

4. Show first c bytes
```bash
./cchead -c4 file.txt
```

## Testing

Although writing tests was not included in the challenge, any program to be called "production-ready" should and _must_ be appropriately tested. So I wrote a few tests in shell scripts to test my code.

Much of the inspiration of writing tests is taken from the [git project](https://github.com/git/git/tree/master/t) (as you can see from the names of test files :P)  which has a lot of tests written in shell scripts.

This also forced me to learn about shell scripting, unit testing and much more, which is also essential in writing good software.

To run the test suite, simply run :
```bash
make test
```

If you want to specially run a particular test file:
```bash
tests/<test_script>.sh
```

Thanks!
