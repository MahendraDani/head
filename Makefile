CC = g++-14
SRC = head.cpp
BIN_DIR = bin
TARGET=cchead

all:
	$(CC) -o $(TARGET) $(SRC)

test:
	tests/run-tests.sh

clean:
	rm -rf $(TARGET)

.PHONY:
	all clean