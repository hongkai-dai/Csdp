#
# This Makefile can be used to automatically build the entire package.  
#
# If you make changes in the Makefile or code under any subdirectory, you can
# rebuild the system with "make clean" followed by "make all".
#
#
# You can change the C compiler by setting CC=...
#
# CC=gcc
#
# CFLAGS settings for 64 bit Linux/unix systems.
#
export CFLAGS=-m64 -march=native -mtune=native -Ofast -fopenmp -ansi -Wall -DBIT64 -DUSEOPENMP -DSETNUMTHREADS -DUSESIGTERM -DUSEGETTIME -I../include -m64 -I/opt/intel/mkl/include
#
# LIBS settings for 64 bit Linux/unix systems.
#
export LIBS= -L../lib -lsdp   -L${MKLROOT}/lib/intel64 -Wl,--no-as-needed -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm -ldl
#
#
# On most systems, this should handle everything.
#
all:
	cd lib; make libsdp.a
	cd solver; make csdp
	cd theta; make all
	cd example; make all

#
# Perform a unitTest
#

unitTest:
	cd test; make all

#
# Install the executables in /usr/local/bin.
#

install:
	cp -f solver/csdp /usr/local/bin
	cp -f theta/theta /usr/local/bin
	cp -f theta/graphtoprob /usr/local/bin
	cp -f theta/complement /usr/local/bin
	cp -f theta/rand_graph /usr/local/bin

#
# Clean out all of the directories.
# 

clean:
	cd lib; make clean
	cd solver; make clean
	cd theta; make clean
	cd test; make clean
	cd example; make clean








