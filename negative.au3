#include <APIGdiConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
;#include <GDIPlus.au3>
#include <GUIComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <SliderConstants.au3>
#include <StaticConstants.au3>
#include <WinAPIGdi.au3>
#include <WinAPIShPath.au3>
#include <WindowsConstants.au3>

Func negativo ($campo)


	Global $g_aDefault[11] = [20000, 20000, 20000, 4000, 10000, 0, 0, -100, 100, BitOR($CA_NEGATIVE, $CA_LOG_FILTER),0]

	Global $g_aAdjust = $g_aDefault

	_GDIPlus_Startup()

	Local $hObj, $hSrc, $W, $H, $sData

	$sData = $sFile2

	$hObj = _GDIPlus_ImageLoadFromFile($sData)
	If $hObj Then
		$hSrc = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hObj)

		$W = _GDIPlus_ImageGetWidth($hObj)
		$H = _GDIPlus_ImageGetHeight($hObj)
		_GDIPlus_ImageDispose($hObj)
;~ 		If $hSrc Then
;~ 			;MsgBox(4096, "if do hSrc", "nun sei ainda o que ocorre aqui")
;~ 		EndIf
	EndIf

	_SetBitmapAdjust($hPic, $hSrc, $g_aAdjust, $campo)
	GUICtrlSetData($hPic, "")
	_WinAPI_DeleteObject($hSrc)
	_GDIPlus_Shutdown()
EndFunc

Func _SetBitmapAdjust($hWnd, $hBitmap, $aAdjust = 0, $campo = 0)
	global $X_campo_i, $Y_campo_i, $X_data_i, $Y_data_i
    If Not IsHWnd($hWnd) Then
        global $hWnd = GUICtrlGetHandle($hWnd)
        If Not $hWnd Then
            Return 0
        EndIf
    EndIf

    Local $tAdjust = 0
    If IsArray($aAdjust) Then
        $tAdjust = _WinAPI_CreateColorAdjustment($aAdjust[9], $aAdjust[10], $aAdjust[0], $aAdjust[1], $aAdjust[2], $aAdjust[3], $aAdjust[4], $aAdjust[5], $aAdjust[6], $aAdjust[7], $aAdjust[8])
    EndIf
    $hBitmap = _WinAPI_AdjustBitmap($hBitmap, -1, -1, $HALFTONE, $tAdjust)
    If @error Then
        Return 0
    EndIf


    Local $hPrev = _SendMessage($hWnd, $STM_SETIMAGE, $IMAGE_BITMAP, $hBitmap)
    ;If $hPrev Then
        _WinAPI_DeleteObject($hPrev)
    ;EndIf

	_GDIPlus_Startup()
	Global $imagem = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap)
	Local $hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	if $campo = "campo_rg" then _GDIPlus_GraphicsDrawImageRectRect($hGraphic, $imagem, ($X_campo_i*3+$x*3)-10,(($Y_campo_i)-120-$posicao_x_load_fic+$y*2.5),470,80,10,30,470,80)

	if $campo = "campo_data" then _GDIPlus_GraphicsDrawImageRectRect($hGraphic, $imagem, (($X_data_i+$x_data)*3)-10,(($Y_data_i*1.6)+$y_data*2),470,80,10,130,470,80) ;enquadra campo DATA com o arquivo da imagem original
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_BitmapDispose($imagem)
	;MsgBox(4096, "a" , "a")
	_GDIPlus_Shutdown()

    ;$hPrev = _SendMessage($hWnd, $STM_GETIMAGE)
    ;If $hPrev <> $hBitmap Then
        _WinAPI_DeleteObject($hBitmap)
		_WinAPI_DeleteObject($tAdjust)
   ; EndIf
    Return 1
EndFunc   ;==>_SetBitmapAdjust
