CC=g++
CFLAGS=-Wall -O3 -m32
CFLAGSW=$(CFLAGS) -mwindows
LDFLAGS=-static-libgcc -static-libstdc++
OUT_DIR=build/dist

default: clean groovy.exe groovyw.exe groovyConsole.exe groovyc.exe groovysh.exe java2groovy.exe grape.exe gant.exe gantw.exe

groovy.exe: mkdir
		$(CC) $(CFLAGS) $(LDFLAGS) -o $(OUT_DIR)/groovy.exe src/batWrapper.cpp build/groovy.res

groovyw.exe: mkdir
		$(CC) $(CFLAGSW) $(LDFLAGS) -o $(OUT_DIR)/groovyw.exe src/batWrapperW.cpp build/groovyw.res

groovyConsole.exe: mkdir
		$(CC) $(CFLAGSW) $(LDFLAGS) -o $(OUT_DIR)/groovyConsole.exe src/batWrapperW.cpp build/groovyConsole.res

groovyc.exe: mkdir
		$(CC) $(CFLAGS) $(LDFLAGS) -o $(OUT_DIR)/groovyc.exe src/batWrapper.cpp build/groovyc.res

groovysh.exe: mkdir
		$(CC) $(CFLAGS) $(LDFLAGS) -o $(OUT_DIR)/groovysh.exe src/batWrapper.cpp build/groovysh.res

java2groovy.exe: mkdir
		$(CC) $(CFLAGS) $(LDFLAGS) -o $(OUT_DIR)/java2groovy.exe src/batWrapper.cpp build/java2groovy.res

grape.exe: mkdir
		$(CC) $(CFLAGS) $(LDFLAGS) -o $(OUT_DIR)/grape.exe src/batWrapper.cpp build/grape.res

gant.exe: mkdir
		$(CC) $(CFLAGS) $(LDFLAGS) -o $(OUT_DIR)/gant.exe src/batWrapper.cpp build/gant.res

gantw.exe: mkdir
		$(CC) $(CFLAGSW) $(LDFLAGS) -o $(OUT_DIR)/gantw.exe src/batWrapperW.cpp build/gantw.res

mkdir:
		mkdir -p $(OUT_DIR)

clean:
		rm -rf $(OUT_DIR)
