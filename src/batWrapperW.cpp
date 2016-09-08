#include "batWrapper.h"

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE prevInstance, LPSTR lpCmdLine, int nShowCmd) {
    int argCount;
    LPWSTR* argList = CommandLineToArgvW(GetCommandLineW(), &argCount);
    if (argList != NULL) {
        std::wstring command = argList[0];
        if (command[command.length()-5] == 'w') {
            command.erase(command.end()-5, command.end()-5);
        }
        replaceExeWithBat(command);
        std::wstring args = createArgsString(argCount, argList);
        int hInstance = (int) ShellExecuteW(NULL, L"open", command.c_str(), args.c_str(), NULL, SW_HIDE);
        LocalFree(argList);
        return hInstance <= 32 ? 1 : 0;
    } else {
        MessageBoxW(NULL, L"Unable to parse command line", L"Error", MB_ICONERROR);
        return 1;
    }
}
