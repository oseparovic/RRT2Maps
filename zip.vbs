'Get command-line arguments and translate to absolute paths.
Set fso = CreateObject("Scripting.FileSystemObject")
InputFolder = fso.GetAbsolutePathName(WScript.Arguments.Item(0))
ZipFile     = fso.GetAbsolutePathName(WScript.Arguments.Item(1))

'Create empty ZIP file.
fso.CreateTextFile(ZipFile, True).Write Chr(80) & Chr(75) & Chr(5) & Chr(6) & String(18, 0)

'Set up the source folder and zip file
Set sa = CreateObject("Shell.Application")
Set source = sa.NameSpace(InputFolder)
Set zip    = sa.NameSpace(ZipFile)

'Start the asynchronous copy operation
zip.CopyHere(source.Items)

'Continue copying until the zip contains all of the source files. Needed due to asynchronous nature of CopyHere
Do Until source.Items.Count <= zip.Items.Count
	wScript.Sleep(200)
Loop
