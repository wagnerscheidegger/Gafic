global $campo_posto, $campo_caixa, $RG_numero, $imagem_path, $data_agora, $data_atendimento, $Arquivo_TXT_list_path, $lista_arquivos

Func Grava_log_excel()

	Local $Arquivo_Excel = @ScriptDir & "\Banco\imagens_gafic.xlsx" ; Change this to the path/name of your Excel sheet
	Local $sCellRange1 = "A" ; Campo código
	Local $sCellRange2 = "B" ; Campo Posto_n
	Local $sCellRange3 = "C" ; Campo Caixa_n
	Local $sCellRange4 = "D" ; Campo Numero_RG
	Local $sCellRange5 = "E" ; Campo Data_atendimento
	Local $sCellRange6 = "F" ; Campo Data_arquivamento
	Local $sCellRange7 = "G" ; Campo Imagem_path


	If Not FileExists($Arquivo_Excel) Then ; Just a check to be sure..
		MsgBox($MB_SYSTEMMODAL, "Excel Data Test", "Error: Can't find file " & $Arquivo_Excel)
		Exit
	EndIf

	Global $oExcelDoc = ObjGet($Arquivo_Excel) ; Get an Excel Object from an existing filename

	If (Not @error) And IsObj($oExcelDoc) Then ; Check again If everything went well
		; NOTE: $oExcelDoc is a "Workbook Object", Not Excel itself!
		Local $oDocument = $oExcelDoc.Worksheets(1) ; We use the 'Default' worksheet

	For $i = 2 To 100000 step 1
		if $oDocument.range($sCellRange1&$i).value <> "" Then
		ElseIf $oDocument.range($sCellRange1&$i).value = "" Then
			$oDocument.range($sCellRange1&$i).value = $i-1 ; escreve o valor da celula referente ao campo código
			$oDocument.range($sCellRange2&$i).value = GUICtrlRead($campo_posto) ; escreve o valor da celula referente ao campo Posto_n
			$oDocument.range($sCellRange3&$i).value = GUICtrlRead($campo_caixa); escreve o valor da celula referente ao campo Caixa_n
			$oDocument.range($sCellRange4&$i).value = "'"&$RG_numero ; escreve o valor da celula referente ao campo Numero_rg
			$oDocument.range($sCellRange5&$i).value = $data_atendimento ; escreve o valor da celula referente ao campo Data_atendimento
			$oDocument.range($sCellRange6&$i).value = $data_agora ; escreve o valor da celula referente ao campo Data_arquivamento
			$oDocument.range($sCellRange7&$i).value = $imagem_path ; escreve o valor da celula referente ao campo Imagem_path
			$fics_exportadas = $i-1
			ExitLoop
		EndIf
	Next
			$oExcelDoc.Windows(1).Visible = True ; Otherwise the worksheet window will be saved 'hidden'
			$oExcelDoc.Save ; Save the workbook

		$oExcelDoc.saved = 1 ; Prevent questions from excel to save the file
		$oExcelDoc.close ; Get rid of Excel.
	Else
		MsgBox($MB_SYSTEMMODAL, "Excel Data Test", "Error: Could Not open " & $Arquivo_Excel & " as an Excel Object.")
	EndIf

	$oExcelDoc = 0
EndFunc

Func Export_lista_excel()
	Global $oExcelDoc
	local $lista_rg[0][6], $lista_data[0], $lista_ano[0], $lista_data_e_ano[0], $lista_mes, $lista_posto[0]
	$numero_caixa = _FileListToArray($iniArray[5][1], "*", $FLTA_FOLDERS, false)
	if IsArray($numero_caixa) Then

		For $i = 1 to $numero_caixa[0] step 1
			_FileReadToArray($Arquivo_TXT_list_path, $lista_arquivos, $FRTA_COUNT, ";")

			if IsArray($lista_arquivos) Then
				ProgressOn("Aguarde!", "Gerando lista da Caixa: "&$numero_caixa[$i], "", default, default, $DLG_MOVEABLE)
				$step = 100 / $lista_arquivos[0][0]
				$increment = $step
				$registro = 1
				For $j = 1 to $lista_arquivos[0][0] step 1
					ProgressSet($increment, Round($increment) & " %")
					$index = _ArraySearch($lista_arquivos, $numero_caixa[$i], 0, $lista_arquivos[0][0], 0, 0, 1, 5,False)
					if Not @error then
						$registro += 1

						If $console = "Yes" then ConsoleWrite("registros encontrados: "& $registro& ', na caixa: '&$numero_caixa[$i]&@CRLF)
						_ArrayAdd($lista_rg, $lista_arquivos[$index][0]& "|"&$lista_arquivos[$index][1]& "|"&$lista_arquivos[$index][2]& "|"&$lista_arquivos[$index][3]& "|"&$lista_arquivos[$index][4]& "|"&$lista_arquivos[$index][5], 0, default, default, 6)
						_ArrayAdd($lista_data, StringRight(StringLeft($lista_arquivos[$index][4],4),2))
						_ArrayAdd($lista_ano, StringRight($lista_arquivos[$index][4],4))
						_ArrayAdd($lista_data_e_ano, StringRight($lista_arquivos[$index][4],6), 0, default, default, 6)
						_arrayadd($lista_posto, $lista_arquivos[$index][0])
						if $mensagens = "Yes" Then _ArrayDisplay($lista_rg, "lista_rg adicionado todas as colunas", 10)
						_ArrayDelete($lista_arquivos, $index)
						_ArraySort($lista_rg, 0, 0, 0, 1)
						if $mensagens = "Yes" then _ArrayDisplay($lista_rg, "lista_rg depois de classificado pelo numero do rg", 10)

					EndIf
					$lista_arquivos[0][0] -= 1
					$increment += $step

				;ConsoleWrite($lista_arquivos[$index][0]&"-"&$lista_arquivos[$index][1]&"-"&$lista_arquivos[$index][2]&"-"&$lista_arquivos[$index][3]&"-"&$lista_arquivos[$index][4]&"-"&$lista_arquivos[$index][5]&@CRLF)
				Next
				ProgressSet(100 , "Pronto", "Processamento completo!")
				ProgressOff()

				$oExcelDoc = ObjCreate("Excel.Application") ;_Excel_Open()
				local $excel_planilha = _Excel_BookNew($oExcelDoc,1)
				Local $oDocument = $oExcelDoc.Worksheets(1) ; We use the 'Default' worksheet
				Local $sCellRange1 = "A" ; Campo Posto_n
				Local $sCellRange2 = "B" ; Campo Numero_RG sem digito
				Local $sCellRange3 = "C" ; Campo digito RG
				Local $sCellRange4 = "D" ; Campo digito 2 RG
				Local $sCellRange5 = "E" ; Campo Data_atendimento
				Local $sCellRange6 = "F" ; Campo Caixa

				$RG_Max = _ArrayMax($lista_rg, 1, -1, -1, 1)
				$RG_Min = _arrayMin($lista_rg, 1, -1, -1, 1)
				ProgressOn("Aguarde!", "Gravando lista da Caixa: "&$numero_caixa[$i], "", default, default, $DLG_MOVEABLE)
				$total_linhas = UBound($lista_rg)
				$step = 100 / $total_linhas
				$increment = $step

				For $k = 1 to $total_linhas step 1
					If $console = "Yes" then ConsoleWrite("adicionando registro "&$k&" ao Excel"&@CRLF)
					ProgressSet($increment, Round($increment) & " %")
					if $oDocument.range($sCellRange1&$k).value <> "" Then
					ElseIf $oDocument.range($sCellRange1&$k).value = "" Then
						$oDocument.range($sCellRange1&$k).value = $lista_rg[$k-1][0] ; escreve o valor da celula referente ao Campo Posto_n
						$oDocument.range($sCellRange2&$k).value = $lista_rg[$k-1][1] ; escreve o valor da celula referente ao Campo Numero_RG sem digito
						$oDocument.range($sCellRange3&$k).value = $lista_rg[$k-1][2] ; escreve o valor da celula referente ao Campo digito RG
						$oDocument.range($sCellRange4&$k).value = $lista_rg[$k-1][3]  ; escreve o valor da celula referente ao Campo digito 2 RG
						$oDocument.range($sCellRange5&$k).NumberFormat = "@"
						$oDocument.range($sCellRange5&$k).value = $lista_rg[$k-1][4]  ; escreve o valor da celula referente ao Campo Data_atendimento
						$oDocument.range($sCellRange6&$k).value = $lista_rg[$k-1][5]  ; escreve o valor da celula referente ao Campo Caixa
						;ExitLoop
					EndIf

					$total_linhas -= 1
					$increment += $step


				Next

				ProgressSet(100 , "Pronto", "Processamento completo!")
				ProgressOff()
				;_ArrayDisplay($lista_data, "Lista de datas por caixa", 10)
				Local $lista_data_unica = _ArrayUnique($lista_data)
				;_ArrayDisplay($lista_ano, "Lista de anos por caixa", 10)
				Local $lista_ano_unica = _ArrayUnique($lista_ano)
				;_arraydisplay($lista_data_e_ano, "Lista data e ano")
				_ArraySort($lista_ano_unica, 0, 1, $lista_ano_unica[0])
				if $mensagens = "Yes" then _ArrayDisplay($lista_ano_unica, "filtrando registros de anos duplicados")
				if $mensagens = "Yes" then _ArrayDisplay($lista_data_unica, "filtrando registros de meses duplicados")
				local $lista_data_e_ano_unica = _ArrayUnique($lista_data_e_ano)
				if $mensagens = "Yes" Then _arraydisplay($lista_data_e_ano_unica, "filtrando data e ano")
				local $lista_data_ano_sort_2d[0][2]

				for $j = 1 to $lista_data_e_ano_unica[0] step 1

					_ArrayAdd($lista_data_ano_sort_2d, stringleft($lista_data_e_ano_unica[$j], 2)&"|"&StringRight($lista_data_e_ano_unica[$j], 4))
					if @error then ConsoleWrite("Erro do arrayadd: "&@error&@CRLF)
					;_arraydisplay($lista_data_ano_sort_2d, "1 por 1")
					If $console = "Yes" then ConsoleWrite("J = "&$j&", adicionando "&stringleft($lista_data_e_ano_unica[$j], 2)&" a coluna 0 e "&StringRight($lista_data_e_ano_unica[$j], 4)&" a coluna 1"&@CRLF)

				Next

				if isArray($lista_data_ano_sort_2d) = true Then
					If $console = "Yes" then consolewrite("é array"&@CRLF)
					if $mensagens = "Yes" then _ArrayDisplay($lista_data_ano_sort_2d, "data e ano separado em colunas")
					_ArraySort($lista_data_ano_sort_2d)
					If $console = "Yes" then consolewrite("organizado $lista_data_ano_sort_2d")
					if $mensagens = "Yes" then _ArrayDisplay($lista_data_ano_sort_2d, "data e ano organizado e separado em colunas")
					$excluir = "1-"&$lista_data_e_ano_unica[0]
					_ArrayDelete($lista_data_e_ano_unica, $excluir)
					;$lista_data_e_ano_unica[0] = UBound($lista_data_ano_sort_2d, $UBOUND_ROWS)
					if $mensagens = "Yes" then _ArrayDisplay($lista_data_e_ano_unica, "depois do array delete")
					For $j2 = 1 to $lista_data_e_ano_unica[0] step 1
						$j3 = $j2-1
						$lista = $lista_data_ano_sort_2d[$j3][0]&$lista_data_ano_sort_2d[$j3][1]
						_ArrayAdd($lista_data_e_ano_unica, $lista)
					if $mensagens = "Yes" then 	_ArrayDisplay($lista_data_e_ano_unica, "1 por 1 organizado")
					Next

					if $mensagens = "Yes" then _arraydisplay($lista_data_e_ano_unica, "Data e ano concatenados e organizados")

				Else
					If $console = "Yes" then consolewrite("não é array"&@CRLF)

				EndIf



				if $lista_ano_unica[0] > 1 Then
					for $k = 1 to $lista_ano_unica[0] step 1
						for $k2 = 1 to $lista_data_e_ano_unica[0] step 1
							if $lista_mes = "" or $lista_mes = Null Then
								If $console = "Yes" then ConsoleWrite("valor da lista_ano_unica[k="&$k&"]: "& $lista_ano_unica[$k]&@CRLF)
								$k3 = _ArraySearch($lista_data_e_ano_unica, $lista_ano_unica[$k], 0, $lista_data_e_ano_unica[0], 0, 1, 1, 0, False)
								if @error Then
									If $console = "Yes" then ConsoleWrite("erro no k3: "&@error&@CRLF)
								Else
									If $console = "Yes" then ConsoleWrite("valor do stringleft: "&stringleft($lista_data_e_ano_unica[$k3], 2)& " - valor da var k3: "&$k3&@CRLF)
									if StringLeft($lista_data_e_ano_unica[$k3], 2) = "01" then $lista_mes = "JAN-"
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "02" then $lista_mes = "FEV-"
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "03" then $lista_mes = "MAR-"
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "04" then $lista_mes = "ABR-"
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "05" then $lista_mes = "MAI-"
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "06" then $lista_mes = "JUN-"
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "07" then $lista_mes = "JUL-"
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "08" then $lista_mes = "AGO-"
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "09" then $lista_mes = "SET-"
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "10" then $lista_mes = "OUT-"
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "11" then $lista_mes = "NOV-"
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "12" then $lista_mes = "DEZ-"
									_ArrayDelete($lista_data_e_ano_unica, $k3)
									If $console = "Yes" then ConsoleWrite("valor do lista_mes: "& $lista_mes & @CRLF)

								EndIf

							Else
								ConsoleWrite("valor da lista_ano_unica[k="&$k&"]: "& $lista_ano_unica[$k]&@CRLF)
								$k3 = _ArraySearch($lista_data_e_ano_unica, $lista_ano_unica[$k], 0, $lista_data_e_ano_unica[0], 0, 1, 1, 0, False)
								if @error Then
									If $console = "Yes" then ConsoleWrite("erro no k3 do else: "&@error&@CRLF)
								Else
									If $console = "Yes" then ConsoleWrite("valor do stringleft: "&stringleft($lista_data_e_ano_unica[$k3], 2)& " - valor da var k3 no else: "&$k3&@CRLF)
									if StringLeft($lista_data_e_ano_unica[$k3], 2) = "01" then $lista_mes = $lista_mes &"JAN-";&stringRight($lista_data_e_ano_unica[$k], 4)
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "02" then $lista_mes = $lista_mes &"FEV-";&stringRight($lista_data_e_ano_unica[$k], 4)
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "03" then $lista_mes = $lista_mes &"MAR-";&stringRight($lista_data_e_ano_unica[$k], 4)
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "04" then $lista_mes = $lista_mes &"ABR-";&stringRight($lista_data_e_ano_unica[$k], 4)
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "05" then $lista_mes = $lista_mes &"MAI-";&stringRight($lista_data_e_ano_unica[$k], 4)
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "06" then $lista_mes = $lista_mes &"JUN-";&stringRight($lista_data_e_ano_unica[$k], 4)
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "07" then $lista_mes = $lista_mes &"JUL-";&stringRight($lista_data_e_ano_unica[$k], 4)
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "08" then $lista_mes = $lista_mes &"AGO-";&stringRight($lista_data_e_ano_unica[$k], 4)
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "09" then $lista_mes = $lista_mes &"SET-";&stringRight($lista_data_e_ano_unica[$k], 4)
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "10" then $lista_mes = $lista_mes &"OUT-";&stringRight($lista_data_e_ano_unica[$k], 4)
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "11" then $lista_mes = $lista_mes &"NOV-";&stringRight($lista_data_e_ano_unica[$k], 4)
									if stringleft($lista_data_e_ano_unica[$k3], 2) = "12" then $lista_mes = $lista_mes &"DEZ-";&stringRight($lista_data_e_ano_unica[$k], 4)
									_ArrayDelete($lista_data_e_ano_unica, $k3)
									$lista_data_e_ano_unica[0] -= 1
									If $console = "Yes" then ConsoleWrite("valor do lista_mes: "& $lista_mes & @CRLF)
								EndIf

							EndIf
						Next
						if $k = $lista_ano_unica[0] Then
							$lista_mes = $lista_mes &$lista_ano_unica[$k]
						Else
							$lista_mes = $lista_mes &$lista_ano_unica[$k]&"-"
						EndIf


					Next

					$nome_do_arquivo_excel = "CX "&$numero_caixa[$i]&"-CID ADEMAR-"&$lista_posto[0]&"-RG-"&$RG_Min&"-ATE-"&$RG_Max&"-"&$lista_mes

				Else

					if $lista_data_unica[0] > 1 Then
						For $w = 1 to $lista_data_unica[0] step 1
							If $console = "Yes" then ConsoleWrite("var "&$w&@CRLF)
							if $lista_mes = "" or $lista_mes = Null Then
								if string($lista_data_unica[$w]) = "01" then $lista_mes = "JAN-"
								if string($lista_data_unica[$w]) = "02" then $lista_mes = "FEV-"
								if string($lista_data_unica[$w]) = "03" then $lista_mes = "MAR-"
								if string($lista_data_unica[$w]) = "04" then $lista_mes = "ABR-"
								if string($lista_data_unica[$w]) = "05" then $lista_mes = "MAI-"
								if string($lista_data_unica[$w]) = "06" then $lista_mes = "JUN-"
								if string($lista_data_unica[$w]) = "07" then $lista_mes = "JUL-"
								if string($lista_data_unica[$w]) = "08" then $lista_mes = "AGO-"
								if string($lista_data_unica[$w]) = "09" then $lista_mes = "SET-"
								if string($lista_data_unica[$w]) = "10" then $lista_mes = "OUT-"
								if string($lista_data_unica[$w]) = "11" then $lista_mes = "NOV-"
								if string($lista_data_unica[$w]) = "12" then $lista_mes = "DEZ-"
								;_arraydelete($lista_data_unica, $w)
							Else
								if string($lista_data_unica[eval('w')]) = "01" then $lista_mes = $lista_mes & "JAN-"
								if string($lista_data_unica[eval('w')]) = "02" then $lista_mes = $lista_mes & "FEV-"
								if string($lista_data_unica[eval('w')]) = "03" then $lista_mes = $lista_mes & "MAR-"
								if string($lista_data_unica[eval('w')]) = "04" then $lista_mes = $lista_mes & "ABR-"
								if string($lista_data_unica[eval('w')]) = "05" then $lista_mes = $lista_mes & "MAI-"
								if string($lista_data_unica[eval('w')]) = "06" then $lista_mes = $lista_mes & "JUN-"
								if string($lista_data_unica[eval('w')]) = "07" then $lista_mes = $lista_mes & "JUL-"
								if string($lista_data_unica[eval('w')]) = "08" then $lista_mes = $lista_mes & "AGO-"
								if string($lista_data_unica[eval('w')]) = "09" then $lista_mes = $lista_mes & "SET-"
								if string($lista_data_unica[eval('w')]) = "10" then $lista_mes = $lista_mes & "OUT-"
								if string($lista_data_unica[eval('w')]) = "11" then $lista_mes = $lista_mes & "NOV-"
								if string($lista_data_unica[eval('w')]) = "12" then $lista_mes = $lista_mes & "DEZ-"
								;_arraydelete($lista_data_unica, $w)
							EndIf

						Next
					Else
						if $lista_data_unica[1] = "01" then $lista_mes = "JAN-"
						if $lista_data_unica[1] = "02" then $lista_mes = "FEV-"
						if $lista_data_unica[1] = "03" then $lista_mes = "MAR-"
						if $lista_data_unica[1] = "04" then $lista_mes = "ABR-"
						if $lista_data_unica[1] = "05" then $lista_mes = "MAI-"
						if $lista_data_unica[1] = "06" then $lista_mes = "JUN-"
						if $lista_data_unica[1] = "07" then $lista_mes = "JUL-"
						if $lista_data_unica[1] = "08" then $lista_mes = "AGO-"
						if $lista_data_unica[1] = "09" then $lista_mes = "SET-"
						if $lista_data_unica[1] = "10" then $lista_mes = "OUT-"
						if $lista_data_unica[1] = "11" then $lista_mes = "NOV-"
						if $lista_data_unica[1] = "12" then $lista_mes = "DEZ-"
					EndIf

					$nome_do_arquivo_excel = "CX "&$numero_caixa[$i]&"-CID ADEMAR-"&$lista_posto[0]&"-RG-"&$RG_Min&"-ATE-"&$RG_Max&"-"&$lista_mes&$lista_ano_unica[1]
				EndIf

				If $console = "Yes" then ConsoleWrite("rg máximo: "&$RG_Max&", rg minimo: "&$RG_Min&@CRLF)
				If $console = "Yes" then ConsoleWrite("meses: "&$lista_mes&@CRLF)
				If $console = "Yes" then ConsoleWrite("nome do arquivo: "&$nome_do_arquivo_excel&@CRLF)
				$oExcelDoc.Visible = false ; Otherwise the worksheet window will be saved 'hidden'
				local $excel_arquivo = $banco_path&"\"&$nome_do_arquivo_excel
				;$oExcelDoc.Saved($excel_arquivo) ; Save the workbook

				_Excel_BookSaveAs($excel_planilha, $excel_arquivo, $xlWorkbookDefault, true)
				_Excel_BookClose($excel_planilha, true)

				_GUICtrlStatusBar_SetText($hStatus, "Salvo: "& $nome_do_arquivo_excel) ;display in status bar o nome do arquivo salvo
				$ahIcons[0] = _WinAPI_LoadShell32Icon(23) ;carrega primeiro icone no Statusbar
				$ahIcons[1] = _WinAPI_LoadShell32Icon(40) ;carrega segundo icone no Statusbar
				_GUICtrlStatusBar_SetIcon($hStatus, 0, $ahIcons[0]) ;exibe primeiro icone no Statusbar
				_GUICtrlStatusBar_SetIcon($hStatus, 1, $ahIcons[1]) ;exibe primeiro icone no Statusbar
				_GUICtrlStatusBar_SetText($hStatus, "Sucesso!", 1) ;display in status bar
				;$oExcelDoc.saved = 1 ; Prevent questions from excel to save the file
				;$oExcelDoc.close ; Get rid of Excel.
				;$oExcelDoc = 0

				local $lista_rg[0][6], $lista_data[0], $lista_ano[0], $lista_data_e_ano[0], $lista_posto[0]

				_Excel_Close($oExcelDoc, true, true)
			EndIf
		;ProgressSet(100 , "Pronto", "Processamento completo!")
		;ProgressOff()
		Next


	EndIf

EndFunc

