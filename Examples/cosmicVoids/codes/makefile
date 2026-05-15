CXX = g++

FLAGS0 = -std=c++17 -fopenmp
FLAGS = -O3 -unroll -Wall -Wextra -pedantic -Wfatal-errors -Werror

dirLib = $(PWD)/../../../
dirH = $(dirLib)Headers/
dir_Eigen = $(dirLib)External/Eigen/eigen-3.4.0/
dir_CCfits = $(dirLib)External/CCfits/include
dirCUBA = $(dirLib)External/Cuba-4.2.1/

FLAGS_LIB = -Wl,-rpath,$(HOME)/lib/ -Wl,-rpath,$(dirLib) -L$(dirLib) -lCBL
FLAGS_INC = -I$(HOME)/include/  -I$(dirH) -I$(dirCUBA) -I$(dir_Eigen) -I$(dir_CCfits)

OBJ1 = sizeFunction.o
OBJ2 = cleanVoidCatalogue.o
OBJ3 = modelling_VoidAbundances.o
OBJ4 = voidFinder.o
OBJ8 = BitVF_LaZeVo.o

ES = so

SYS:=$(shell uname -s)

ifeq ($(SYS),Darwin)
        ES = dylib
endif

sizeFunction: $(OBJ1)
	$(CXX) $(OBJ1) -o sizeFunction $(FLAGS_LIB)

cleanVoidCatalogue: $(OBJ2)
	$(CXX) $(OBJ2) -o cleanVoidCatalogue $(FLAGS_LIB)

modelling_VoidAbundances: $(OBJ3)
	$(CXX) $(OBJ3) -o modelling_VoidAbundances $(FLAGS_LIB)

voidFinder: $(OBJ4)
	$(CXX) $(OBJ4) -o voidFinder $(FLAGS_LIB)

BitVF_LaZeVo: $(OBJ8)   # <-- nuevo ejecutable
	$(CXX) $(OBJ8) -o BitVF_LaZeVo $(FLAGS_LIB)

clean:
	rm -f *.o sizeFunction cleanVoidCatalogue modelling_VoidAbundances voidFinder BitVF_LaZeVo *~ \#* temp* core*

sizeFunction.o: sizeFunction.cpp makefile $(dirLib)*.$(ES)
	$(CXX) $(FLAGS0) $(FLAGS) $(FLAGS_INC) -c sizeFunction.cpp

cleanVoidCatalogue.o: cleanVoidCatalogue.cpp makefile $(dirLib)*.$(ES)
	$(CXX) $(FLAGS0) $(FLAGS) $(FLAGS_INC) -c cleanVoidCatalogue.cpp

modelling_VoidAbundances.o: modelling_VoidAbundances.cpp makefile $(dirLib)*.$(ES)
	$(CXX) $(FLAGS0) $(FLAGS) $(FLAGS_INC) -c modelling_VoidAbundances.cpp

voidFinder.o: voidFinder.cpp makefile $(dirLib)*.$(ES)
	$(CXX) $(FLAGS0) $(FLAGS) $(FLAGS_INC) -c voidFinder.cpp

BitVF_LaZeVo.o: BitVF_LaZeVo.cpp makefile $(dirLib)*.$(ES)   # <-- regla de compilación
	$(CXX) $(FLAGS0) $(FLAGS) $(FLAGS_INC) -c BitVF_LaZeVo.cpp