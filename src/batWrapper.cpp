#include "batWrapper.h"

bool endsWith(std::string const &str, std::string const &suffix) {
    if (str.length() >= suffix.length()) {
        return (str.compare(str.length() - suffix.length(), suffix.length(), suffix) == 0);
    } else {
        return false;
    }
}

void replaceExeWithBat(std::string &command) {
    if (endsWith(command, ".exe")) {
        command[command.length()-3] = 'b';
        command[command.length()-2] = 'a';
        command[command.length()-1] = 't';
    } else {
        command = command + ".bat";
    }
}

int main(int argc, char** argv) {
    std::string command = argv[0];
    replaceExeWithBat(command);
    for (int i = 1; i < argc; i++) {
        command = command + " " + argv[i];
    }
    return system(command.c_str());
}

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE prevInstance, LPSTR lpCmdLine, int nShowCmd) {
    int argCount;
    LPWSTR* argList = CommandLineToArgvW(GetCommandLineW(), &argCount);
    if (argList != NULL) {
        std::wstring command = argList[0];
        replaceExeWithBat(command);
        std::wstring args = createArgsString(argCount, argList);
        int hInstance = (int) ShellExecuteW(GetConsoleWindow(), L"open", command.c_str(), args.c_str(), NULL, SW_SHOW);
        LocalFree(argList);
        return hInstance <= 32 ? 1 : 0;
    } else {
        MessageBoxW(NULL, L"Unable to parse command line", L"Error", MB_ICONERROR);
        return 1;
    }
}
