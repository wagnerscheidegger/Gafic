
Func _captura_tela_data($iLeft = 0, $iTop = 0, $iRight = 700, $iBottom = 700, $ReturnBMP = False)
	_GDIPlus_BitmapDispose($hBitmap)
	_WinAPI_DeleteObject($hHBitmap)
	;getPos()
	$hHBitmap = _ScreenCapture_Capture("", $iLeft+$PosJanela[0], $iTop+$PosJanela[1], $iRight+$PosJanela[0]+$x, $iBottom+$PosJanela[1]+$y,false)
	Global $hBitmap_data = _GDIPlus_BitmapCreateFromHBITMAP($hHBitmap)
	If $ReturnBMP Then Return $hBitmap_data
EndFunc

Func procura_data()
	Global $y_data = 0, $x_data = 0
	Global $X_data_i = 500, $Y_data_i = $posicao_x_load_fic+410
	Global $X_data_f = 700, $Y_data_f = $Y_data_i + 60
	_captura_tela_data($X_data_i,$Y_data_i,$X_data_f,$Y_data_f)

	if $debug = "Yes" Then
	;================== mostra retangulo de busca =================
	_GDIPlus_Startup ()

	local $hDC_d = _WinAPI_GetWindowDC(0)
	local $hGraphic_d = _GDIPlus_GraphicsCreateFromHDC($hDC_d)
	local $Color = 0xFFff0000
	local $hPen = _GDIPlus_PenCreate($Color,2)
	local $x_inicial = $PosJanela[0]+$X_data_i
	local $x_final = $PosJanela[0]+$X_data_f
	local $y_inicial = $PosJanela[1]+$Y_data_i
	local $y_final = $PosJanela[1]+$Y_data_f

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


For $i = 1 to $total_imagens_data Step 1
			If FileExists ($campo_data[$i]) Then
				Local $search = _ImageSearchArea($campo_data[$i], 0, 0, 0, 200, 150, $x_data, $y_data, $Tolerancia_data)
				If $search > 0 Then
					;MsgBox(0,"", "achei o campo x: "  & $x_data & " y: " &$y_data & " imagem: "&$campo_data[$i] &" X_rel"&$PosJanela[0]+$X_data_i+$x_data&" "&$X_data_i+$x_data&" Y_rel"&$PosJanela[1]+$Y_data_i+$y_data&" "&$Y_data_i+$y_data )

					;local $X_campo_captura_i = $PosJanela[0]+$X_campo_i+$x, $Y_campo_captura_i = $PosJanela[1]+$Y_campo_i+$y

					;_captura_tela_campo_RG_final($X_campo_captura_i,$Y_campo_captura_i,$X_campo_captura_i+150,$Y_campo_captura_i+50)

					negativo("campo_data")

					;_GDIPlus_Startup()
					;Global $hGraphic3 = _GDIPlus_GraphicsCreateFromHWND($hGUI)
					;_GDIPlus_GraphicsDrawImageRectRect($hGraphic3, $hImage2, (($X_data_i+$x_data)*3)-10,(($Y_data_i*1.6)+$y_data*2),470,80,10,130,470,80) ;enquadra campo DATA com o arquivo da imagem original
					;msgbox(0,"", "x: "& (($X_data_i+$x_data)*3)-10 & " y: "&(($Y_data_i*1.6)+$y_data*2)& "campo: "&$campo_data[$i])
					;Local $hGUI = GUICreate("print_final", 350, 350)
					;GUISetState()

					;Global $hGraphic3 = _GDIPlus_GraphicsCreateFromHWND($hGUI)
					;_GDIPlus_GraphicsDrawImage($hGraphic3, $hBitmap_data, 0, 0)

					global $achou_data = "Sim"

					ExitLoop(1)
				Else
					Local $search = _ImageSearchArea($campo_data[$i], 0, 0, 0, 200, 150, $x_data, $y_data, $Tolerancia_data+15)
					If $search > 0 Then
						negativo("campo_data")
						global $achou_data = "Sim"
						ExitLoop(1)
					Else
						$search=0
						;MsgBox(0,"", "nao achei a imagem"&$i+1)
						global $achou_data = "Não"
						global $erro_descricao = "O campo Data não foi encontrado"
						;_GDIPlus_Startup()
						;Local $hGUI = GUICreate("print", 250, 150)
						;GUISetState()
						;Local $hGraphic3 = _GDIPlus_GraphicsCreateFromHWND($hGUI)
						;_GDIPlus_GraphicsDrawImage($hGraphic3, $hBitmap_data, 0, 0)
					EndIf

				EndIf
			EndIf
Next

EndFunc

Func procura_data_barra()
	Global $y_barra = 0, $x_barra = 0
	Global $X_barra_i = 90, $Y_barra_i = $posicao_x_load_fic+50
	Global $X_barra_f = 190, $Y_barra_f = $posicao_x_load_fic+130
	_captura_tela_data($X_barra_i,$Y_barra_i,$X_barra_f,$Y_barra_f)

	if $prints = "Yes" Then

		_GDIPlus_Startup()
		Local $hGUI = GUICreate("busca barra", 100, 100,0,0)
		GUISetState()
		Local $hGraphic2 = _GDIPlus_GraphicsCreateFromHWND($hGUI)
		_GDIPlus_GraphicsDrawImage($hGraphic2, $hBitmap_data, 0, 0)
	;EndIf

	;if $debug = "Yes" Then
		;================== mostra retangulo de busca =================
		_GDIPlus_Startup ()

		local $hDC_d = _WinAPI_GetWindowDC(0)
		local $hGraphic_d = _GDIPlus_GraphicsCreateFromHDC($hDC_d)
		local $Color = 0xFFffFFF00
		local $hPen = _GDIPlus_PenCreate($Color,2)
		local $x_inicial = $PosJanela[0]+$X_barra_i
		local $x_final = $PosJanela[0]+$X_barra_f
		local $y_inicial = $PosJanela[1]+$Y_barra_i
		local $y_final = $PosJanela[1]+$Y_barra_f

		;;For $t = 0 to 300
		_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_final, $y_inicial, $hPen)
		_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_inicial, $y_final, $hPen)
		_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_final, $x_final, $y_final, $hPen)
		_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_final, $y_inicial, $x_final, $y_final, $hPen)
		$Color += Hex(2)
		_GDIPlus_PenSetColor($hPen, $Color)
		;;Next
		;===================== fim mostra retangulo de busca =====================

	EndIf

	if $console = "Yes" then ConsoleWrite("total de imagens em data / : "&$total_imagens_barra&@CRLF)
	For $i = 1 to $total_imagens_barra Step 1

		If FileExists ($campo_data_barra[$i]) Then
			if $console = "Yes" then ConsoleWrite("procurando imagen: "&$campo_data_barra[$i]&@CRLF)
			Local $search3 = _ImageSearchArea("*TransBlack " &$campo_data_barra[$i], 0, $x_data, $y_data, 100, 100, $x_barra, $y_barra, $Tolerancia_barra)
			If $search3 > 0 Then
				;global $modelo_fic = "Antigo"

				if $mensagens = "Yes" then MsgBox(0,"", "achei a barra: x: " & $x_barra & " y: " &$y_barra & " imagem: "&$campo_data_barra[$i] &" X_rel:"&$PosJanela[0]+$X_barra_i+$x_data+$x_barra&", sem PosX: "&$X_barra_i+$x_data+$x_barra&" Y_rel: "&$PosJanela[1]+$Y_barra_i+$y_data+$y_barra&", sem posY: "&$Y_barra_i+$y_data+$y_barra)

				;Local $hGUI = GUICreate("print_final_achei", 350, 350)
				;GUISetState()

				;Global $hGraphic3 = _GDIPlus_GraphicsCreateFromHWND($hGUI)
				;_GDIPlus_GraphicsDrawImage($hGraphic3, $hBitmap_data, 0, 0)
				if $console = "Yes" then ConsoleWrite("data / encontrado em $i= "&$i&", adotando medidas proporcionais"&@CRLF)

				;======margem antiga, as vezes apresenta erro ===========================
				;Global $1_digito_x = 75 + $margem_x + ($x_barra*3) - 5, $1_digito_y = $margem_y + 150
				;Global $2_digito_x = 75 + $margem_x + ($x_barra*3) + 30, $2_digito_y = $margem_y + 150
				;Global $3_digito_x = 75 + $margem_x + ($x_barra*3) + 90, $3_digito_y = $margem_y + 150
				;Global $4_digito_x = 75 + $margem_x + ($x_barra*3) + 120, $4_digito_y = $margem_y + 150
				;Global $5_digito_x = 75 + $margem_x + ($x_barra*3) + 180, $5_digito_y = $margem_y + 150
				;Global $6_digito_x = 75 + $margem_x + ($x_barra*3) + 210, $6_digito_y = $margem_y + 150
				;Global $7_digito_x = 75 + $margem_x + ($x_barra*3) + 240, $7_digito_y = $margem_y + 150
				;Global $8_digito_x = 75 + $margem_x + ($x_barra*3) + 270, $8_digito_y = $margem_y + 150
				;======fim margem antiga, as vezes apresenta erro ===========================

				;======margem nova++++++++++++++++++++++++++++++==========================
				Global $1_digito_x = $X_barra_i + $x_barra - 55, $1_digito_y = $margem_y + 150
				Global $2_digito_x = $X_barra_i + $x_barra - 20, $2_digito_y = $margem_y + 150
				Global $3_digito_x = $X_barra_i + $x_barra + 40, $3_digito_y = $margem_y + 150
				Global $4_digito_x = $X_barra_i + $x_barra + 70, $4_digito_y = $margem_y + 150
				Global $5_digito_x = $X_barra_i + $x_barra + 130, $5_digito_y = $margem_y + 150
				Global $6_digito_x = $X_barra_i + $x_barra + 160, $6_digito_y = $margem_y + 150
				Global $7_digito_x = $X_barra_i + $x_barra + 190, $7_digito_y = $margem_y + 150
				Global $8_digito_x = $X_barra_i + $x_barra + 220, $8_digito_y = $margem_y + 150
				;======fim margem nova++++++++++++++++++++++++++++++==========================
				ExitLoop(1)

			Else

				local $search3=0



				if $console = "Yes" then ConsoleWrite("data / "&$i&" não encontrado, adotando medidas padrão"&@CRLF)
				Global $1_digito_x = $margem_x + 95 - 5, $1_digito_y = $margem_y + 150
				Global $2_digito_x = $margem_x + 95 + 30, $2_digito_y = $margem_y + 150
				Global $3_digito_x = $margem_x + 95 + 90, $3_digito_y = $margem_y + 150
				Global $4_digito_x = $margem_x + 95 + 120, $4_digito_y = $margem_y + 150
				Global $5_digito_x = $margem_x + 95 + 180, $5_digito_y = $margem_y + 150
				Global $6_digito_x = $margem_x + 95 + 210, $6_digito_y = $margem_y + 150
				Global $7_digito_x = $margem_x + 95 + 240, $7_digito_y = $margem_y + 150
				Global $8_digito_x = $margem_x + 95 + 270, $8_digito_y = $margem_y + 150

				;MsgBox(0,"", "nao achei a imagem"&$i+1)

				;Local $hGUI = GUICreate("print_final nao achei", 350, 350)
				;GUISetState()

				;Global $hGraphic3 = _GDIPlus_GraphicsCreateFromHWND($hGUI)
				;_GDIPlus_GraphicsDrawImage($hGraphic3, $hBitmap_data, 0, 0)
				;global $modelo_fic = "Novo"

			EndIf
		EndIf
	Next
		if  $i > $total_imagens_barra then
			if $mensagens = "Yes" then MsgBox(0,"", "não achei a barra!")
			if $console = "Yes" then ConsoleWrite("!todas as imagens de data / verificadas sem retorno!"&@CRLF)
			if $search3=0 Then
				;MsgBox(0,"", "não achei a barra!")
				global $erro_descricao_detalhado = "A barra (DD/MM) não foi encontrada"
				;msgbox(0,"",$erro_descricao_detalhado)
			EndIf
		EndIf

EndFunc


Func verifica_modelo_fic_data()

If $modelo_fic = "Novo" Then

	; margens para padrão novo de fic
	Global $margem_x = 7, $margem_y = 30

	Global $1_digito_x = $margem_x + 125, $1_digito_y = $margem_y + 140
	Global $2_digito_x = $margem_x + 137, $2_digito_y = $margem_y + 140
	Global $3_digito_x = $margem_x + 165, $3_digito_y = $margem_y + 140
	Global $4_digito_x = $margem_x + 185, $4_digito_y = $margem_y + 140
	Global $5_digito_x = $margem_x + 212, $5_digito_y = $margem_y + 140
	Global $6_digito_x = $margem_x + 227, $6_digito_y = $margem_y + 140
	Global $7_digito_x = $margem_x + 248, $7_digito_y = $margem_y + 140
	Global $8_digito_x = $margem_x + 263, $8_digito_y = $margem_y + 140

	global $tamanho_digito_x = 30
	global $tamanho_digito_y = 80

	Global $Tolerancia[11] ; Tolerancia para cada digito
	$Tolerancia[0] = 225;175
	$Tolerancia[1] = 225;165
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
	Global $margem_x = -50, $margem_y = 05

	global $tamanho_digito_x = 35
	global $tamanho_digito_y = 80

	Global $Tolerancia[11] ; Tolerancia para cada digito
	$Tolerancia[0] = 225;175
	$Tolerancia[1] = 225;105
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

func procura_digitos_data()
global $y = 0, $x = 0
_captura_tela()

	$progress_digitos_t = 100 / 8
	$incremento = $progress_digitos_t

For $z = 1 to 8 step 1

	$incremento += $progress_digitos_t
	GUICtrlSetData($pddt, $incremento)

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
		local $w_limite[2] = [3,0] ;limita pesquisa do primeiro digito do dia para 0 até 3 (não existe dia maior que 31)
	EndIf
	if $z = 2 then
		if eval("1_digito_n_data") = 3 then
			$temp = 1
		Else
			$temp = 9
		EndIf
		local $w_limite[2] = [$temp,0] ;não limita pesquisa do segundo digito do dia e do mês.
	EndIf

	if $z = 3 or $z = 7 then
		local $w_limite[2] = [1,0] ;limita pesquisa do primeiro digito do mês para 0 até 1 (não existe mês maior que 12) e terceiro digito do ano como 1
	EndIf
	if $z = 4 then
		if eval("3_digito_n_data") = 1 then
			$temp = 2
		Else
			$temp = 9
		EndIf
		local $w_limite[2] = [$temp,0] ;não limita pesquisa do segundo digito do mês.
	EndIf
	if $z = 5 then
		local $w_limite[2] = [2,2] ;limita pesquisa do primeiro digito do ano para 2;
	EndIf
	if $z = 6 then
		local $w_limite[2] = [0,0] ;define segundo digito do ano como 0;
	EndIf
	if $z = 8 then
		$temp = StringRight(@YEAR,1)
		local $w_limite[2] = [$temp,0] ;define segundo digito do ano como 0;
	EndIf

	for $w = $w_limite[0] to $w_limite[1] Step -1
	$digito_f = $digito[$w]

		if IsArray($digito_f) Then

			$progress_digitos = 100 / $digito_f[0]
			$incremento2 = $progress_digitos

			for $b = 1 to $digito_f[0]

				$incremento2 += $progress_digitos
				GUICtrlSetData($input_name_digitos_data[$z], $incremento2)

				if $z = 5 Then
					Assign($z&"_digito_n_data", 2)
					;MsgBox(0,"", "o "&$z&" digito é "  & $DigitoText[$w] & " " &$digito_f[$b]& " x "&eval($z&"_digito_x")+$x& " y "& eval($z&"_digito_y")+$y)
					GUICtrlSetData($input_name_data[$z], 2)
					ExitLoop(2)
				EndIf
				if $z = 6 Then
					Assign($z&"_digito_n_data", 0)
					;MsgBox(0,"", "o "&$z&" digito é "  & $DigitoText[$w] & " " &$digito_f[$b]& " x "&eval($z&"_digito_x")+$x& " y "& eval($z&"_digito_y")+$y)
					GUICtrlSetData($input_name_data[$z], 0)
					ExitLoop(2)
				EndIf
				if $z = 7 Then
					Assign($z&"_digito_n_data", 1)
					;MsgBox(0,"", "o "&$z&" digito é "  & $DigitoText[$w] & " " &$digito_f[$b]& " x "&eval($z&"_digito_x")+$x& " y "& eval($z&"_digito_y")+$y)
					GUICtrlSetData($input_name_data[$z], 1)
					ExitLoop(2)
				EndIf


				If FileExists ($digito_f[$b]) Then

					Local $search = _ImageSearchArea("*TransBlack " &$digito_f[$b], 0,eval($z&"_digito_x"), eval($z&"_digito_y"), eval($z&"_digito_x")+$tamanho_digito_x, eval($z&"_digito_y")+$tamanho_digito_y, $x, $y, $Tolerancia[$w])
					If $search > 0 Then
						Assign($z&"_digito_n_data", $DigitoText[$w])
						;MsgBox(0,"", "o "&$z&" digito é "  & $DigitoText[$w] & " " &$digito_f[$b]& " x "&eval($z&"_digito_x")+$x& " y "& eval($z&"_digito_y")+$y)
						GUICtrlSetData($input_name_data[$z], $DigitoText[$w])
						ExitLoop(2)
					Else

						;_GDIPlus_Startup()
						;Local $hGUI = GUICreate("print", 700, 700)
						;GUISetState()
						;Local $hGraphic2 = _GDIPlus_GraphicsCreateFromHWND($hGUI)
						;_GDIPlus_GraphicsDrawImage($hGraphic2, $hBitmap, 0, 0)
					EndIf

				Else
					$search=0
					;MsgBox(0,"", "nao achei ")
				EndIf

			Next
		EndIf

	Next
	;-----2 nivel de teste, maior abrangencia e tolerancia para campo
	if eval($z&"_digito_n_data") = "" Then

		if $debug = "Yes" Then
			;================== mostra retangulo de busca =================
			_GDIPlus_Startup ()
			local $hDC_d = _WinAPI_GetWindowDC(0)
			local $hGraphic_d = _GDIPlus_GraphicsCreateFromHDC($hDC_d)
			local $Color = 0xFF000000
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
							Assign($z&"_digito_n_data", $DigitoText[$w])
							;MsgBox(0,"", "o 1 digito é "  & $DigitoText[$i] & " " &$digito[$i][$i2]& " x "&$1_digito_x+$x& " y "& $1_digito_y+$y)
							GUICtrlSetData($input_name_data[$z], $DigitoText[$w])
							;msgbox(4096,"", $input_name[$z] & " "&$DigitoText[$w])
							ExitLoop(2)

						EndIf

					Else
						$search=0
						;MsgBox(0,"", "nao achei ")
					EndIf

				Next
			EndIf

		Next
		;-----3 nivel de teste, maior abrangencia e tolerancia para campo
		if eval($z&"_digito_n_data") = "" Then

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
								Assign($z&"_digito_n_data", $DigitoText[$w])
								;MsgBox(0,"", "o 1 digito é "  & $DigitoText[$i] & " " &$digito[$i][$i2]& " x "&$1_digito_x+$x& " y "& $1_digito_y+$y)
								GUICtrlSetData($input_name_data[$z], $DigitoText[$w])

								;MsgBox(0,"", "x inicial: "&eval($z&"_digito_x")-10&", x final: "&eval($z&"_digito_x")+$tamanho_digito_x+15&", y inicial: "&eval($z&"_digito_y")-10&", y final: "& eval($z&"_digito_y")+$tamanho_digito_y+15)

								ExitLoop(2)

							EndIf

						Else
							$search=0
							if $erro_descricao_detalhado = "" Then
								$erro_descricao_detalhado = "O digito "&$z&" da data não foi encontrado"
							Else
								$erro_descricao_detalhado = $erro_descricao_detalhado & ", o digito "&$z&" da data não foi encontrado"
							EndIf
							;MsgBox(0,"", "nao achei ")
						EndIf

					Next
				EndIf

			Next

			;MsgBox(0,"", "x inicial: "&eval($z&"_digito_x")-10&", x final: "&eval($z&"_digito_x")+$tamanho_digito_x+15&", y inicial: "&eval($z&"_digito_y")-10&", y final: "& eval($z&"_digito_y")+$tamanho_digito_y+15)

		EndIf

	EndIf



Next

EndFunc

func valida_v2($nDay, $nMon, $nYear)
	global $wdata = False
	;local $nDay = $1_digito_n_data & $2_digito_n_data
	;local $nMom = $3_digito_n_data & $4_digito_n_data
	;local $nYear = $5_digito_n_data& $6_digito_n_data& $7_digito_n_data& $8_digito_n_data
	local $pDay = @MDAY, $pMon = @MON, $pYear = @YEAR
	_SetDate($nDay, $nMon, $nYear)
	if @error then
		ToolTip("erro no 1 set date")

	endif

	;if @WDAY <> 1 then ToolTip("dia de semana" )
	_SetDate($pDay, $pMon, $pYear)
	global $wdata = True
	if @error then ToolTip("erro no 2 set date")
	return $wdata

EndFunc


func validador_data()

global $1_digito_n_data = GUICtrlRead($1_digito_n_campo_data, 1)
global $2_digito_n_data = GUICtrlRead($2_digito_n_campo_data, 1)
global $3_digito_n_data = GUICtrlRead($3_digito_n_campo_data, 1)
global $4_digito_n_data = GUICtrlRead($4_digito_n_campo_data, 1)
global $5_digito_n_data = GUICtrlRead($5_digito_n_campo_data, 1)
global $6_digito_n_data = GUICtrlRead($6_digito_n_campo_data, 1)
global $7_digito_n_data = GUICtrlRead($7_digito_n_campo_data, 1)
global $8_digito_n_data = GUICtrlRead($8_digito_n_campo_data, 1)
Global $compara_data = Null

	if $1_digito_n_data <> Null and $2_digito_n_data <> Null and $3_digito_n_data <> Null and $4_digito_n_data <> Null and $5_digito_n_data <> Null and $6_digito_n_data <> Null and $7_digito_n_data <> Null and $8_digito_n_data <> Null Then

		if $1_digito_n_data <> "" and $2_digito_n_data <> "" and $3_digito_n_data <> "" and $4_digito_n_data <> "" and $5_digito_n_data <> "" and $6_digito_n_data <> "" and $7_digito_n_data <> "" and $8_digito_n_data <> "" Then

			if StringLen($1_digito_n_data) = 1 and StringLen($2_digito_n_data) = 1 and StringLen($3_digito_n_data) = 1 and StringLen($4_digito_n_data) = 1 and StringLen($5_digito_n_data) = 1 and StringLen($6_digito_n_data) = 1 and StringLen($7_digito_n_data) = 1 and StringLen($8_digito_n_data) = 1 Then

				;================== verifica se o dia é igual a 00 ================================
				if $1_digito_n_data = "0" and $2_digito_n_data = "0" Then
					Global $1_digito_n_data = Null
					Global $2_digito_n_data = Null
					Local $dia_1_digito = "Erro"
					Local $dia_2_digito = "Erro"
					if $fics_fila = "Sim" Then
						MsgBox(0,"Data inválida!","O dia não pode ser igual a 00")
					Else
						if $erro_descricao_detalhado = "" Then
							$erro_descricao_detalhado = "O dia não pode ser igual a 00"
						Else
							$erro_descricao_detalhado = $erro_descricao_detalhado & ", o dia não pode ser igual a 00"
						EndIf
					endif
				Else
					;================== verifica se o dia é igual a null ================================
					if $1_digito_n_data = Null and $2_digito_n_data = Null Then
						Global $1_digito_n_data = Null
						Global $2_digito_n_data = Null
						Local $dia_1_digito = "Erro"
						Local $dia_2_digito = "Erro"
						if $fics_fila = "Sim" Then
							MsgBox(0,"Data inválida!","O dia não pode ser nulo")
						Else
							if $erro_descricao_detalhado = "" Then
								$erro_descricao_detalhado = "O dia não pode ser nulo"
							Else
								$erro_descricao_detalhado = $erro_descricao_detalhado & ", o dia não pode ser nulo"
							EndIf
						endif
					Else
						;================== verifica se o dia é igual a vazio ================================

						if $1_digito_n_data = "" and $2_digito_n_data = "" Then
							Global $1_digito_n_data = Null
							Global $2_digito_n_data = Null
							Local $dia_1_digito = "Erro"
							Local $dia_2_digito = "Erro"
							if $fics_fila = "Sim" Then
								MsgBox(0,"Data inválida!","O dia não pode ser vazio")
							Else
								if $erro_descricao_detalhado = "" Then
									$erro_descricao_detalhado = "O dia não pode ser vazio"
								Else
									$erro_descricao_detalhado = $erro_descricao_detalhado & ", o dia não pode ser vazio"
								EndIf
							endif
						Else
							;================== verifica se o primeiro digito do dia é maior que 3 ================================
							if $1_digito_n_data > "3" Then
								Global $1_digito_n_data = Null
								Local $dia_1_digito = "Erro"
								if $fics_fila = "Sim" Then
									MsgBox(0,"Data inválida!","A data não pode ser superior a 31")
								Else
									if $erro_descricao_detalhado = "" Then
										$erro_descricao_detalhado = "A data não pode ser superior a 31"
									Else
										$erro_descricao_detalhado = $erro_descricao_detalhado & ", a data não pode ser superior a 31"
									EndIf
								endif
							Else
								;================== verifica se o dia é maior que 31 ================================
								If $1_digito_n_data = "3" and $2_digito_n_data > "1" Then
									global $2_digito_n_data = Null
									Local $dia_2_digito = "Erro"
									if $fics_fila = "Sim" Then
										MsgBox(0,"Data inválida!!","A data não pode ser superior a 31")
									Else
										if $erro_descricao_detalhado = "" Then
											$erro_descricao_detalhado = "A data não pode ser superior a 31"
										Else
											$erro_descricao_detalhado = $erro_descricao_detalhado & ", a data não pode ser superior a 31"
										EndIf
									endif
								Else
									Local $dia_2_digito = "Ok"
									Local $dia_1_digito = "Ok"
								EndIf
							EndIf
						EndIf
					EndIf
				Endif

				;================== verifica se o mês é igual a 00 ================================
				if $3_digito_n_data = "0" and $4_digito_n_data = "0" Then
					global $4_digito_n_data = Null
					global $3_digito_n_data = Null
					local $mes_2_digito = "Erro"
					local $mes_1_digito = "Erro"

					if $fics_fila = "Sim" Then
						MsgBox(0,"Data inválida!!","o mês não pode ser igual a 0")
					Else
						if $erro_descricao_detalhado = "" Then
							$erro_descricao_detalhado = "o mês não pode ser igual a 0"
						Else
							$erro_descricao_detalhado = $erro_descricao_detalhado & ", o mês não pode ser igual a 0"
						EndIf
					endif
				Else
					;================== verifica se o mês é igual a null ================================
					if $3_digito_n_data = null and $4_digito_n_data = null Then
						global $4_digito_n_data = Null
						global $3_digito_n_data = Null
						local $mes_2_digito = "Erro"
						local $mes_1_digito = "Erro"
						if $fics_fila = "Sim" Then
							MsgBox(0,"Data inválida!!","o mês não pode ser igual a Nulo")
						Else
							if $erro_descricao_detalhado = "" Then
								$erro_descricao_detalhado = "o mês não pode ser igual a Nulo"
							Else
								$erro_descricao_detalhado = $erro_descricao_detalhado & ", o mês não pode ser igual a Nulo"
							EndIf
						endif
					Else
						;================== verifica se o mês é igual a vazio ================================
						if $3_digito_n_data = "" and $4_digito_n_data = "" Then
							global $4_digito_n_data = Null
							global $3_digito_n_data = Null
							local $mes_2_digito = "Erro"
							local $mes_1_digito = "Erro"
							if $fics_fila = "Sim" Then
								MsgBox(0,"Data inválida!!","o mês não pode ser vazio")
							Else
								if $erro_descricao_detalhado = "" Then
									$erro_descricao_detalhado = "o mês não pode ser vazio"
								Else
									$erro_descricao_detalhado = $erro_descricao_detalhado & ", o mês não pode ser vazio"
								EndIf
							endif
						Else
							;================== verifica se o primeiro digito do mês é maior que 1 ================================
							if $3_digito_n_data = "" or $3_digito_n_data > "1" Then
								global $3_digito_n_data = null
								local $mes_1_digito = "Erro"
								if $fics_fila = "Sim" Then
									MsgBox(0,"Data inválida!","o mês não pode ser superior a 12")
								Else
									if $erro_descricao_detalhado = "" Then
										$erro_descricao_detalhado = "o mês não pode ser superior a 12"
									Else
										$erro_descricao_detalhado = $erro_descricao_detalhado & ", o mês não pode ser superior a 12"
									EndIf
								endif
							Else
								;================== verifica se o mês é maior que 12 ================================
								if $3_digito_n_data = "1" and $4_digito_n_data > "2" Then
									global $4_digito_n_data = Null
									local $mes_2_digito = "Erro"
									if $fics_fila = "Sim" Then
										MsgBox(0,"Data inválida!!","o mês não pode ser superior a 12")
									Else
										if $erro_descricao_detalhado = "" Then
											$erro_descricao_detalhado = "o mês não pode ser superior a 12"
										Else
											$erro_descricao_detalhado = $erro_descricao_detalhado & ", o mês não pode ser superior a 12"
										EndIf
									endif
								Else
									local $mes_2_digito = "Ok"
									local $mes_1_digito = "Ok"
								EndIf
							EndIf
						EndIf
					EndIf
				EndIf


				local $ano = $5_digito_n_data& $6_digito_n_data& $7_digito_n_data& $8_digito_n_data

				;================== verifica se o ano está entre 2010 e o ano atual ================================
				if $ano > "2009" and $ano <= @YEAR Then ; ajustar para data de inicio de funcionamento do posto
					local $digito_ano = "Ok"
				Else
					local $digito_ano = "Erro"
					if $erro_descricao_detalhado = "" Then
						$erro_descricao_detalhado = "Ano deve estar entre 2009 e "&@YEAR
					Else
						$erro_descricao_detalhado = $erro_descricao_detalhado & ", ano deve estar entre 2009 e "&@YEAR
					EndIf
				EndIf

				if $dia_1_digito = "Ok" and $dia_2_digito = "Ok" and $mes_1_digito = "Ok" and $mes_2_digito = "Ok" and $digito_ano = "Ok" Then

					valida_v2($1_digito_n_data&$2_digito_n_data, $3_digito_n_data&$4_digito_n_data, $5_digito_n_data& $6_digito_n_data& $7_digito_n_data& $8_digito_n_data)
					if $wdata = true Then
						Global $compara_data = "Ok"
					Else
						Global $compara_data = "Erro"
					EndIf

				Else
					if $fics_fila = "não" or $fics_fila = Null or $fics_fila = "" Then
						Global $compara_data = "Fila"
						global $erro_descricao = "Data inválida"
					Else
						Global $compara_data = "Erro"
					EndIf
				endif

			Else
				if $fics_fila = "não" or $fics_fila = Null or $fics_fila = "" Then
					Global $compara_data = "Fila"
					global $erro_descricao = "Campo digito da data com valor superior a 1 caracter"
				Else
					Global $compara_data = "Erro"
				EndIf
				;MsgBox(0,"","erro verificador nivel 3")

			EndIf
		Else
			if $fics_fila = "não" or $fics_fila = Null or $fics_fila = "" Then
				Global $compara_data = "Fila"
				global $erro_descricao = "Algum dos campos de digito da data não foi preenchido"
			Else
				Global $compara_data = "Erro"
			EndIf
			;MsgBox(0,"","erro verificador nivel 2")

		EndIf

	Else
		if $fics_fila = "não" or $fics_fila = Null or $fics_fila = "" Then
			Global $compara_data = "Fila"
			global $erro_descricao = "Algum dos campos de digito da data não foi reconhecido ou teve valor igual a Nulo"
		Else
			Global $compara_data = "Erro"
		EndIf
		;MsgBox(0,"","erro verificador nivel 1")


	EndIf


EndFunc

Func verifica_data()

		procura_data()

		verifica_modelo_fic_data()

		If $modelo_fic = "Antigo" Then
			procura_data_barra()
		EndIf

		procura_digitos_data()

EndFunc

while 1
sleep(200)
WEnd