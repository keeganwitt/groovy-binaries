#include <windows.h>
#include <string>

using namespace std;

int main(int argc, char** argv) {
    string command = argv[0];
    command[command.length()-3] = 'b';
    command[command.length()-2] = 'a';
    command[command.length()-1] = 't';
    for (int i = 1; i < argc; i++) {
        command = command + " " + argv[i];
    }
    return system(command.c_str());
}

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE prevInstance, LPSTR lpCmdLine, int nShowCmd) {
    int argCount;
    LPWSTR* argList = CommandLineToArgvW(GetCommandLineW(), &argCount);
    if (argList != NULL) {
        wstring command = argList[0];
        command[command.length()-3] = 'b';
        command[command.length()-2] = 'a';
        command[command.length()-1] = 't';
        wstring args = L"";
        for (int i = 1; i < argCount; i++) {
            args = args + L" " + argList[i];
        }
        int hInstance = (int) ShellExecuteW(GetConsoleWindow(), L"open", command.c_str(), args.c_str(), NULL, SW_SHOW);
        LocalFree(argList);
        return hInstance <= 32 ? 1 : 0;
     } else {
        MessageBoxW(NULL, L"Unable to parse command line", L"Error", MB_ICONERROR);
        return 1;
     }
}
