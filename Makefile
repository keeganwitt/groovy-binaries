CC=g++
CFLAGS=-g -Wall -O3 -m32
CFLAGSW=$(CFLAGS) -mwindows
LDFLAGS=-static-libgcc -static-libstdc++
SOURCE_DIR=src
BUILD_DIR=build
DIST_DIR=$(BUILD_DIR)/dist

all: mkdir groovy.exe groovyw.exe groovyConsole.exe groovyc.exe groovysh.exe java2groovy.exe grape.exe gant.exe gantw.exe

groovy.exe:
	  sed -e "s|_name_|groovy|" $(SOURCE_DIR)/res/template.rc | sed -e "s|_icon_|$(SOURCE_DIR)/res/groovy|" > $(BUILD_DIR)/groovy.rc
	  windres $(BUILD_DIR)/groovy.rc -O coff $(BUILD_DIR)/groovy.res
		$(CC) $(CFLAGS) $(LDFLAGS) -o $(DIST_DIR)/groovy.exe $(SOURCE_DIR)/batWrapper.cpp $(BUILD_DIR)/groovy.res

groovyw.exe:
	  sed -e "s|_name_|groovyw|" $(SOURCE_DIR)/res/template.rc | sed -e "s|_icon_|$(SOURCE_DIR)/res/groovy|" > $(BUILD_DIR)/groovyw.rc
	  windres $(BUILD_DIR)/groovyw.rc -O coff $(BUILD_DIR)/groovyw.res
		$(CC) $(CFLAGSW) $(LDFLAGS) -o $(DIST_DIR)/groovyw.exe $(SOURCE_DIR)/batWrapperW.cpp $(BUILD_DIR)/groovyw.res

groovyConsole.exe:
	  sed -e "s|_name_|groovyConsole|" $(SOURCE_DIR)/res/template.rc | sed -e "s|_icon_|$(SOURCE_DIR)/res/groovy|" > $(BUILD_DIR)/groovyConsole.rc
	  windres $(BUILD_DIR)/groovyConsole.rc -O coff $(BUILD_DIR)/groovyConsole.res
		$(CC) $(CFLAGSW) $(LDFLAGS) -o $(DIST_DIR)/groovyConsole.exe $(SOURCE_DIR)/batWrapperW.cpp $(BUILD_DIR)/groovyConsole.res

groovyc.exe:
	  sed -e "s|_name_|groovyc|" $(SOURCE_DIR)/res/template.rc | sed -e "s|_icon_|$(SOURCE_DIR)/res/groovy|" > $(BUILD_DIR)/groovyc.rc
	  windres $(BUILD_DIR)/groovyc.rc -O coff $(BUILD_DIR)/groovyc.res
		$(CC) $(CFLAGS) $(LDFLAGS) -o $(DIST_DIR)/groovyc.exe $(SOURCE_DIR)/batWrapper.cpp $(BUILD_DIR)/groovyc.res

groovysh.exe:
	  sed -e "s|_name_|groovysh|" $(SOURCE_DIR)/res/template.rc | sed -e "s|_icon_|$(SOURCE_DIR)/res/groovy|" > $(BUILD_DIR)/groovysh.rc
	  windres $(BUILD_DIR)/groovysh.rc -O coff $(BUILD_DIR)/groovysh.res
		$(CC) $(CFLAGS) $(LDFLAGS) -o $(DIST_DIR)/groovysh.exe $(SOURCE_DIR)/batWrapper.cpp $(BUILD_DIR)/groovysh.res

java2groovy.exe:
	  sed -e "s|_name_|java2groovy|" $(SOURCE_DIR)/res/template.rc | sed -e "s|_icon_|$(SOURCE_DIR)/res/groovy|" > $(BUILD_DIR)/java2groovy.rc
	  windres $(BUILD_DIR)/java2groovy.rc -O coff $(BUILD_DIR)/java2groovy.res
		$(CC) $(CFLAGS) $(LDFLAGS) -o $(DIST_DIR)/java2groovy.exe $(SOURCE_DIR)/batWrapper.cpp $(BUILD_DIR)/java2groovy.res

grape.exe:
	  sed -e "s|_name_|grape|" $(SOURCE_DIR)/res/template.rc | sed -e "s|_icon_|$(SOURCE_DIR)/res/groovy|" > $(BUILD_DIR)/grape.rc
	  windres $(BUILD_DIR)/grape.rc -O coff $(BUILD_DIR)/grape.res
		$(CC) $(CFLAGS) $(LDFLAGS) -o $(DIST_DIR)/grape.exe $(SOURCE_DIR)/batWrapper.cpp $(BUILD_DIR)/grape.res

gant.exe:
	  sed -e "s|_name_|gant|" $(SOURCE_DIR)/res/template.rc | sed -e "s|_icon_|$(SOURCE_DIR)/res/gant|" > $(BUILD_DIR)/gant.rc
	  windres $(BUILD_DIR)/gant.rc -O coff $(BUILD_DIR)/gant.res
		$(CC) $(CFLAGS) $(LDFLAGS) -o $(DIST_DIR)/gant.exe $(SOURCE_DIR)/batWrapper.cpp $(BUILD_DIR)/gant.res

gantw.exe:
	  sed -e "s|_name_|gantw|" $(SOURCE_DIR)/res/template.rc | sed -e "s|_icon_|$(SOURCE_DIR)/res/gant|" > $(BUILD_DIR)/gantw.rc
	  windres $(BUILD_DIR)/gantw.rc -O coff $(BUILD_DIR)/gantw.res
		$(CC) $(CFLAGSW) $(LDFLAGS) -o $(DIST_DIR)/gantw.exe $(SOURCE_DIR)/batWrapperW.cpp $(BUILD_DIR)/gantw.res

mkdir:
	  mkdir $(BUILD_DIR)
		mkdir $(DIST_DIR)

clean:
		rm -rf $(BUILD_DIR)
