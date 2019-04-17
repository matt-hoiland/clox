CC      = gcc
CFLAGS  = -std=gnu99 -g #-Wall -Werror

SRC_DIR = src
OBJ_DIR = obj

_DEPS   = common.h chunk.h memory.h debug.h value.h vm.h compiler.h scanner.h object.h table.h
DEPS    = $(patsubst %, $(SRC_DIR)/%, $(_DEPS))

_OBJS   = main.o chunk.o memory.o debug.o value.o vm.o compiler.o scanner.o object.o table.o
OBJS    = $(patsubst %, $(OBJ_DIR)/%, $(_OBJS))

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

clox: $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm clox $(OBJ_DIR)/*.o
