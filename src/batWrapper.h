#include <windows.h>
#include <string>

bool endsWith(std::wstring const &str, std::wstring const &suffix) {
    if (str.length() >= suffix.length()) {
        return (str.compare(str.length() - suffix.length(), suffix.length(), suffix) == 0);
    } else {
        return false;
    }
}

void replaceExeWithBat(std::wstring &command) {
    if (endsWith(command, L".exe")) {
        command[command.length()-3] = 'b';
        command[command.length()-2] = 'a';
        command[command.length()-1] = 't';
    } else {
        command = command + L".bat";
    }
}

std::wstring createArgsString(int argCount, LPWSTR* argList) {
    std::wstring args = L"";
    for (int i = 1; i < argCount; i++) {
        args = args + L" " + argList[i];
    }
    return args;
}
