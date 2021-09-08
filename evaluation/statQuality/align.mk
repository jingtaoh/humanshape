# MacOS settings.
MATLAB_HOME = /Applications/MATLAB_R2021a.app
MEX         = $(MATLAB_HOME)/bin/mex
MEXSUFFIX   = mexmaci64
CXX         = g++
CFLAGS      = -O3 -fPIC -pthread 

TARGET = rigidAlign.$(MEXSUFFIX)
OBJS   = rigidAlign.o GeneralizedProcrustes.o

CFLAGS += -Wall -ansi -DMATLAB_MEXFILE

all: $(TARGET)

%.o: %.cpp
	$(CXX) $(CFLAGS) -I$(MATLAB_HOME)/extern/include  -o $@ -c $^

$(TARGET): $(OBJS)
        -$(MEX) -cxx CXX=$(CXX) CC=$(CXX) LD=$(CXX) $(MATLAB_HOME)/bin/maci64/libmwlapack.dylib $(MATLAB_HOME)/bin/maci64/libmwblas.dylib \
         -O -output $@ $^

clean:
	rm -f *.o $(TARGET)
