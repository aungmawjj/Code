include /home/ubuntu/integridb/Code/ate-pairing/common.mk

HEADER= /home/ubuntu/integridb/Code/ate-pairing/include/zm.h /home/ubuntu/integridb/Code/ate-pairing/include/bn.h /home/ubuntu/integridb/Code/ate-pairing/include/zm2.h test_point.hpp database.hpp
TARGET= server client common_functions skiplist_functions 

LDFLAGS += -lntl -lmysqlclient --std=c++0x -lssl -lcrypto -lpthread -lgmp

OBJ = server.o client.o common_functions.o skiplist_functions.o

all:$(TARGET)

.SUFFIXES: .cpp .o

create: createtables.o
	$(CXX) -o createtables createtables.o

main: $(OBJ) /home/ubuntu/integridb/Code/ate-pairing/lib/libzm.a
	$(CXX) -o main server.o client.o common_functions.o skiplist_functions.o $(LDFLAGS) $(BIT)


clean:
	$(RM) *.o $(TARGET)

client.o: client.cpp $(HEADER)
common_functions.o: common_functions.cpp $(HEADER)
server.o: server.cpp $(HEADER)
skiplist_functions.o: skiplist_functions.cpp $(HEADER)
createtables.o: createtables.cpp



