CC = gcc
CFLAGS = -Wall -Iinclude -g
LDFLAGS = -lpthread

SRCS = src/main.c src/collector.c src/logger.c
OBJS = $(SRCS:src/%.c=build/%.o)
TARGET = build/log_tool

BUILD_DIR = build
DATA_DIR = data

all: $(BUILD_DIR) $(DATA_DIR) $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(LDFLAGS)

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

$(DATA_DIR):
	@mkdir -p $(DATA_DIR)

$(BUILD_DIR)/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)
	rm -f $(DATA_DIR)/*.csv $(DATA_DIR)/*.bak