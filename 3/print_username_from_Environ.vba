Sub Document_Open()
	PrintCurrentUsername
End Sub

Sub PrintCurrentUsername()
	Dim username As String
	' Get the username from the environment variable
	username = Environ("USERNAME")
	' Print the username in a message box
	MsgBox "The current username is: " & username
End Sub
