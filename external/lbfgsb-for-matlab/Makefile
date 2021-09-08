# MacOS settings.
MATLAB_HOME = /Applications/MATLAB_R2021a.app
MEX         = $(MATLAB_HOME)/bin/mex
MEXSUFFIX   = mexmaci64
CXX         = g++
F77         = gfortran-11
FORTRAN_LIB = /usr/local/Cellar/gcc/11.2.0/lib/gcc/11
CFLAGS      = -O3 -fPIC -pthread 
FFLAGS      = -O3 -fPIC -fexceptions 

TARGET = lbfgsb.$(MEXSUFFIX)
OBJS   = solver.o matlabexception.o matlabscalar.o matlabstring.o   \
         matlabmatrix.o arrayofmatrices.o program.o matlabprogram.o \
         lbfgsb.o

CFLAGS += -Wall -ansi -DMATLAB_MEXFILE

all: $(TARGET)

%.o: %.cpp
	$(CXX) $(CFLAGS) -I$(MATLAB_HOME)/extern/include -o $@ -c $^

%.o: %.f
	$(F77) $(FFLAGS) -o $@ -c $^

$(TARGET): $(OBJS)
        $(MEX) -cxx CXX=$(CXX) CC=$(CXX) FC=$(FCC) LD=$(CXX) -L$(FORTRAN_LIB) -lgfortran -lm \
	-O -output $@ $^

clean:
	rm -f *.o $(TARGET)

