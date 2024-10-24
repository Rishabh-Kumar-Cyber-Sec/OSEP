Declare PtrSafe Sub tryhard Lib "Kernel32" Alias "Sleep" (ByVal myArg1 As Long)
Sub Try()
	'Now is used for printing Current time
	'Debug.Print "Printing something before sleep call: " & Now
	MsgBox ("Printing before sleep: " & Now)
	'5000 milliseconds = 5 seconds
	tryhard 5000
	MsgBox ("Printing after sleep: " & Now)
	'Debug.Print "Printing something after sleep call: " & Now
End Sub
