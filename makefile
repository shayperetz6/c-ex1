CC = gcc
AR = ar 
OBJECTS_MAIN = main.o
OBJECTS_LIB = Power.o basicMath.o
FLAGS = -Wall -g

all: mymaths mymathd mains maind
mymaths: libmyMath.a
mymathd: libmyMath.so

mains: $(OBJECTS_MAIN) libmyMath.a
	$(CC) $(FLAGS) -o mains $(OBJECTS_MAIN) libmyMath.a
maind: $(OBJECTS_MAIN) libmyMath.so
	$(CC) $(FLAGS) -o maind $(OBJECTS_MAIN) ./libmyMath.so

libmyMath.a: $(OBJECTS_LIB) myMath.h
	$(AR) -rcs -o libmyMath.a $(OBJECTS_LIB)

libmyMath.so: $(OBJECTS_LIB) myMath.h
	$(CC) -shared -o libmyMath.so $(OBJECTS_LIB)
main.o: main.c myMath.h
	$(CC) $(FLAGS) -c main.c
Power.o: Power.c myMath.h
	$(CC) $(FLAGS) -c Power.c
basicMath.o: basicMath.c myMath.h
	$(CC) $(FLAGS) -c basicMath.c

.PHONY: clean all mymaths mymathd

clean:
	rm -f *.o *.a *.so mains maind
