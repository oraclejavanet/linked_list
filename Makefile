# ----------------------------------------------------------
# Makefile
# ----------------------------------------------------------

# ----------------------------
# PROJECT NAME
# ----------------------------
PROJECT = linked_list

# ----------------------------
# SOURCE FILES
# ----------------------------
SOURCES = list.c  testLinkedList.c

# ----------------------------
# LIBRARIES
# ----------------------------
LIBRARIES =

# ----------------------------
# PROGRAM ARGUMENTS
# ----------------------------
PROGRAM_ARGS =

# ----------------------------
# DIRECTORIES
# ----------------------------
OBJDIR = obj
SRCDIR = src
INCDIR = include
LIBDIR = lib
BINDIR = bin

# ----------------------------
# COMPILER
# ----------------------------
CC = gcc
CFLAGS = -c -Wall -g -I$(INCDIR)
LDFLAGS =

# ----------------------------------------------
# !!!!!DO NOT EDIT ANYTHING UNDER THIS LINE!!!!!
# ----------------------------------------------
OBJECTS = $(SOURCES:.c=.o)
SOURCE_FILES = $(addprefix $(SRCDIR)/,$(SOURCES))
OBJECT_FILES = $(addprefix $(OBJDIR)/,$(OBJECTS))
LIBRARY_FILES = $(addprefix $(LIBDIR)/,$(LIBRARIES))
PROGRAM_EXECUTABLE = $(addprefix $(BINDIR)/,$(PROJECT))

.PHONY: clean all default

# ----------------------------
# TARGETS
# ----------------------------
all: $(SOURCE_FILES) $(PROGRAM_EXECUTABLE)

$(PROGRAM_EXECUTABLE): $(OBJECT_FILES)
	@echo "----------------------------"
	@echo "Creating program executable"
	@echo "----------------------------"
	$(CC) $(OBJECT_FILES) $(LDFLAGS) $(LIBRARY_FILES) -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@echo "----------------------------"
	@echo "Creating object files"
	@echo "----------------------------"
	$(CC) $(CFLAGS) $< -o $@

run: ${PROGRAM_EXECUTABLE}
	@echo "----------------------------"
	@echo "Running project $(PROJECT)"
	@echo "----------------------------"
	${PROGRAM_EXECUTABLE} ${PROGRAM_ARGS}

clean:
	@echo "----------------------------"
	@echo "Cleaning build area"
	@echo "----------------------------"
	rm -f $(OBJECT_FILES) $(PROGRAM_EXECUTABLE)* $(INCDIR)/*~ *~ core

