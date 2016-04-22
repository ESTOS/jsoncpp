CXX=i686-w64-mingw32-g++
TARGET_DIR=./build/
TARGET=libkmsjsoncpp.dll

ifdef DEBUG
CXX += -g -o0
TARGET_DIR = ./build/debug/
endif

CFLAGS= \
-I./include/

SRC= \
./src/lib_json/json_value.cpp \
./src/lib_json/json_reader.cpp \
./src/lib_json/json_writer.cpp

all:
	mkdir -p $(TARGET_DIR)
	$(CXX) -shared -o $(TARGET_DIR)/$(TARGET) $(CFLAGS) $(SRC) -Wl,--out-implib,$(TARGET_DIR)/$(TARGET).a

.PHONY: clean
clean:
	rm $(TARGET_DIR)/$(TARGET)
	rm $(TARGET_DIR)/$(TARGET).a

