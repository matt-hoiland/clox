CC=clang
CFLAGS=

SRC=src
BIN=bin

SRCS=$(wildcard $(SRC)/*.c)
BINS=$(patsubst $(SRC)/%.c, $(BIN)/%.o, $(SRCS))

all: default

$(BIN)/clox: $(BINS) | $(BIN)
	$(CC) $(CFLAGS) -o $@ $^

$(BIN)/%.o: $(SRC)/%.c | $(BIN)
	$(CC) $(CFLAGS) -o $@ -c $^

$(BIN):
	@mkdir -p $(BIN)

clean:
	rm -r $(BIN)

default: $(BIN)/clox

run: default
	./bin/clox
