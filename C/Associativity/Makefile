PROGRAMS = addition

all: $(PROGRAMS)

addition: addition.c
	gcc -O3 -o $@ $<

run: $(PROGRAMS)
	addition

clobber:
	$(RM) $(PROGRAMS)
