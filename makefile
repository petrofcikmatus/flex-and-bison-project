NAME = project

CC = gcc
CFLAGS = -g -O

YACC = bison
YFLAGS = -d -v
YSRC = project.y

LEX = flex
LFLAGS =
LSRC = project.l

OBJECTS = project.tab.o lex.yy.o

all: project
    @echo "Building done."

project: $(OBJECTS)
    $(CC) $(CFLAGS) $(OBJECTS) -o $@ -lm -ly -lfl

project.tab.o: project.tab.c

lex.yy.c: project.l
    $(LEX) $(LFLAGS) $(LSRC)

project.tab.c: project.y
    $(YACC) $(YFLAGS) $(YSRC)

clean:
    rm -rf project project.output project.tab.h project.tab.c lex.yy.c *.o
    @echo "Cleaning done."