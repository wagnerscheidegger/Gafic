#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
    Local $hGUI, $ahIcons[2], $hStatus
    Local $aParts[2] = [200, 250]

    ; Create GUI
    $hGUI = GUICreate("(Example 1) StatusBar Set Text", 400, 300)
    $hStatus = _GUICtrlStatusBar_Create($hGUI)

  ;  ; Create memo control
   ; $g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
    ;GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
    GUISetState(@SW_SHOW)

    ; Set parts
    _GUICtrlStatusBar_SetParts($hStatus, $aParts)
    _GUICtrlStatusBar_SetText($hStatus, "Part 1")
    _GUICtrlStatusBar_SetText($hStatus, "Part 2", 1)

    ; Set icons
    ;$ahIcons[0] = _WinAPI_LoadShell32Icon(23)
    ;$ahIcons[1] = _WinAPI_LoadShell32Icon(40)
	;_GUICtrlStatusBar_SetIcon($hStatus, 0, $ahIcons[0])
    ;_GUICtrlStatusBar_SetIcon($hStatus, 1, $ahIcons[1])

    ; Show part text
    ;MemoWrite("Part 1 text ........: " & _GUICtrlStatusBar_GetText($hStatus, 0))
    ;MemoWrite("Part 2 text ........: " & _GUICtrlStatusBar_GetText($hStatus, 1))

    ; Show icon handles
    ;MemoWrite("Part 1 icon handle .: 0x" & Hex(_GUICtrlStatusBar_GetIcon($hStatus, 0)))
    ;MemoWrite("Part 2 icon handle .: 0x" & Hex(_GUICtrlStatusBar_GetIcon($hStatus, 1)))

    ; Loop until the user exits.
    ;Do
    ;Until GUIGetMsg() = $GUI_EVENT_CLOSE
    ; Free icons
    ;_WinAPI_DestroyIcon($ahIcons[0])
    ;_WinAPI_DestroyIcon($ahIcons[1])
    ;GUIDelete()
EndFunc   ;==>Example

; Write message to memo
Func MemoWrite($sMessage = "")
    GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc