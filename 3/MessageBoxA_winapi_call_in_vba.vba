Private Declare PtrSafe Function msgb Lib "User32.dll" Alias "MessageBoxA" (ByVal hWnd As LongPtr, ByVal lpText As String, ByVal lpCaption As String, ByVal uType As Long) As Long

Sub Document_Open()
	MyMacro
End Sub
Function MyMacro()
	Dim res As Long

	Dim par2 As String
	Dim par3 As String
	par2 = "WinApi from VBA for OSEP prep"
	par3 = "Just Something"
	res = msgb(0, par2, par3, vbExclaimation)    
End Function
