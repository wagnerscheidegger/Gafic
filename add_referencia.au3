

#include "ScreenCapture.au3"

global $PosJanela[2],$console

Global $hGui_add_ref, $hMsg, $hHBitmap6, $hGraphic6, $hBitmap6, $zooing, $active = True
Global $hGraphic_add,$hPen, $width = 520, $height = 120, $aMousePos[4][2], $active = 0, $aOldMouse[2]
Global $hBitmap_add[4], $hBackbuffer[4], $hButtonLoad, $hButtonRemove, $hFile[4], $hButtonSave
Global $bPos[4][4], $ReturnBMP
Global $iGuiWidth = 550, $iGuiHeight = 350
Global $aBoxPosition[4][2] = [[10, 200],[420, 10],[10, 410],[420, 410]]
Global $aLimit[4][4] = [ _
        [$aBoxPosition[0][0], $aBoxPosition[0][1], $aBoxPosition[0][0] + $width, $aBoxPosition[0][1] + $height], _
        [$aBoxPosition[1][0], $aBoxPosition[1][1], $aBoxPosition[1][0] + $width, $aBoxPosition[1][1] + $height], _
        [$aBoxPosition[2][0], $aBoxPosition[2][1], $aBoxPosition[2][0] + $width, $aBoxPosition[2][1] + $height], _
        [$aBoxPosition[3][0], $aBoxPosition[3][1], $aBoxPosition[3][0] + $width, $aBoxPosition[3][1] + $height] _
        ]
global $hImage2
Global Const $tRECT = "0;0;800;200"



func form_referencia($tipo)

	Global $Title_add_ref = "Ferramente de Adição de Referência - G.A.FIC"
	Opt("GUIOnEventMode", 1) ;0=disabled, 1=OnEvent mode enabled
	;Opt("WinWaitDelay", 60000)
	local $margem_top = 310
	global $hGui_add_ref = GUICreate($Title_add_ref, $iGuiWidth, $iGuiHeight)
	GUISetOnEvent($GUI_EVENT_CLOSE, "_exit")
	global $Group1 = GUICtrlCreateGroup(" Selecione o tipo de Referencia ", 16, 344-$margem_top, 193, 153)
	global $G_zoom = GUICtrlCreateLabel(" Zoom ",300, 10, 40, 20)
	global $OptCamporg = GUICtrlCreateRadio("Campo RG", 32, 368-$margem_top, 73, 17)
	GUICtrlSetOnEvent($OptCamporg, "seleciona")

	global $OptCampodata = GUICtrlCreateRadio("Campo Data", 120, 368-$margem_top, 89, 17)
	GUICtrlSetOnEvent($OptCampodata, "seleciona")

	global $OptHifen = GUICtrlCreateRadio("Hífen", 32, 400-$margem_top, 65, 17)
	GUICtrlSetOnEvent($OptHifen, "seleciona")

	global $OptDatabarra = GUICtrlCreateRadio("Data /", 120, 400-$margem_top, 57, 17)
	GUICtrlSetOnEvent($OptDatabarra, "seleciona")

	global $OptNumero = GUICtrlCreateRadio("Numero", 32, 432-$margem_top, 65, 17)
	GUICtrlSetOnEvent($OptNumero, "seleciona")

	global $hButtonSave = GUICtrlCreateButton("Salvar", 72, 464-$margem_top, 75, 25)
	GUICtrlSetOnEvent($hButtonSave, "saveA")

	global $hButtonLoad = GUICtrlCreateButton("load image", 10, 315-$margem_top, 80, 20)
	GUICtrlSetOnEvent($hButtonLoad, "loadA")

	global $hButtonRemove = GUICtrlCreateButton("remove image", 90, 315-$margem_top, 80, 20)
	GUICtrlSetOnEvent($hButtonRemove, "removeA")

	global $TxtNumero = GUICtrlCreateCombo("", 100, 432-$margem_top, 35, 21, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
	GUICtrlSetData($TxtNumero, "0|1|2|3|4|5|6|7|8|9|X")
	GUICtrlSetOnEvent($TxtNumero, "seleciona")

	global $ChkNumero = GUICtrlCreateCheckbox("N/A", 156, 432-$margem_top, 65, 17)
	GUICtrlSetOnEvent($ChkNumero, "seleciona")

	GUICtrlCreateGroup("", -99, -99, 1, 1)

	if $tipo = "Fila" Then
		if $console = "Yes" then ConsoleWrite("Entrei no form_add_ref carregando o tipo Fila"& @CRLF)
		GUICtrlSetState($hButtonLoad, $GUI_HIDE)
		GUICtrlSetState($hButtonRemove, $GUI_HIDE)
		_GDIPlus_Startup()
		$hGraphic_add = _GDIPlus_GraphicsCreateFromHWND($hGui_add_ref)
		$hBitmap_add[0] = _GDIPlus_BitmapCreateFromGraphics($width, $height, $hGraphic_add)
		$hBackbuffer[0] = _GDIPlus_ImageGetGraphicsContext($hBitmap_add[0])

		$hPen = _GDIPlus_PenCreate()
		global $hPen2 = _GDIPlus_PenCreate(0xFFFF0000,1)
		_GDIPlus_GraphicsClear($hBackbuffer[0])

		global $sFile_add_ref = $sFile2
		$hFile[0] = _GDIPlus_ImageLoadFromFile($sFile_add_ref)
		$hImage2 = _GDIPlus_ImageGreyscale($hFile[0])
		$bPos[0][0] = _GDIPlus_ImageGetWidth($hFile[0])
		$bPos[0][1] = _GDIPlus_ImageGetHeight($hFile[0])
		$bPos[0][2] = 0
		$bPos[0][3] = 0
		if $console = "Yes" then ConsoleWrite('file[' & $sFile_add_ref & '] dimensão[' & $bPos[0][0] & ',' & $bPos[0][1] & ',' & $bPos[0][2] & ',' & $bPos[0][3] & ']' & @LF)

	EndIf

	if $tipo = "Adm" Then
		if $console = "Yes" then ConsoleWrite("Entrei no form_add_ref carregando o tipo ADM"& @CRLF)
		GUICtrlSetState($hButtonLoad, $GUI_Show)
		GUICtrlSetState($hButtonRemove, $GUI_SHOW)
		_GDIPlus_Startup()
		$hGraphic_add = _GDIPlus_GraphicsCreateFromHWND($hGui_add_ref)
		$hBitmap_add[0] = _GDIPlus_BitmapCreateFromGraphics($width, $height, $hGraphic_add)
		$hBackbuffer[0] = _GDIPlus_ImageGetGraphicsContext($hBitmap_add[0])

		$hPen = _GDIPlus_PenCreate()
		global $hPen2 = _GDIPlus_PenCreate(0xFFFF0000,1)
		_GDIPlus_GraphicsClear($hBackbuffer[0])

	EndIf
GUISetState()
	load_bases()

	getPos2()
if $tipo = "Fila" Then
	GUIDelete($hGui)
	GUIRegisterMsg($WM_COMMAND, "") ; habilita auto tabulação dos campos
	GUIRegisterMsg($WM_SYSCOMMAND, "")
EndIf

EndFunc

func looping()

	While 1
		;if $console = "Yes" then ConsoleWrite("Inicio da função Looping>While1"& @CRLF)
		 $aMousePos = GUIGetCursorInfo($hGui_add_ref)
		Select
			Case $aMousePos[0] >= $aLimit[0][0] And $aMousePos[0] <= $aLimit[0][2] And $aMousePos[1] >= $aLimit[0][1] And $aMousePos[1] <= $aLimit[0][3]
				;if $console = "Yes" then ConsoleWrite("Looping > case 1 'mouse dentro dos parametros' iniciando sleep 100"& @CRLF)
				;sleep(100)
				$active = 1
				_update()

				If $aMousePos[2] And $active And $hFile[0] Then
					;if $console = "Yes" then ConsoleWrite("Looping > case 1 'mouse precionado e ativado'"& @CRLF)
					$mosPos = GUIGetCursorInfo($hGui_add_ref);GUIGetCursorInfo($hGui)
					$iSubtractX = $mosPos[0] + $bPos[0][2]
					$iSubtractY = $mosPos[1] + $bPos[0][3]
					Do

						if $console = "Yes" then ConsoleWrite("Looping > case 1 'inicio do Do'"& @CRLF)
						$aMousePos = GUIGetCursorInfo($hGui_add_ref)
						$bPos[0][2] = $iSubtractX - $aMousePos[0]
						$bPos[0][3] = $iSubtractY - $aMousePos[1]
						_update()

					Until Not $aMousePos[2]
					if $console = "Yes" then ConsoleWrite("Looping > case 1 'Until ativado'"& @CRLF)

				EndIf

			Case $aMousePos[0] >= 0 and $aMousePos[0] <= $iGuiWidth and $aMousePos[1] >= 0 and $aMousePos[1] <= $iGuiHeight ;sai do looping clicando fora do campo
				;if $console = "Yes" then ConsoleWrite("Looping > case 2 'mouse dentro dos parametros 2'"& @CRLF)

				$active = 0
				_update()
				if $aMousePos[2] then
					if $console = "Yes" then ConsoleWrite("Looping > case 2 'mouse dentro dos parametros 2 e precionado, saindo do looping'"& @CRLF)
					ExitLoop
				EndIf


			case Else
				ExitLoop


		EndSelect
		$aOldMouse[0] = $aMousePos[0]
		$aOldMouse[1] = $aMousePos[1]
		;if $console = "Yes" then ConsoleWrite("Looping > 'final do While'"& @CRLF)
	WEnd

Endfunc


Func seleciona()

		if $console = "Yes" then ConsoleWrite("inicio função seleciona, executar função getPos2"& @CRLF)
		getPos2()

		_WinAPI_RedrawWindow($hGui_add_ref,$tRect,0,$RDW_INVALIDATE+$RDW_ERASE)
		_WinAPI_InvalidateRect($hGui_add_ref, $tRect, True)
		$active = True
		if $console = "Yes" then ConsoleWrite("seleciona > iniciando função _update"& @CRLF)
		_update()
		if $console = "Yes" then ConsoleWrite("seleciona > iniciando função looping"& @CRLF)
		looping()

EndFunc

Func getPos2()
	if $console = "Yes" then ConsoleWrite("inicio função getPos2"& @CRLF)
	Global $aPos = isArray(ControlGetPos($Title_add_ref, "", ""))
	$tPoint = DllStructCreate("int X;int Y")

	while isArray($aPos) = false
		$aPos = ControlGetPos($Title_add_ref, "", "")
		sleep(1)
	wend
	DllStructSetData($tPoint, "X", $aPos[0])
	DllStructSetData($tPoint, "Y", $aPos[1])

	_WinAPI_ClientToScreen(WinGetHandle(WinGetTitle($Title_add_ref)), $tPoint)

	$PosJanela[0] = DllStructGetData($tPoint, "X")
	$PosJanela[1] = DllStructGetData($tPoint, "Y")

	if $console = "Yes" then ConsoleWrite("executando função getPos() resultado: $PosJanela[0]: "&$PosJanela[0]&", $PosJanela[1]:"&$PosJanela[1]  & @CRLF)

EndFunc

Func draw()
if $console = "Yes" then ConsoleWrite("inicio função draw"& @CRLF)
	If BitAND(GUICtrlRead($OptHifen), $GUI_CHECKED) = $GUI_CHECKED Then
		if $console = "Yes" then ConsoleWrite("desenhando Hifen"& @CRLF)
		global $x_inicial = ($bPos[0][2]*-1)+400, $x_final = ($bPos[0][2]*-1)+432, $y_inicial = ($bPos[0][3]*-1)+45, $y_final = ($bPos[0][3]*-1)+62
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_inicial, $y_inicial, $x_final, $y_inicial, $hPen2)
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_inicial, $y_final, $x_final, $y_final, $hPen2)
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_inicial, $y_inicial, $x_inicial, $y_final, $hPen2)
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_final, $y_inicial, $x_final, $y_final, $hPen2)
	EndIf

	If BitAND(GUICtrlRead($OptNumero), $GUI_CHECKED) = $GUI_CHECKED Then
		if BitAND(GUICtrlRead($ChkNumero), $GUI_CHECKED) = $GUI_CHECKED then
			global $x_inicial = ($bPos[0][2]*-1)+390, $x_final = ($bPos[0][2]*-1)+419, $y_inicial = ($bPos[0][3]*-1)+25, $y_final = ($bPos[0][3]*-1)+62
			if $console = "Yes" then ConsoleWrite("desenhando Numero padrão antigo"& @CRLF)
		Else
			global $x_inicial = ($bPos[0][2]*-1)+390, $x_final = ($bPos[0][2]*-1)+408, $y_inicial = ($bPos[0][3]*-1)+25, $y_final = ($bPos[0][3]*-1)+62
			if $console = "Yes" then ConsoleWrite("desenhando Numero padrão novo"& @CRLF)
		EndIf

		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_inicial, $y_inicial, $x_final, $y_inicial, $hPen2)
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_inicial, $y_final, $x_final, $y_final, $hPen2)
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_inicial, $y_inicial, $x_inicial, $y_final, $hPen2)
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_final, $y_inicial, $x_final, $y_final, $hPen2)
	EndIf

	If BitAND(GUICtrlRead($OptCamporg), $GUI_CHECKED) = $GUI_CHECKED Then
		if $console = "Yes" then ConsoleWrite("desenhando campoRG"& @CRLF)
		global $x_inicial = ($bPos[0][2]*-1)+10, $x_final = ($bPos[0][2]*-1)+35, $y_inicial = ($bPos[0][3]*-1)+15, $y_final = ($bPos[0][3]*-1)+44
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_inicial, $y_inicial, $x_final, $y_inicial, $hPen2)
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_inicial, $y_final, $x_final, $y_final, $hPen2)
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_inicial, $y_inicial, $x_inicial, $y_final, $hPen2)
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_final, $y_inicial, $x_final, $y_final, $hPen2)

	EndIf

	If BitAND(GUICtrlRead($OptCampodata), $GUI_CHECKED) = $GUI_CHECKED Then
		if $console = "Yes" then ConsoleWrite("desenhando campoData"& @CRLF)
		global $x_inicial = ($bPos[0][2]*-1)+10, $x_final = ($bPos[0][2]*-1)+75, $y_inicial = ($bPos[0][3]*-1)+15, $y_final = ($bPos[0][3]*-1)+25
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_inicial, $y_inicial, $x_final, $y_inicial, $hPen2)
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_inicial, $y_final, $x_final, $y_final, $hPen2)
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_inicial, $y_inicial, $x_inicial, $y_final, $hPen2)
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_final, $y_inicial, $x_final, $y_final, $hPen2)

	EndIf

	If BitAND(GUICtrlRead($OptDatabarra), $GUI_CHECKED) = $GUI_CHECKED Then
		if $console = "Yes" then ConsoleWrite("desenhando dataBarra"& @CRLF)
		global $x_inicial = ($bPos[0][2]*-1)+90, $x_final = ($bPos[0][2]*-1)+119, $y_inicial = ($bPos[0][3]*-1)+25, $y_final = ($bPos[0][3]*-1)+62
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_inicial, $y_inicial, $x_final, $y_inicial, $hPen2)
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_inicial, $y_final, $x_final, $y_final, $hPen2)
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_inicial, $y_inicial, $x_inicial, $y_final, $hPen2)
		_GDIPlus_GraphicsDrawLine($hBackbuffer[0], $x_final, $y_inicial, $x_final, $y_final, $hPen2)
	EndIf
	if $console = "Yes" then ConsoleWrite("final função drwaw"& @CRLF)
EndFunc


Func _update()
	if $console = "Yes" then ConsoleWrite("executando update"& @CRLF)
	_GDIPlus_GraphicsClear($hBackbuffer[0], 0xF0FFFFFF)

	If BitAND(GUICtrlRead($OptNumero), $GUI_CHECKED) = $GUI_CHECKED or BitAND(GUICtrlRead($OptHifen), $GUI_CHECKED) = $GUI_CHECKED Then
		if $console = "Yes" then ConsoleWrite("_update > optNumero ou Hifen selecionado, desenhando zoom"& @CRLF)
		If $hFile[0] Then _GDIPlus_GraphicsDrawImageRectRect($hBackbuffer[0], $hImage2, 1270, 215, $bPos[0][0], $bPos[0][1], 0, 0, $bPos[0][0], $bPos[0][1])
	EndIf
	If BitAND(GUICtrlRead($OptDatabarra), $GUI_CHECKED) = $GUI_CHECKED Then
		if $console = "Yes" then ConsoleWrite("_update > optDatabarra selecionado, desenhando zoom"& @CRLF)
		If $hFile[0] Then _GDIPlus_GraphicsDrawImageRectRect($hBackbuffer[0], $hImage2, 1580, 820, $bPos[0][0], $bPos[0][1], 00, 0, $bPos[0][0], $bPos[0][1])
	EndIf
	If BitAND(GUICtrlRead($OptCamporg), $GUI_CHECKED) = $GUI_CHECKED Then
		if $console = "Yes" then ConsoleWrite("_update > optCamporg selecionado, desenhando zoom"& @CRLF)
		If $hFile[0] Then _GDIPlus_GraphicsDrawImageRectRect($hBackbuffer[0], $hImage2, 1200, 155, $bPos[0][0], $bPos[0][1], 0, 0, ($bPos[0][0]/3), ($bPos[0][1]/3))
	EndIf
	If BitAND(GUICtrlRead($OptCampodata), $GUI_CHECKED) = $GUI_CHECKED Then
		if $console = "Yes" then ConsoleWrite("_update > optCampodata selecionado, desenhando zoom"& @CRLF)
		If $hFile[0] Then _GDIPlus_GraphicsDrawImageRectRect($hBackbuffer[0], $hImage2, 1500, 700, $bPos[0][0], $bPos[0][1], 0, 0, ($bPos[0][0]/3), ($bPos[0][1]/3))
	EndIf

    If $active == 1 Then
		if $console = "Yes" then ConsoleWrite("_update > active = true executando função _box"& @CRLF)
		_box($hBackbuffer[0], 0, 0, $width - 1, $height - 1)

	EndIf

	if $console = "Yes" then ConsoleWrite("_update > executando função draw"& @CRLF)
	draw()
	If BitAND(GUICtrlRead($OptCampodata), $GUI_CHECKED) = $GUI_CHECKED or BitAND(GUICtrlRead($OptCamporg), $GUI_CHECKED) = $GUI_CHECKED or BitAND(GUICtrlRead($OptNumero), $GUI_CHECKED) = $GUI_CHECKED or BitAND(GUICtrlRead($OptHifen), $GUI_CHECKED) = $GUI_CHECKED or BitAND(GUICtrlRead($OptDatabarra), $GUI_CHECKED) = $GUI_CHECKED Then
		if $console = "Yes" then ConsoleWrite("_update > opt selecionado, executando zoom"& @CRLF)
		zoom()
		GUICtrlSetState($G_zoom,$GUI_SHOW)
	;Else
	;	GUICtrlSetState($Group2,$GUI_HIDE)
	EndIf

    _GDIPlus_GraphicsDrawImageRect($hGraphic_add, $hBitmap_add[0], $aBoxPosition[0][0], $aBoxPosition[0][1], $width, $height)

EndFunc   ;==>_update

func zoom()
	if $console = "Yes" then ConsoleWrite("executando zoom"& @CRLF)
	global $xinicio = $PosJanela[0]-$aPos[0]+$x_inicial+$aBoxPosition[0][0]+1, $yinicio = $PosJanela[1]-$aPos[1]+$y_inicial+$aBoxPosition[0][1]+1
	global $xfinal = $PosJanela[0]-$aPos[0]+$x_final+$aBoxPosition[0][0]-1, $yfinal = $PosJanela[1]-$aPos[1]+$y_final+$aBoxPosition[0][1]-1
	;MsgBox(0,"","$xinicio:"&$xinicio&",$yinicio:"&$yinicio&",$xfinal:"&$xfinal&",$yfinal:"&$yfinal)

		$hHBitmap6 = _ScreenCapture_Capture("",$xinicio,$yinicio,$xfinal,$yfinal, false)

		if $hBitmap6 = null Then
			Global $hBitmap6 = _GDIPlus_BitmapCreateFromHBITMAP($hHBitmap6)
		Else
			_GDIPlus_BitmapDispose($hBitmap6)
			Global $hBitmap6 = _GDIPlus_BitmapCreateFromHBITMAP($hHBitmap6)
		EndIf


	If $ReturnBMP Then Return $hBitmap6

	_GDIPlus_Startup()

	if $hGraphic6 = null Then
		Global $hGraphic6 = _GDIPlus_GraphicsCreateFromHWND($hGui_add_ref)
	Else
		_GDIPlus_GraphicsDispose($hGraphic6)
		Global $hGraphic6 = _GDIPlus_GraphicsCreateFromHWND($hGui_add_ref)
	EndIf


	$zooing = _GDIPlus_GraphicsDrawImageRectRect($hGraphic6, $hBitmap6, 0, 0,100,100,301,30,300,300)
	if $console = "Yes" then ConsoleWrite("zoom > final"& @CRLF)
EndFunc

Func loadA()
	if $console = "Yes" then ConsoleWrite("executando load"& @CRLF)
	global $sFile_add_ref = FileOpenDialog('choose a picture', @ScriptDir, '(*.jpg;*.bmp;*.png)', 1)
    $hFile[0] = _GDIPlus_ImageLoadFromFile($sFile_add_ref)
	$hImage2 = _GDIPlus_ImageGreyscale($hFile[0])
    $bPos[0][0] = _GDIPlus_ImageGetWidth($hFile[0])
    $bPos[0][1] = _GDIPlus_ImageGetHeight($hFile[0])
    $bPos[0][2] = 0
    $bPos[0][3] = 0
    if $console = "Yes" then ConsoleWrite('file[' & $sFile_add_ref & '] dimensão[' & $bPos[0][0] & ',' & $bPos[0][1] & ',' & $bPos[0][2] & ',' & $bPos[0][3] & ']' & @LF)
    _update()
EndFunc   ;==>loadA

Func removeA()
	if $console = "Yes" then ConsoleWrite("executando remove"& @CRLF)
    $hFile[0] = 0
    _GDIPlus_GraphicsClear($hBackbuffer[0], 0xF0FFFFFF)
EndFunc   ;==>removeA

Func saveA()
	if $console = "Yes" then ConsoleWrite("executando save"& @CRLF)
	getPos2()
	ConsoleWrite($posJanela[0] & ","& $PosJanela[1]& ","&$aPos[0]&","&$aPos[1])
	global $xinicio = $PosJanela[0]-$aPos[0]+$x_inicial+$aBoxPosition[0][0]+1, $yinicio = $PosJanela[1]-$aPos[1]+$y_inicial+$aBoxPosition[0][1]+1
	global $xfinal = $PosJanela[0]-$aPos[0]+$x_final+$aBoxPosition[0][0]-1, $yfinal = $PosJanela[1]-$aPos[1]+$y_final+$aBoxPosition[0][1]-1
	_update()
	$hHBitmap6 = _ScreenCapture_Capture("",$xinicio,$yinicio,$xfinal,$yfinal, false)

	;Global $hBitmap6 = _GDIPlus_BitmapCreateFromHBITMAP($hHBitmap6)
	;If $ReturnBMP Then Return $hBitmap6

		;_GDIPlus_Startup()

		;Local $hGUI6 = GUICreate("print_final", 350, 350)
		;GUISetState()

		;Global $hGraphic6 = _GDIPlus_GraphicsCreateFromHWND($hGUI6)
		;_GDIPlus_GraphicsDrawImage($hGraphic6, $hBitmap6, 0, 0)
	;_GDIPlus_ImageSaveToFile($hHBitmap6, @ScriptDir & "images\teste.png")

	If BitAND(GUICtrlRead($OptHifen), $GUI_CHECKED) = $GUI_CHECKED Then
		Local $referencia_path = $campo_RG_hifen_path
	EndIf
	If BitAND(GUICtrlRead($OptCamporg), $GUI_CHECKED) = $GUI_CHECKED Then
		Local $referencia_path = $campo_RG_path
	EndIf
	If BitAND(GUICtrlRead($OptCampodata), $GUI_CHECKED) = $GUI_CHECKED Then
		Local $referencia_path = $campo_data_path
	EndIf
	If BitAND(GUICtrlRead($OptDatabarra), $GUI_CHECKED) = $GUI_CHECKED Then
		Local $referencia_path = $campo_data_barra_path
	EndIf
	If BitAND(GUICtrlRead($OptNumero), $GUI_CHECKED) = $GUI_CHECKED Then
		if GUICtrlRead($TxtNumero, 1) = "" or GUICtrlRead($TxtNumero, 1) = Null Then
			MSGBOX(0,"Erro","Por favor digite o número da Referencia")
		EndIf
		if GUICtrlRead($TxtNumero, 1) = "x" or GUICtrlRead($TxtNumero, 1) = "X" Then
			$i = 10
		else
			$i = GUICtrlRead($TxtNumero, 1)
		EndIf
		if $mensagens = "Yes" then MsgBox(0,"","valor do $i: "&$i)
		Local $referencia_path = eval('digito_path'&$i)
		if $mensagens = "Yes" then Msgbox(0,"","referencia path: "&$referencia_path)
	EndIf

	if Not $referencia_path = "" Then

		for $j = 1000 To 1 Step -1
			if FileExists ($referencia_path&"\"&$j&".png") Then
				if $mensagens = "Yes" then MsgBox(0,"","o arquivo "&$referencia_path&"\"&$j&".png, já existe!")
				_ScreenCapture_SaveImage($referencia_path&"\"&$j+1&".png", $hHBitmap6)
				MsgBox(0,"","Referencia gravada como: "&$referencia_path&"\"&$j+1&".png")

				ExitLoop
			Elseif FileExists ($referencia_path&"\1.png") = False Then
				MsgBox(0,"","Referencia gravada como: "&$referencia_path&"\1.png")
				_ScreenCapture_SaveImage($referencia_path&"\1.png", $hHBitmap6)
				ExitLoop
			EndIf
		Next

		$bPos[0][2] = 0
		$bPos[0][3] = 0
	EndIf

	GUICtrlSetState($OptHifen, $GUI_UNCHECKED)
	GUICtrlSetState($OptCamporg, $GUI_UNCHECKED)
	GUICtrlSetState($OptCampodata, $GUI_UNCHECKED)
	GUICtrlSetState($OptDatabarra, $GUI_UNCHECKED)
	GUICtrlSetState($OptNumero, $GUI_UNCHECKED)
EndFunc


Func _box($hToGraphic, $xx, $yy, $ll, $aa)
	if $console = "Yes" then ConsoleWrite("executando box"& @CRLF)
    Local $aBox[5][2]
    $aBox[0][0] = 4
    $aBox[1][0] = $xx
    $aBox[1][1] = $yy
    $aBox[2][0] = $xx + $ll
    $aBox[2][1] = $yy
    $aBox[3][0] = $xx + $ll
    $aBox[3][1] = $yy + $aa
    $aBox[4][0] = $xx
    $aBox[4][1] = $yy + $aa
    _GDIPlus_GraphicsDrawPolygon($hToGraphic, $aBox)
EndFunc   ;==>_box

Func _exit()
	;If @GUI_WinHandle = $hGui_add_ref Then
		_GDIPlus_GraphicsDispose($hBackbuffer[0])
		If $hFile[0] Then _GDIPlus_ImageDispose($hFile[0])
		If $hImage2 Then _GDIPlus_ImageDispose($hImage2)
		_GDIPlus_BitmapDispose($hBitmap_add[0])
		_GDIPlus_BitmapDispose($hBitmap6)
		_GDIPlus_PenDispose($hPen)
		_GDIPlus_PenDispose($hPen2)
		_GDIPlus_GraphicsDispose($hGraphic_add)
		_GDIPlus_GraphicsDispose($hGraphic6)
		_GDIPlus_Shutdown()
		;global $sFile2 = $sFile_add_ref
		Global $pause = "No"
		GUIDelete($hGui_add_ref)
		Limpa_digitos()
		verifica_fila()
		if $fics_fila = "não" Then

		Else
			abre_lote("fila")

		EndIf

	;EndIf
EndFunc