

#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
    ; Create a constant variable in Local scope of the filepath that will be read/written to.
    Local Const $sFilePath = @ScriptDir&"\Config.ini" ; Declara o local do arquivo INI

    ; Grava os dados no arquivo INI
    ;Local $sSection = "Title=AutoIt" & @LF & "Version=" & @AutoItVersion & @LF & "OS=" & @OSVersion

    ; Cria a sessão chamada 'General' no arquivo INI.
    ;IniWriteSection($sFilePath, "General", $sSection)

    ; Lê o arquivo INI e cria uma ARRAY com dois niveis, sendo o primeiro a KEY e o segundo o valor da KEY
    Local $aArray = IniReadSection($sFilePath, "Servidor")

    ; Check if an error occurred.
    If Not @error Then
        ; Enumerate through the array displaying the keys and their respective values.
        For $i = 1 To $aArray[0][0]
            MsgBox($MB_SYSTEMMODAL, "", "Key: " & $aArray[$i][0] & @CRLF & "Value: " & $aArray[$i][1])
        Next
    EndIf

    ; Delete the INI file.
    ;FileDelete($sFilePath)
EndFunc   ;==>Example

