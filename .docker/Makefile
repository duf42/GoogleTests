# Makefile for gtest examples

GOOGLE_TEST_LIB = gtest
GOOGLE_TEST_INCLUDE = /usr/local/include

CC = gcc
CFLAGS = -c -I $(GOOGLE_TEST_INCLUDE)
CXX = g++
CXXFLAGS = -c -Wall -I $(GOOGLE_TEST_INCLUDE)
LDFLAGS = -L /usr/local/lib -l $(GOOGLE_TEST_LIB) -l pthread
CPPFLAGS ?= $(INC_FLAGS) -MMD -MP

MKDIR_P ?= mkdir -p

BUILD_DIR = /tests/bin
TARGET_EXEC = runtests

SRC_DIRS = /tests/src

SRCS := $(shell find $(SRC_DIRS) -name *.cpp -or -name *.c -or -name *.s) /tests/main.cpp
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

INC_DIRS := $(shell find $(SRC_DIRS) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

$(BUILD_DIR)/$(TARGET_EXEC): $(OBJS)
	$(CXX) $(OBJS) -o $@ $(LDFLAGS)
#$(CC) $(OBJS) -o $@ $(LDFLAGS)

# assembly
$(BUILD_DIR)/%.s.o: %.s
	$(MKDIR_P) $(dir $@)
	$(AS) $(ASFLAGS) -c $< -o $@

# c source
$(BUILD_DIR)/%.c.o: %.c
	$(MKDIR_P) $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

# c++ source
$(BUILD_DIR)/%.cpp.o: %.cpp
	$(MKDIR_P) $(dir $@)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

.PHONY: clean

clean:
	$(RM) -r $(BUILD_DIR)

-include $(DEPS)

