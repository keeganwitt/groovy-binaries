rmdir build /s /q
mkdir build

sed -e "s|_name_|groovy|" src\res\template.rc | sed -e "s|_icon_|src/res/groovy|" > build\groovy.rc
windres build\groovy.rc -O coff build\groovy.res

sed -e "s|_name_|groovyw|" src\res\template.rc | sed -e "s|_icon_|src/res/groovy|" > build\groovyw.rc
windres build\groovyw.rc -O coff build\groovyw.res

sed -e "s|_name_|groovyConsole|" src\res\template.rc | sed -e "s|_icon_|src/res/groovy|" > build\groovyConsole.rc
windres build\groovyConsole.rc -O coff build\groovyConsole.res

sed -e "s|_name_|groovyc|" src\res\template.rc | sed -e "s|_icon_|src/res/groovy|" > build\groovyc.rc
windres build\groovyc.rc -O coff build\groovyc.res

sed -e "s|_name_|groovysh|" src\res\template.rc | sed -e "s|_icon_|src/res/groovy|" > build\groovysh.rc
windres build\groovysh.rc -O coff build\groovysh.res

sed -e "s|_name_|java2groovy|" src\res\template.rc | sed -e "s|_icon_|src/res/groovy|" > build\java2groovy.rc
windres build\java2groovy.rc -O coff build\java2groovy.res

sed -e "s|_name_|grape|" src\res\template.rc | sed -e "s|_icon_|src/res/groovy|" > build\grape.rc
windres build\grape.rc -O coff build\grape.res

sed -e "s|_name_|gant|" src\res\template.rc | sed -e "s|_icon_|src/res/gant|" > build\gant.rc
windres build\gant.rc -O coff build\gant.res

sed -e "s|_name_|gantw|" src\res\template.rc | sed -e "s|_icon_|src/res/gant|" > build\gantw.rc
windres build\gantw.rc -O coff build\gantw.res

mingw32-make
