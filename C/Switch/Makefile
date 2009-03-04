CFLAGS = -O3

all: bigswitchtest bigswitch.s

# The executables:
bigswitchtest: bigswitch.o mytime.o dontignore.o
	g++ $(CFLAGS) -o bigswitchtest bigswitch.o mytime.o dontignore.o

bigswitch.s: bigswitch.c
	gcc $(CFLAGS) -S bigswitch.c

# Intermediate targets:
dontignore.o: dontignore.c
	gcc $(CFLAGS) -c dontignore.c

bigswitch.o: bigswitch.c
	gcc $(CFLAGS) -c bigswitch.c

bigswitch.c: bigswitch.pl
	bigswitch.pl > bigswitch.c

mytime.o: mytime.c mytime.h
	gcc $(CFLAGS) -c mytime.c

# Bogus target: (to keep make quiet about it)
bigswitch.pl:
	sleep 1

# Clean up targets:
clean:
	$(RM) *~

clobber: clean
	$(RM) bigswitch.c *.o bigswitchtest
