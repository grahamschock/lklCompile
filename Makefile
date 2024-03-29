CC = gcc
CFLAGS = -I.



#



# gcc -Wp,-MD,./.boot.o.d -Wp,-MT,./boot.o -fPIC -pthread -I./include -Iinclude \
> -Wall -g -O2 -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -D"BUILD_STR(s)=#s" -c -o ./boot.o ./boot.c

OBJS = boot boot.o boot-in.o .boot.o.d .test.o.d test.o

hellomake:
	  gcc -Wp,-MD,./.test.o.d -Wp,-MT,./test.o -fPIC -pthread -I/./include -Iinclude -Wall -g -O2 -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -D"BUILD_STR(s)=#s" -c -o ./test.o ./test.c
	 gcc -Wp,-MD,./.boot.o.d -Wp,-MT,./boot.o -fPIC -pthread -I./include -Iinclude \
> -Wall -g -O2 -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -D"BUILD_STR(s)=#s" -c -o ./boot.o ./boot.c
	ld -r -o ./boot-in.o ./boot.o ./test.o
	gcc -pie  -o ./boot ./boot-in.o ./liblkl.a -lrt -lpthread
clean:
	rm -f $(OBJS) $(BIN) *~
