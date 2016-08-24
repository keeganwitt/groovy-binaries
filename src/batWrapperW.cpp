#include <windows.h>
#include <string>

using namespace std;

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE prevInstance, LPSTR lpCmdLine, int nShowCmd) {
    int argCount;
    LPWSTR* argList = CommandLineToArgvW(GetCommandLineW(), &argCount);
    if (argList != NULL) {
        wstring command = argList[0];
        if (command[command.length()-5] == 'w') {
            command.erase(command.end()-5, command.end()-5);
        }
        command[command.length()-3] = 'b';
        command[command.length()-2] = 'a';
        command[command.length()-1] = 't';
        wstring args = L"";
        for (int i = 1; i < argCount; i++) {
            args = args + L" " + argList[i];
        }
        int hInstance = (int) ShellExecuteW(NULL, L"open", command.c_str(), args.c_str(), NULL, SW_HIDE);
        LocalFree(argList);
        return hInstance <= 32 ? 1 : 0;
     } else {
        MessageBoxW(NULL, L"Unable to parse command line", L"Error", MB_ICONERROR);
        return 1;
     }
}
