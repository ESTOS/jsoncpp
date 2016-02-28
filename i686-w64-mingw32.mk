CXX=i686-w64-mingw32-g++
TARGET_DIR=./build/
TARGET=libkmsjsoncpp.dll

CFLAGS= \
-I./include/

SRC= \
./src/lib_json/json_value.cpp \
./src/lib_json/json_reader.cpp \
./src/lib_json/json_writer.cpp

LIBS= \
-L/usr/i686-w64-mingw32/sys-root/mingw/lib \
-L/usr/lib/gcc/i686-w64-mingw32/5.2.0 \
-L/usr/i686-w64-mingw32/lib/

all:
	mkdir -p $(TARGET_DIR)
	$(CXX) -shared -o $(TARGET_DIR)/$(TARGET) $(CFLAGS) $(SRC) $(LIBS) -Wl,--out-implib,$(TARGET_DIR)/$(TARGET).a

.PHONY: clean
clean:
	rm $(TARGET_DIR)/$(TARGET)
	rm $(TARGET_DIR)/$(TARGET).a

