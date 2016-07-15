global $CR, $Opt_1_Menor, $Opt_1_Maior, $Opt_2_Via, $banco_path, $campo_posto, $campo_caixa, $campo_lote, $RG_numero, $imagem_path, $data_agora, $hora_agora, $sFile2, $erro_descricao, $data_atendimento, $fics_exportadas, $tempo_processamento,$tempo_processamento2, $lista, $n_fics_fila

Func Grava_log_txt()

global $Arquivo_TXT = FileOpen($Arquivo_TXT_path, 1)

	If Not FileExists($Arquivo_TXT_path) Then ; Just a check to be sure..
		FileOpen($Arquivo_TXT_path, 1)
		;MsgBox(0, "Erro ao exportar", "Erro: não foi possivel encontrar o arquivo: " & $Arquivo_TXT)
		Exit
	Else
		FileWrite($Arquivo_TXT, GUICtrlRead($campo_posto)&";")					;1 campo = Numero do Posto
		FileWrite($Arquivo_TXT, GUICtrlRead($campo_caixa)&";")					;2 campo = Numero da Caixa
		FileWrite($Arquivo_TXT, GUICtrlRead($campo_lote)&";")					;3 campo = Numero do lote
		FileWrite($Arquivo_TXT, "'"&$RG_numero&"';") 							;4 campo = Numero do RG
		FileWrite($Arquivo_TXT, $data_atendimento&";")							;5 campo = Data de Atendimento
		FileWrite($Arquivo_TXT, $data_agora&";")								;6 campo = Data de processamento

		if BitAND(GUICtrlRead($Opt_1_Menor), $GUI_CHECKED) = $GUI_CHECKED Then
			FileWrite($Arquivo_TXT, "1;")							;7 campo = Emissão 1ª Via Menor
		EndIf
		if BitAND(GUICtrlRead($Opt_1_Maior), $GUI_CHECKED) = $GUI_CHECKED Then
			FileWrite($Arquivo_TXT, "3;")							;7 campo = Emissão 1ª Via Maior
		EndIf
		if BitAND(GUICtrlRead($Opt_2_Via), $GUI_CHECKED) = $GUI_CHECKED Then
			FileWrite($Arquivo_TXT, "2;")									;7 campo = Emissão 2ª Via
		EndIf

		if BitAND(GUICtrlRead($CR), $GUI_CHECKED) = $GUI_CHECKED Then
			FileWrite($Arquivo_TXT, "-1;")										;8 campo = Criminal Verdadeiro
		Else
			FileWrite($Arquivo_TXT, "0;")										;8 campo = Criminal Falso
		EndIf

		FileWrite($Arquivo_TXT, $imagem_path & @CRLF)							;9 campo = Local da imagem
		FileClose($Arquivo_TXT)

	EndIf

EndFunc

Func Grava_lista_txt()

global $Arquivo_TXT_list = FileOpen($Arquivo_TXT_list_path, 1)

	If Not FileExists($Arquivo_TXT_list_path) Then ; Just a check to be sure..
		FileOpen($Arquivo_TXT_list_path, 1)
		;MsgBox(0, "Erro ao exportar", "Erro: não foi possivel encontrar o arquivo: " & $Arquivo_TXT)
		Exit
	Else
		FileWrite($Arquivo_TXT_list, GUICtrlRead($campo_posto)&";")
		FileWrite($Arquivo_TXT_list, $rg_numero_sem_digito&";")
		if $digito_verificador_rg = "X" Then
			FileWrite($Arquivo_TXT_list, "0;")
		Else
			FileWrite($Arquivo_TXT_list, $digito_verificador_rg&";")
		EndIf
		FileWrite($Arquivo_TXT_list, ";")
		FileWrite($Arquivo_TXT_list, $data_atendimento_sem_barra&";")
		FileWrite($Arquivo_TXT_list, GUICtrlRead($campo_caixa)&@CRLF)
		FileClose($Arquivo_TXT_list)

	EndIf

EndFunc


Func Grava_log_erro_txt()

global $Arquivo_TXT_erro = FileOpen($Arquivo_TXT_erro_path, 1)
Global $hora_agora = _Now()

	If Not FileExists($Arquivo_TXT_erro_path) Then ; Just a check to be sure..
		FileOpen($Arquivo_TXT_erro_path, 1)
		;MsgBox(0, "Erro ao exportar", "Erro: não foi possivel encontrar o arquivo: " & $Arquivo_TXT_erro)
		Exit
	Else
		FileWrite($Arquivo_TXT_erro, "========================================="& @CRLF)
		FileWrite($Arquivo_TXT_erro, "========== " & $hora_agora & " ==========" & @CRLF)
		FileWrite($Arquivo_TXT_erro, "========================================="& @CRLF)
		FileWrite($Arquivo_TXT_erro, "Arquivo: "& $sFile2 & @CRLF)
		FileWrite($Arquivo_TXT_erro, "Erro: " & $erro_descricao & @CRLF)
		if $erro_descricao_detalhado <> "" Then
			FileWrite($Arquivo_TXT_erro, "Erro detalhado: " & $erro_descricao_detalhado & @CRLF)
		Endif
		FileWrite($Arquivo_TXT_erro, "========================================="& @CRLF& @CRLF)
		FileClose($Arquivo_TXT_erro)

	EndIf

EndFunc

Func Grava_log_report_txt($tipo)

global $Arquivo_TXT_report = FileOpen($Arquivo_TXT_report_path, 1)
Global $hora_agora = _Now()

if $tipo = "Sucesso" Then
	If Not FileExists($Arquivo_TXT_report_path) Then ; Just a check to be sure..
		FileOpen($Arquivo_TXT_report_path, 1)
		;MsgBox(0, "Erro ao exportar", "Erro: não foi possivel encontrar o arquivo: " & $Arquivo_TXT_report)
		Exit
	Else
		FileWrite($Arquivo_TXT_report, "========================================="& @CRLF)
		FileWrite($Arquivo_TXT_report, "========== " & $hora_agora & " ==========" & @CRLF)
		FileWrite($Arquivo_TXT_report, "========================================="& @CRLF)
		FileWrite($Arquivo_TXT_report, "Fics Exportadas: "& $fics_exportadas& @CRLF)
		FileWrite($Arquivo_TXT_report, "Tempo OCR: "& $tempo_processamento& @CRLF)
		FileWrite($Arquivo_TXT_report, "Tempo Total: "&$tempo_processamento2& @CRLF)
		FileWrite($Arquivo_TXT_report, "Lista: " & $lista & @CRLF)
		FileWrite($Arquivo_TXT_report, "========================================="& @CRLF& @CRLF)
		FileClose($Arquivo_TXT_report)

	EndIf
EndIf

if $tipo = "Fila" Then
	If Not FileExists($Arquivo_TXT_report_path) Then ; Just a check to be sure..
		FileOpen($Arquivo_TXT_report_path, 1)
		;MsgBox(0, "Erro ao exportar", "Erro: não foi possivel encontrar o arquivo: " & $Arquivo_TXT_report)
		Exit
	Else
		FileWrite($Arquivo_TXT_report, "========================================="& @CRLF)
		FileWrite($Arquivo_TXT_report, "========== " & $hora_agora & " ==========" & @CRLF)
		FileWrite($Arquivo_TXT_report, "========================================="& @CRLF)
		FileWrite($Arquivo_TXT_report, "Fics processadas no 1º OCR: "& $fics_exportadas & @CRLF)
		FileWrite($Arquivo_TXT_report, "Fics pendentes: "& $n_fics_fila & @CRLF)
		FileWrite($Arquivo_TXT_report, "Tempo OCR: "& $tempo_processamento& @CRLF)
		FileWrite($Arquivo_TXT_report, "Lista: " & $lista & @CRLF)
		FileWrite($Arquivo_TXT_report, "========================================="& @CRLF& @CRLF)
		FileClose($Arquivo_TXT_report)

	EndIf
EndIf

if $tipo = "2 Passada" Then
	If Not FileExists($Arquivo_TXT_report_path) Then ; Just a check to be sure..
		FileOpen($Arquivo_TXT_report_path, 1)
		;MsgBox(0, "Erro ao exportar", "Erro: não foi possivel encontrar o arquivo: " & $Arquivo_TXT_report)
		Exit
	Else
		FileWrite($Arquivo_TXT_report, "========================================="& @CRLF)
		FileWrite($Arquivo_TXT_report, "========== " & $hora_agora & " ==========" & @CRLF)
		FileWrite($Arquivo_TXT_report, "========================================="& @CRLF)
		FileWrite($Arquivo_TXT_report, "Fics Exportadas: "& $fics_exportadas & @CRLF)
		FileWrite($Arquivo_TXT_report, "Tempo 2º OCR: "& $tempo_processamento& @CRLF)
		FileWrite($Arquivo_TXT_report, "Tempo Total: "&$tempo_processamento2& @CRLF)
		FileWrite($Arquivo_TXT_report, "Lista: " & $lista & @CRLF)
		FileWrite($Arquivo_TXT_report, "========================================="& @CRLF& @CRLF)
		FileClose($Arquivo_TXT_report)

	EndIf
EndIf

if $tipo = "Simples" Then
	If Not FileExists($Arquivo_TXT_report_path) Then ; Just a check to be sure..
		FileOpen($Arquivo_TXT_report_path, 1)
		;MsgBox(0, "Erro ao exportar", "Erro: não foi possivel encontrar o arquivo: " & $Arquivo_TXT_report)
		Exit
	Else
		FileWrite($Arquivo_TXT_report, "========================================="& @CRLF)
		FileWrite($Arquivo_TXT_report, "========== " & $hora_agora & " ==========" & @CRLF)
		FileWrite($Arquivo_TXT_report, "========================================="& @CRLF)
		FileWrite($Arquivo_TXT_report, "Fics Exportadas!"& @CRLF)
		FileWrite($Arquivo_TXT_report, "Tempo OCR: "& $tempo_processamento& @CRLF)
		FileWrite($Arquivo_TXT_report, "Tempo Total: "&$tempo_processamento2& @CRLF)
		FileWrite($Arquivo_TXT_report, "RG: " & $RG_numero & @CRLF)
		FileWrite($Arquivo_TXT_report, "========================================="& @CRLF& @CRLF)
		FileClose($Arquivo_TXT_report)

	EndIf
EndIf


EndFunc