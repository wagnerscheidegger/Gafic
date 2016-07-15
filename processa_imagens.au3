
Func ProcessImages($tipo_processo)

	if $tipo_processo = "carimbo" Then
		local $hora_inicio = TimerInit()
		Global $iHours = 0, $iMins = 0, $iSecs = 0
		GLOBAL $fila_list = _FileListToArray($export_imagens, "*.jpg","", true)
		local $total_fics = $fila_list[0]

		ProgressOn("Aguarde!", "Os arquivos estão sendo salvos!")
		$step = 100 / $fila_list[0]
		Assign("fics_exportadas", $fila_list[0])
		$increment = $step
		While $fila_list[0] > 0
			Local $filein = $fila_list[1]
			Local $fileout = ChangeOutputDir($fila_list[1])
			ProgressSet($increment, Round($increment) & " %")
			_ImageMagick_Addtext($filein, $fileout, $RG_numero_nomedoarquivo)

			If @error Then
				_ArrayDelete($fila_list, 1)
				$fila_list[0] -= 1
				$increment += $step
				ExitLoop
			else

;				_FileReadToArray($Arquivo_TXT_path, $prepara_log, $FRTA_NOCOUNT, ";")
;				_ArrayDisplay($prepara_log, "visualiza depois de abrir", default, 10)
;				local $index = _ArraySearch($prepara_log, $filein, 0, UBound($prepara_log,1), 0, 0, 1, 5)
;				If @error Then
;					MsgBox(0,"","esse é o index retornado: "& @error)
;				Else

;					$prepara_log[$index][5] = $fileout
;					local $prepara_log_final = $prepara_log

;					_ArrayDisplay($prepara_log_final, "visualiza depois de gravar", default, 10)
;					global $Arquivo_TXT_path = $banco_path & "\imagens_gafic.txt"
;					global $Arquivo_TXT = FileOpen($Arquivo_TXT_path, 2)
;					_FileWriteFromArray($Arquivo_TXT, $prepara_log_final, default, default, ";")
;					FileClose($Arquivo_TXT)


;					If @error Then
;						MsgBox(0,"","esse é erro retornado no filewrite: "& @error)
;					EndIf

					;_ArrayDelete($prepara_log, 0)
;				EndIf

				_ArrayDelete($fila_list, 1)
				$fila_list[0] -= 1
				$increment += $step
			EndIf
		WEnd
		ProgressSet(100 , "Pronto", "Processamento completo!")
		global $fics_fila = NUll
		GUICtrlSetData($campo_fics_fila, "")
		GUICtrlSetState($bt_verifica_fila, $GUI_HIDE )

		local $hora_final = TimerDiff($hora_inicio)
		 _TicksToTime($hora_final, $iHours, $iMins, $iSecs)
		local $tempo_processamento = StringFormat("%02d:%02d:%02d", $iHours, $iMins, $iSecs)

		ProgressOff()

		;MsgBox(0,"",$total_fics & " Fics carimbadas em: "& $tempo_processamento)
	EndIf

	if $tipo_processo = "fila" Then
		GLOBAL $fila_list = _FileListToArray($fila_imagens, "*.jpg","", true)
		if IsArray($fila_list) Then
			ProgressOn("Preparando arquivos", "Selecionando arquivos da fila.")
			$step = 100 / $fila_list[0]
			$increment = $step
			While $fila_list[0] > 0
				Local $filein = $fila_list[1]
				Local $fileout = ChangeOutputDir($fila_list[1])
				ProgressSet($increment, Round($increment) & " %")
				_ImageMagick_Quality($filein, $filein)
				If @error Then ExitLoop
				_ArrayDelete($fila_list, 1)
				$fila_list[0] -= 1
				$increment += $step
			WEnd
			ProgressSet(100 , "Pronto", "Processamento completo!")
			global $fics_fila = Null
			GUICtrlSetData($campo_fics_fila, "")
			GUICtrlSetState($bt_verifica_fila, $GUI_HIDE )
			ProgressOff()
		EndIf
	EndIf

EndFunc

Func ChangeOutputDir($fileout)
    Local $temp = StringSplit($fileout, "\")
    $fileout = $final_imagens & "\" & $temp[$temp[0]]
	Assign("RG_numero_nomedoarquivo", $temp[$temp[0]])
    Return $fileout
EndFunc