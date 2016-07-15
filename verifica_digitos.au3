
#include <WinAPI.au3>

#include "ImageSearch.au3"

Func getPos()

	Global $aPos = isArray(ControlGetPos($Title1, "", ""))
	$tPoint = DllStructCreate("int X;int Y")

	while isArray($aPos) = false
		$aPos = ControlGetPos($Title1, "", "")
		sleep(1)
	wend
	DllStructSetData($tPoint, "X", $aPos[0])
	DllStructSetData($tPoint, "Y", $aPos[1])

	_WinAPI_ClientToScreen(WinGetHandle(WinGetTitle($Title1)), $tPoint)

	$PosJanela[0] = DllStructGetData($tPoint, "X")
	$PosJanela[1] = DllStructGetData($tPoint, "Y")

	if $console = "Yes" then ConsoleWrite("Função verifica_digitos() > executando função getPos() resultado: $PosJanela[0]: "&$PosJanela[0]&", $PosJanela[1]:"&$PosJanela[1]  & @CRLF)

EndFunc



Func _captura_tela($iLeft = 0, $iTop = 0, $iRight = 700, $iBottom = 500, $ReturnBMP = False)
	_GDIPlus_BitmapDispose($hBitmap)
	_WinAPI_DeleteObject($hHBitmap)
	;getPos()
	$hHBitmap = _ScreenCapture_Capture("", $iLeft+$PosJanela[0], $iTop+$PosJanela[1], $iRight+$PosJanela[0]+680, $iBottom+$PosJanela[1]+500,false)
	if $hHBitmap <> null then
		Global $hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hHBitmap)
		If $ReturnBMP Then Return $hBitmap
		if $console = "Yes" then ConsoleWrite("Função verifica_digitos() > executando função _captura_tela resultado: $hBitmap"  & @CRLF)
	Else
		$hHBitmap = _ScreenCapture_Capture("", $iLeft+$PosJanela[0], $iTop+$PosJanela[1], $iRight+$PosJanela[0]+680, $iBottom+$PosJanela[1]+500,false)
		Global $hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hHBitmap)
		If $ReturnBMP Then Return $hBitmap
		if $console = "Yes" then ConsoleWrite("Função verifica_digitos() > executando função _captura_tela resultado: $hBitmap"  & @CRLF)
	EndIf

EndFunc

Func _captura_tela_campo_RG($iLeft = 0, $iTop = 0, $iRight = 700, $iBottom = 700, $ReturnBMP = False)
	_GDIPlus_BitmapDispose($hBitmap)
	_WinAPI_DeleteObject($hHBitmap)
	getPos()
	$hHBitmap = _ScreenCapture_Capture("", $iLeft+$PosJanela[0], $iTop+$PosJanela[1], $iRight+$PosJanela[0]+$x, $iBottom+$PosJanela[1]+$y,false)
	if $hHBitmap <> Null then
		Global $hBitmap_campo_RG = _GDIPlus_BitmapCreateFromHBITMAP($hHBitmap)
		If $ReturnBMP Then Return $hBitmap_campo_RG
		if $console = "Yes" then ConsoleWrite("Função verifica_digitos() > executando função _captura_tela_campo_RG resultado: $hBitmap_campo_RG"  & @CRLF)
	Else
		$hHBitmap = _ScreenCapture_Capture("", $iLeft+$PosJanela[0], $iTop+$PosJanela[1], $iRight+$PosJanela[0]+$x, $iBottom+$PosJanela[1]+$y,false)
		Global $hBitmap_campo_RG = _GDIPlus_BitmapCreateFromHBITMAP($hHBitmap)
		If $ReturnBMP Then Return $hBitmap_campo_RG
		if $console = "Yes" then ConsoleWrite("Função verifica_digitos() > executando função _captura_tela_campo_RG resultado: $hBitmap_campo_RG"  & @CRLF)
	EndIf

EndFunc

Func _captura_tela_campo_RG_hifen($iLeft = 0, $iTop = 0, $iRight = 700, $iBottom = 700, $ReturnBMP = False)

	;if $console = "Yes" then ConsoleWrite("Função verifica_digitos() > _captura_tela_campo_RG_hifen > $hBitmap_campo_RG_hifen > _GDIPlus_BitmapDispose($hBitmap)"  & @CRLF)
	_WinAPI_DeleteObject($hHBitmap)

	if $console = "Yes" then ConsoleWrite("Função verifica_digitos() > _captura_tela_campo_RG_hifen > $hBitmap_campo_RG_hifen > _WinAPI_DeleteObject($hHBitmap)"  & @CRLF)
	;getPos()
	$hHBitmap = _ScreenCapture_Capture("", $iLeft+$PosJanela[0], $iTop+$PosJanela[1], $iRight+$PosJanela[0]+$x, $iBottom+$PosJanela[1]+$y,false)
	if $console = "Yes" then ConsoleWrite("Função verifica_digitos() > _captura_tela_campo_RG_hifen > $hBitmap_campo_RG_hifen > $hHBitmap = _ScreenCapture_Capture('', "&$iLeft+$PosJanela[0]&","& $iTop+$PosJanela[1]&","& $iRight+$PosJanela[0]+$x&","& $iBottom+$PosJanela[1]+$y&",false)"  & @CRLF)
	Global $hBitmap_campo_RG_hifen = _GDIPlus_BitmapCreateFromHBITMAP($hHBitmap)
	if $console = "Yes" then ConsoleWrite("Função verifica_digitos() > _captura_tela_campo_RG_hifen > $hBitmap_campo_RG_hifen > Global $hBitmap_campo_RG_hifen = _GDIPlus_BitmapCreateFromHBITMAP($hHBitmap)"  & @CRLF)
	If $ReturnBMP Then Return $hBitmap_campo_RG_hifen
	if $console = "Yes" then ConsoleWrite("Função verifica_digitos() > executando função _captura_tela_campo_RG_hifen resultado: $hBitmap_campo_RG_hifen"  & @CRLF)
EndFunc

Func procura_campo_RG()
	Global $y = 0, $x = 0
	Global $X_campo_i = 400, $Y_campo_i = $posicao_x_load_fic+215
	Global $X_campo_f = 600, $Y_campo_f = $posicao_x_load_fic+320
	_captura_tela_campo_RG($X_campo_i,$Y_campo_i-50,$X_campo_f,$Y_campo_f)

	if $debug = "Yes" Then
	;================== mostra retangulo de busca =================
	_GDIPlus_Startup ()

	local $hDC_d = _WinAPI_GetWindowDC(0)
	local $hGraphic_d = _GDIPlus_GraphicsCreateFromHDC($hDC_d)
	local $Color = 0xFFff0000
	local $hPen = _GDIPlus_PenCreate($Color,2)
	local $x_inicial = $PosJanela[0]+$X_campo_i
	local $x_final = $PosJanela[0]+$X_campo_f
	local $y_inicial = $PosJanela[1]+$Y_campo_i-50
	local $y_final = $PosJanela[1]+$Y_campo_f

	;For $t = 0 to 300
	_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_final, $y_inicial, $hPen)
	_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_inicial, $y_final, $hPen)
	_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_final, $x_final, $y_final, $hPen)
	_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_final, $y_inicial, $x_final, $y_final, $hPen)
	$Color += Hex(2)
	_GDIPlus_PenSetColor($hPen, $Color)
	;;Next
	;===================== fim mostra retangulo de busca =====================
	EndIf

For $i = 1 to $total_imagens_campo Step 1

			If FileExists ($campo_RG[$i]) Then

				Local $search = _ImageSearchArea($campo_RG[$i], 0, 0, 0, 150, 150, $x, $y, $Tolerancia_campo)

				If $search > 0 Then
					;MsgBox(0,"", "achei o campo x: "  & $x & " y: " &$y & " imagem: "&$campo_RG[$i] &" X_rel"&$PosJanela[0]+$X_campo_i+$x&" "&$X_campo_i+$x&" Y_rel"&$PosJanela[1]+$Y_campo_i+$y&" "&$Y_campo_i+$y )

					;local $X_campo_captura_i = $PosJanela[0]+$X_campo_i+$x, $Y_campo_captura_i = $PosJanela[1]+$Y_campo_i+$y

					;_captura_tela_campo_RG_final($X_campo_captura_i,$Y_campo_captura_i,$X_campo_captura_i+150,$Y_campo_captura_i+50)

					;_GDIPlus_Startup()

					;Local $hGUI = GUICreate("print_final", 350, 350)
					;GUISetState()

					;Global $hGraphic3 = _GDIPlus_GraphicsCreateFromHWND($hGUI)
					;_GDIPlus_GraphicsDrawImage($hGraphic3, $hBitmap_campo_RG, 0, 0)

					;ToolTip($campo_RG[$i]) ;===========================================================mostra referencia encontrada no campo RG

					global $achou_campo = "Sim"
					;ToolTip("imagem "&$campo_RG[$i]&", encontrada na verificação 1")
					if $console = "Yes" then ConsoleWrite("+Função verifica_digitos() > executando procura_campo_RG() resultado: $achou_campo = 'Sim'"  & @CRLF)
					ExitLoop(1)
				Else
					Local $search = _ImageSearchArea($campo_RG[$i], 0, 0, 0, 150, 150, $x, $y, $Tolerancia_campo+15)

					If $search > 0 Then
						global $achou_campo = "Sim"
						;ToolTip("imagem "&$campo_RG[$i]&", encontrada na verificação 2")
						if $console = "Yes" then ConsoleWrite("+Função verifica_digitos() > executando procura_campo_RG() 2 verificação resultado: $achou_campo = 'Sim'"  & @CRLF)
						ExitLoop(1)
					Else

						$search=0
						;MsgBox(0,"", "nao achei a imagem"&$i+1)
						global $achou_campo = "Não"
						;if $console = "Yes" then ConsoleWrite("Função verifica_digitos() > executando procura_campo_RG() resultado: $achou_campo = 'Não'"  & @CRLF)
						global $erro_descricao = "Campo RG não encontrado"
						;_GDIPlus_Startup()
						;Local $hGUI = GUICreate("busca campo RG", 250, 150)
						;GUISetState()
						;Local $hGraphic2 = _GDIPlus_GraphicsCreateFromHWND($hGUI)
						;_GDIPlus_GraphicsDrawImage($hGraphic2, $hBitmap_campo_RG, 0, 0)
					EndIf

				EndIf
			EndIf
Next

EndFunc

Func procura_campo_RG_hifen()
	Global $y_hifen = 0, $x_hifen = 0
	Global $X_hifen_i = 380, $Y_hifen_i = $posicao_x_load_fic
	Global $X_hifen_f = 480, $Y_hifen_f = $posicao_x_load_fic+40
	if $console = "Yes" then ConsoleWrite("Função verifica_digitos() > verifica_modelo_fic() > procura_campo_RG_hifen()"  & @CRLF)
	_captura_tela_campo_RG_hifen($X_hifen_i-10,$Y_hifen_i-25,$X_hifen_f,$Y_hifen_f)
	if $console = "Yes" then ConsoleWrite("Função verifica_digitos() > verifica_modelo_fic() > procura_campo_RG_hifen()> _captura_tela_campo_RG_hifen("&$X_hifen_i-10&","&$Y_hifen_i-25&","&$X_hifen_f&","&$Y_hifen_f&")"  & @CRLF)
	if $debug = "Yes" Then

	;_GDIPlus_Startup()
	;Local $hGUI = GUICreate("busca hifen", 250, 150,0,0)
	;GUISetState()
	;Local $hGraphic2 = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	;_GDIPlus_GraphicsDrawImage($hGraphic2, $hBitmap_campo_RG_hifen, 0, 0)

	;================== mostra retangulo de busca =================
	;_GDIPlus_Startup ()

	;local $hDC_d = _WinAPI_GetWindowDC(0)
	;local $hGraphic_d = _GDIPlus_GraphicsCreateFromHDC($hDC_d)
	;local $Color = 0xFFffFFF00
	;local $hPen = _GDIPlus_PenCreate($Color,2)
	;local $x_inicial = $PosJanela[0]+$X_hifen_i-10
	;local $x_final = $PosJanela[0]+$X_hifen_f
	;local $y_inicial = $PosJanela[1]+$Y_hifen_i-25
	;local $y_final = $PosJanela[1]+$Y_hifen_f

	;;For $t = 0 to 300
	;_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_final, $y_inicial, $hPen)
	;_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_inicial, $y_final, $hPen)
	;_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_final, $x_final, $y_final, $hPen)
	;_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_final, $y_inicial, $x_final, $y_final, $hPen)
	;$Color += Hex(2)
	;_GDIPlus_PenSetColor($hPen, $Color)
	;;Next
	;===================== fim mostra retangulo de busca =====================
	EndIf


	For $i = 1 to $total_imagens_hifen Step 1
		If FileExists ($campo_RG_hifen[$i]) Then
			Local $search2 = _ImageSearchArea("*TransBlack " &$campo_RG_hifen[$i], 0, 0, 0, 300, 200, $x_hifen, $y_hifen, $Tolerancia_hifen)
			If $search2 > 0 Then

				global $modelo_fic = "Antigo"
				if $console = "Yes" then ConsoleWrite("+Função verifica_digitos() > executando procura_campo_RG_hifen() assumindo: $modelo_fic = 'Antigo' = arquivo:"& $campo_RG_hifen[$i] & @CRLF)
				;MsgBox(0,"", "achei o hifen: "  & $x_hifen & " y: " &$y_hifen & " imagem: "&$campo_RG_hifen[$i] &" X_rel"&$PosJanela[0]+$X_hifen_i-10+$x_hifen&" "&$X_hifen_i+$x_hifen&" Y_rel"&$PosJanela[1]+$Y_hifen_i-25+$y_hifen&" "&$Y_hifen_i+$y_hifen)
				;MsgBox(0,"Fic Antiga", "Modelo de FIC antigo encontrado!",1)
				_GDIPlus_BitmapDispose($hBitmap_campo_RG_hifen)
				ExitLoop(1)

			Else
				Local $search2 = _ImageSearchArea("*TransBlack " &$campo_RG_hifen[$i], 0, 0, 0, 300, 200, $x_hifen, $y_hifen, $Tolerancia_hifen+15)
				If $search2 > 0 Then

					global $modelo_fic = "Antigo"
					if $console = "Yes" then ConsoleWrite("+Função verifica_digitos() > executando procura_campo_RG_hifen() verificação 2, assumindo: $modelo_fic = 'Antigo' = arquivo:"& $campo_RG_hifen[$i] & @CRLF)
					;MsgBox(0,"", "achei o hifen: "  & $x_hifen & " y: " &$y_hifen & " imagem: "&$campo_RG_hifen[$i] &" X_rel"&$PosJanela[0]+$X_hifen_i-10+$x_hifen&" "&$X_hifen_i+$x_hifen&" Y_rel"&$PosJanela[1]+$Y_hifen_i-25+$y_hifen&" "&$Y_hifen_i+$y_hifen)
					;MsgBox(0,"Fic Antiga", "Modelo de FIC antigo encontrado!",1)
					_GDIPlus_BitmapDispose($hBitmap_campo_RG_hifen)
					ExitLoop(1)
				Else

					$search2=0
					;MsgBox(0,"", "nao achei a imagem"&$i+1)
					global $modelo_fic = "Novo"
					;if $console = "Yes" then ConsoleWrite("Função verifica_digitos() > executando procura_campo_RG_hifen() assumindo: $modelo_fic = 'Novo'"  & @CRLF)
				endif

			EndIf
		EndIf
	Next

EndFunc



Func verifica_modelo_fic()
	if $console = "Yes" then ConsoleWrite("Função verifica_digitos() > executando verifica_modelo_fic() > executando procura_campo_RG_hifen()"  & @CRLF)
	procura_campo_RG_hifen()

If $modelo_fic = "Novo" Then

	; margens para padrão novo de fic
	Global $margem_x = 7, $margem_y = 20

	Global $1_digito_x = $margem_x + 90, $1_digito_y = $margem_y + 40
	Global $2_digito_x = $margem_x + 110, $2_digito_y = $margem_y + 40
	Global $3_digito_x = $margem_x + 140, $3_digito_y = $margem_y + 40
	Global $4_digito_x = $margem_x + 155, $4_digito_y = $margem_y + 40
	Global $5_digito_x = $margem_x + 175, $5_digito_y = $margem_y + 40
	Global $6_digito_x = $margem_x + 200, $6_digito_y = $margem_y + 40
	Global $7_digito_x = $margem_x + 220, $7_digito_y = $margem_y + 40
	Global $8_digito_x = $margem_x + 240, $8_digito_y = $margem_y + 40
	Global $9_digito_x = $margem_x + 270, $9_digito_y = $margem_y + 40

	global $tamanho_digito_x = 30
	global $tamanho_digito_y = 80

	Global $Tolerancia[11] ; Tolerancia para cada digito
	$Tolerancia[0] = 225;175
	$Tolerancia[1] = 225;175
	$Tolerancia[2] = 225;175
	$Tolerancia[3] = 225;175
	$Tolerancia[4] = 225;175
	$Tolerancia[5] = 225;175
	$Tolerancia[6] = 225;175
	$Tolerancia[7] = 225;175
	$Tolerancia[8] = 225;175
	$Tolerancia[9] = 225;175
	$Tolerancia[10] = 225;175

EndIf

If $modelo_fic = "Antigo" Then

	; margens para padrão novo de fic
	Global $margem_x = 115, $margem_y = 20

	Global $1_digito_x = ($X_hifen_i-10+$x_hifen)-305, $1_digito_y = $margem_y + 40
	Global $2_digito_x = ($X_hifen_i-10+$x_hifen)-305+30, $2_digito_y = $margem_y + 40
	Global $3_digito_x = ($X_hifen_i-10+$x_hifen)-305+90, $3_digito_y = $margem_y + 40
	Global $4_digito_x = ($X_hifen_i-10+$x_hifen)-305+120, $4_digito_y = $margem_y + 40
	Global $5_digito_x = ($X_hifen_i-10+$x_hifen)-305+150, $5_digito_y = $margem_y + 40
	Global $6_digito_x = ($X_hifen_i-10+$x_hifen)-305+210, $6_digito_y = $margem_y + 40
	Global $7_digito_x = ($X_hifen_i-10+$x_hifen)-305+240, $7_digito_y = $margem_y + 40
	Global $8_digito_x = ($X_hifen_i-10+$x_hifen)-305+270, $8_digito_y = $margem_y + 40
	Global $9_digito_x = ($X_hifen_i-10+$x_hifen)-305+330, $9_digito_y = $margem_y + 40

	global $tamanho_digito_x = 35
	global $tamanho_digito_y = 80

	Global $Tolerancia[11] ; Tolerancia para cada digito
	$Tolerancia[0] = 225;175
	$Tolerancia[1] = 225;175
	$Tolerancia[2] = 225;175
	$Tolerancia[3] = 225;175
	$Tolerancia[4] = 225;175
	$Tolerancia[5] = 225;175
	$Tolerancia[6] = 225;175
	$Tolerancia[7] = 225;175
	$Tolerancia[8] = 225;175
	$Tolerancia[9] = 225;175
	$Tolerancia[10] = 225;175

EndIf



EndFunc

func procura_digitos()
global $y = 0, $x = 0
_captura_tela()

	$progress_digitos_t = 100 / 9
	$incremento = $progress_digitos_t

For $z = 1 to 9 step 1


	$incremento += $progress_digitos_t
	GUICtrlSetData($pdt, $incremento)

	if $debug = "Yes" Then
		;================== mostra retangulo de busca =================
		_GDIPlus_Startup ()

		local $hDC_d = _WinAPI_GetWindowDC(0)
		local $hGraphic_d = _GDIPlus_GraphicsCreateFromHDC($hDC_d)
		local $Color = 0xFFff0000
		local $hPen = _GDIPlus_PenCreate($Color,2)
		local $x_inicial = $PosJanela[0]+eval($z&"_digito_x")
		local $x_final = $PosJanela[0]+eval($z&"_digito_x")+$tamanho_digito_x
		local $y_inicial = $PosJanela[1]+eval($z&"_digito_y")
		local $y_final = $PosJanela[1]+eval($z&"_digito_y")+$tamanho_digito_y

		;For $t = 0 to 300
		_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_final, $y_inicial, $hPen)
		_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_inicial, $y_final, $hPen)
		_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_final, $x_final, $y_final, $hPen)
		_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_final, $y_inicial, $x_final, $y_final, $hPen)
		$Color += Hex(2)
		_GDIPlus_PenSetColor($hPen, $Color)
		;;Next
		;===================== fim mostra retangulo de busca =====================
	EndIf

	Local $w_limite[2]

	if $z = 1 then
		local $w_limite[2] = [6,0] ;limita pesquisa do primeiro digito do RG para 0 até 6 (não atingimos 70 milhoes ainda)
	EndIf
	if $z = 9 then
		$temp = UBound($digito)-1
		local $w_limite[2] = [$temp,0] ;não limita pesquisa no digito verificador.
		GUICtrlSetData($pdt, 100)
	EndIf
	if $z > 1 and $z < 9 then
		local $w_limite[2] = [9,0] ;limita pesquisa nos outros 7 digitos para 0 até 9
	EndIf

	for $w = $w_limite[0] to $w_limite[1] Step -1
	$digito_f = $digito[$w]

		if IsArray($digito_f) Then

			$progress_digitos = 100 / $digito_f[0]
			$incremento2 = $progress_digitos

			for $b = 1 to $digito_f[0]

					$incremento2 += $progress_digitos
					GUICtrlSetData($input_name_digitos[$z], $incremento2)


				If FileExists ($digito_f[$b]) Then

					Local $search = _ImageSearchArea("*TransBlack " &$digito_f[$b], 0,eval($z&"_digito_x"), eval($z&"_digito_y"), eval($z&"_digito_x")+$tamanho_digito_x, eval($z&"_digito_y")+$tamanho_digito_y, $x, $y, $Tolerancia[$w])

					If $search > 0 Then
						Assign($z&"_digito_n", $DigitoText[$w])
						;MsgBox(0,"", "o "&$z&" digito é "  & $DigitoText[$w] & " " & $digito_f[$b] & " x "&eval($z&"_digito_x")+$x& " y "& eval($z&"_digito_y")+$y)
						GUICtrlSetData($input_name[$z], $DigitoText[$w])
						if $console = "Yes" then ConsoleWrite("-Função verifica_digitos() > executando procura_digitos() resultado: "&$z&"_digito_n = "&$DigitoText[$w]&" na primeira verificação, arquivo de referencia: "&$digito_f[$b]& @CRLF)

						GUICtrlSetState("ld"&$z, $GUI_SHOW)
						GUICtrlSetBkColor(-1, 0x00FF00)

						;msgbox(4096,"", eval($digito_f[$b]))
						ExitLoop(2)
					Else

						;_GDIPlus_Startup()
						;Local $hGUI = GUICreate("print", 700, 700, 0, 0)
						;GUISetState()
						;Local $hGraphic2 = _GDIPlus_GraphicsCreateFromHWND($hGUI)
						;_GDIPlus_GraphicsDrawImage($hGraphic2, $hBitmap, 0, 0)
					EndIf

				Else
					$search=0

				EndIf

			Next
		EndIf

	Next
	;-----2 nivel de teste, maior abrangencia e tolerancia para campo
	if eval($z&"_digito_n") = "" Then

		if $debug = "Yes" Then
			;================== mostra retangulo de busca =================
			_GDIPlus_Startup ()
			local $hDC_d = _WinAPI_GetWindowDC(0)
			local $hGraphic_d = _GDIPlus_GraphicsCreateFromHDC($hDC_d)
			local $Color = 0xFFFF0000
			local $hPen = _GDIPlus_PenCreate($Color,2)
			local $x_inicial = $PosJanela[0]+eval($z&"_digito_x")-5
			local $x_final = $PosJanela[0]+eval($z&"_digito_x")+$tamanho_digito_x+10
			local $y_inicial = $PosJanela[1]+eval($z&"_digito_y")-5
			local $y_final = $PosJanela[1]+eval($z&"_digito_y")+$tamanho_digito_y+10

			;For $t = 0 to 300
			_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_final, $y_inicial, $hPen)
			_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_inicial, $y_final, $hPen)
			_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_final, $x_final, $y_final, $hPen)
			_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_final, $y_inicial, $x_final, $y_final, $hPen)
			$Color += Hex(2)
			_GDIPlus_PenSetColor($hPen, $Color)
			;Next
			;===================== fim mostra retangulo de busca =====================
		EndIf


		for $w = $w_limite[0] to $w_limite[1] Step -1
		$digito_f = $digito[$w]

			if IsArray($digito_f) Then
				for $b = 1 to $digito_f[0]

					If FileExists ($digito_f[$b]) Then

						Local $search = _ImageSearchArea("*TransBlack " &$digito_f[$b], 0,eval($z&"_digito_x")-5, eval($z&"_digito_y")-5, eval($z&"_digito_x")+$tamanho_digito_x+10, eval($z&"_digito_y")+$tamanho_digito_y+10, $x, $y, $Tolerancia[$w]+10)

						If $search > 0 Then
							Assign($z&"_digito_n", $DigitoText[$w])
							;MsgBox(0,"", "o 1 digito é "  & $DigitoText[$i] & " " &$digito[$i][$i2]& " x "&$1_digito_x+$x& " y "& $1_digito_y+$y)
							GUICtrlSetData($input_name[$z], $DigitoText[$w])
							;msgbox(4096,"", $input_name[$z] & " "&$DigitoText[$w])
							if $console = "Yes" then ConsoleWrite("-Função verifica_digitos() > executando procura_digitos() resultado: "&$z&"_digito_n = "&$DigitoText[$w]&" na segunda verificação, arquivo de referencia: "&$digito_f[$b]& @CRLF)

							GUICtrlSetState("ld"&$z, $GUI_SHOW)
							GUICtrlSetBkColor(-1, 0xFFFF00)

							ExitLoop(2)

						EndIf

					Else
						$search=0

					EndIf

				Next
			EndIf

		Next
		;-----3 nivel de teste, maior abrangencia e tolerancia para campo
		if eval($z&"_digito_n") = "" Then

			if $debug = "Yes" Then
				;================== mostra retangulo de busca =================
				_GDIPlus_Startup ()
				local $hDC_d = _WinAPI_GetWindowDC(0)
				local $hGraphic_d = _GDIPlus_GraphicsCreateFromHDC($hDC_d)
				local $Color = 0xFFFFFF00
				local $hPen = _GDIPlus_PenCreate($Color,2)
				local $x_inicial = $PosJanela[0]+eval($z&"_digito_x")-10
				local $x_final = $PosJanela[0]+eval($z&"_digito_x")+$tamanho_digito_x+15
				local $y_inicial = $PosJanela[1]+eval($z&"_digito_y")-10
				local $y_final = $PosJanela[1]+eval($z&"_digito_y")+$tamanho_digito_y+15
							;For $t = 0 to 300
				_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_final, $y_inicial, $hPen)
				_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_inicial, $y_final, $hPen)
				_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_final, $x_final, $y_final, $hPen)
				_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_final, $y_inicial, $x_final, $y_final, $hPen)
				$Color += Hex(2)
				_GDIPlus_PenSetColor($hPen, $Color)
				;Next
				;===================== fim mostra retangulo de busca =====================

			EndIf

			for $w = $w_limite[0] to $w_limite[1] Step -1
			$digito_f = $digito[$w]

				if IsArray($digito_f) Then
					for $b = 1 to $digito_f[0]

						If FileExists ($digito_f[$b]) Then

							Local $search = _ImageSearchArea("*TransBlack " &$digito_f[$b], 0,eval($z&"_digito_x")-10, eval($z&"_digito_y")-10, eval($z&"_digito_x")+$tamanho_digito_x+15, eval($z&"_digito_y")+$tamanho_digito_y+15, $x, $y, $Tolerancia[$w]+20)

							If $search > 0 Then
								Assign($z&"_digito_n", $DigitoText[$w])
								;MsgBox(0,"", "o 1 digito é "  & $DigitoText[$i] & " " &$digito[$i][$i2]& " x "&$1_digito_x+$x& " y "& $1_digito_y+$y)
								GUICtrlSetData($input_name[$z], $DigitoText[$w])
								;msgbox(4096,"", $input_name[$z] & " "&$DigitoText[$w])
								if $console = "Yes" then ConsoleWrite("-Função verifica_digitos() > executando procura_digitos() resultado: "&$z&"_digito_n = "&$DigitoText[$w]&" na terceira verificação, arquivo de referencia: "&$digito_f[$b]& @CRLF)

								GUICtrlSetState("ld"&$z, $GUI_SHOW)
								GUICtrlSetBkColor(-1, 0xFF0000)

								ExitLoop(2)

							EndIf

						Else
							$search=0

						EndIf

					Next

				EndIf

			Next


		EndIf
		if eval($z&"_digito_n") = "" Then
			if $console = "Yes" then ConsoleWrite("!Função verifica_digitos() > executando procura_digitos() resultado: "&$z&"_digito_n não encontrado."  & @CRLF)
			if $erro_descricao_detalhado = "" Then
				$erro_descricao_detalhado = "O digito "&$z&" não foi encontrado"
			Else
				$erro_descricao_detalhado = $erro_descricao_detalhado & ", o digito "&$z&" não foi encontrado"
			EndIf
			Global $compara_digito_validador = "Erro"
			;ExitLoop(2)
			ExitLoop(1)

		EndIf


		;----------------------
		;local $digito_nao_encontrados
		;if $digito_nao_encontrados = "" Then
		;	$digito_nao_encontrados = $z
		;Else
		;	$digito_nao_encontrados = $digito_nao_encontrados &", "& $z
		;EndIf
		;-----------------------------
	EndIf

Next

;MsgBox(0,"", "nao achei o digito "&$digito_nao_encontrados)

EndFunc

func validador()

global $1_digito_n = GUICtrlRead($1_digito_n_campo, 1)
global $2_digito_n = GUICtrlRead($2_digito_n_campo, 1)
global $3_digito_n = GUICtrlRead($3_digito_n_campo, 1)
global $4_digito_n = GUICtrlRead($4_digito_n_campo, 1)
global $5_digito_n = GUICtrlRead($5_digito_n_campo, 1)
global $6_digito_n = GUICtrlRead($6_digito_n_campo, 1)
global $7_digito_n = GUICtrlRead($7_digito_n_campo, 1)
global $8_digito_n = GUICtrlRead($8_digito_n_campo, 1)
global $9_digito_n = GUICtrlRead($9_digito_n_campo, 1)
Global $compara_digito_validador = Null

	if $1_digito_n <> Null and $2_digito_n <> Null and $3_digito_n <> Null and $4_digito_n <> Null and $5_digito_n <> Null and $6_digito_n <> Null and $7_digito_n <> Null and $8_digito_n <> Null And $9_digito_n <> Null Then
		if $1_digito_n <> "" and $2_digito_n <> "" and $3_digito_n <> "" and $4_digito_n <> "" and $5_digito_n <> "" and $6_digito_n <> "" and $7_digito_n <> "" and $8_digito_n <> "" And $9_digito_n <> "" Then

			if StringLen($1_digito_n) = 1 and StringLen($2_digito_n) = 1 and StringLen($3_digito_n) = 1 and StringLen($4_digito_n) = 1 and StringLen($5_digito_n) = 1 and StringLen($6_digito_n) = 1 and StringLen($7_digito_n) = 1 and StringLen($8_digito_n) = 1 And StringLen($9_digito_n) = 1 Then

				if $1_digito_n = 0 and $2_digito_n = 0 and $3_digito_n = 0 and $4_digito_n = 0 and $5_digito_n = 0 and $6_digito_n = 0 and $7_digito_n = 0 and $8_digito_n = 0 And $9_digito_n = 0 Then

					if $fics_fila = "não" or $fics_fila = Null or $fics_fila = "" Then
						Global $compara_digito_validador = "Fila"
						global $erro_descricao = "Todos os campos foram preenchidos com 0"
					Else
						Global $compara_digito_validador = "Erro"
					EndIf
					;MsgBox(0,"","erro verificador nivel 2.1")

				Else

					Local $soma_digitos_rg = ($1_digito_n*9)+($2_digito_n*8)+($3_digito_n*7)+($4_digito_n*6)+($5_digito_n*5)+($6_digito_n*4)+($7_digito_n*3)+($8_digito_n*2)
					Local $divisao_soma_rg = int($soma_digitos_rg/11)
					Local $multi_soma_rg = $divisao_soma_rg*11
					Local $resto_rg = $soma_digitos_rg-$multi_soma_rg

					if $resto_rg = "10" Then
						$digito_verificador_rg = "X"
					Else
						$digito_verificador_rg = $resto_rg
					EndIf
					if $digito_verificador_rg <> $9_digito_n or $digito_verificador_rg = Null or StringLen($digito_verificador_rg) < 1 Then
						if $fics_fila = "não" or $fics_fila = Null or $fics_fila = "" Then
							Global $compara_digito_validador = "Fila"
							global $erro_descricao = "Digito verificador {Função} diferente do digito reconhecido"
						Else
							Global $compara_digito_validador = "Erro"
						EndIf
						;MsgBox(0,"",$resto_rg)
					Else
						Global $compara_digito_validador = "Ok"
					EndIf
				EndIf

			Else
				if $fics_fila = "não" or $fics_fila = Null or $fics_fila = "" Then
					Global $compara_digito_validador = "Fila"
					global $erro_descricao = "Campo digito com valor superior a 1 caracter"
				Else
					Global $compara_digito_validador = "Erro"
				EndIf
				;MsgBox(0,"","erro verificador nivel 3")

			EndIf


		Else
			if $fics_fila = "não" or $fics_fila = Null or $fics_fila = "" Then
				Global $compara_digito_validador = "Fila"
				global $erro_descricao = "Algum dos campos de digito não foi preenchido"
			Else
				Global $compara_digito_validador = "Erro"
			EndIf
			;MsgBox(0,"","erro verificador nivel 2")

		EndIf

	Else
		if $fics_fila = "não" or $fics_fila = Null or $fics_fila = "" Then
			Global $compara_digito_validador = "Fila"
			global $erro_descricao = "Algum dos campos de digito não foi reconhecido ou teve valor igual a Nulo"
		Else
			Global $compara_digito_validador = "Erro"
		EndIf
		;MsgBox(0,"","erro verificador nivel 1")
	EndIf


EndFunc


Func verifica_campo()

		procura_campo_RG()

EndFunc

Func verifica_digitos()


		verifica_modelo_fic()


		procura_digitos()

EndFunc

while 1
sleep(200)
WEnd