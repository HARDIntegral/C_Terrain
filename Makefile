CC := gcc
FLAGS := -g -O0 -Wall -Wextra
FILE_TYPE := .c
SRC_DIR := Source/
HEADER_DIR := Include/
OBJ_DIR := bin/obj/

EXEC_DIR := bin/
EXEC_NAME := perlin
BUILD_TARGET := out

EXEC := $(EXEC_NAME).$(BUILD_TARGET)
BUILD := $(EXEC_DIR)$(EXEC)

SRCS := $(wildcard $(SRC_DIR)**/**$(FILE_TYPE)) $(wildcard $(SRC_DIR)*$(FILE_TYPE))
OBJS := $(patsubst $(SRC_DIR)%$(FILE_TYPE), $(OBJ_DIR)%.o, $(SRCS))


DEPS := $(patsubst %.o, %.d, $(OBJS))
-include $(DEPS)
DEP_FLAGS = -MMD -MF $(@:.o=.d)

build: $(OBJS)
	@echo [INFO] Creating [$(BUILD_TARGET)] ...
	@$(CC) -o $(BUILD) $^
	@echo [INFO] [$(EXEC)] Created!

$(OBJ_DIR)%.o: $(SRC_DIR)%$(FILE_TYPE)
	@echo [CC] $<
	@mkdir -p $(@D)
	@$(CC) $(FLAGS) $< -c -o $@ -I $(HEADER_DIR)  $(DEP_FLAGS)

run:
	@./$(BUILD) $(RUNTIME_ARGS)

.PHONY: clean
clean:
	@echo [INFO] Removing Pre-Compiled Object Files ...
	@rm -rf $(OBJ_DIR)
	@echo [INFO] Remvoing Prerequisite Files ...
	@rm -rf $(DEPS)
	@echo [INFO] Removing Compiled Libraries ...
	@rm -rf $(EXEC_DIR)