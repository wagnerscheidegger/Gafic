#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Version=Beta
#AutoIt3Wrapper_Res_Comment=Gerenciador de Arquivamento de FIC
#AutoIt3Wrapper_Res_Description=20/05/2016
#AutoIt3Wrapper_Res_Fileversion=1.9.1.0
#AutoIt3Wrapper_Res_LegalCopyright=Desenvolvido por Wagner Scheidegger
#AutoIt3Wrapper_Res_Language=1046
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; *** Start added by AutoIt3Wrapper ***
#include <StringConstants.au3>
; *** End added by AutoIt3Wrapper ***

#include <Constants.au3>
#include <GUIConstantsEx.au3>
#include <GuiConstants.au3>
;#include <GDIPlus.au3> ; substituido pelo alterado
#include <MsgBoxConstants.au3>
#include <FileConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <AutoItConstants.au3>
#include <File.au3>
#include <Array.au3>
#include <String.au3>
#include <Date.au3>
#include <WinAPIFiles.au3>
#include <WinAPI.au3>
#include <WinAPIDiag.au3>
#include <GuiStatusBar.au3>
#include <Excel.au3>
#include <Color.au3>
#include <WinAPIGdi.au3>

#include "load_variaveis.au3"
#include "ScreenCapture.au3"
#include "load_ini.au3"
#include "export_excel.au3"
#include "export_txt.au3"
#include "load_bases.au3"
#include "form_visualizador_fic.au3"
#include "login.au3"
#include "add_referencia.au3"
#include "menu_adm.au3"
#Include "GDIPlus_alterado.au3"
#Include "negative.au3"

;=======================pushbullet==============

global $PushBullettoken = "IWr5YyACf4GMA06kqwqGBwHKdfhb2wCi"
#include "push.au3"
global $pTitle, $pMessage, $oHTTP

;===================fim pushbullet==============

;======================= Image Magick =================
#include "image_magick.au3"
#include "processa_imagens.au3"
;=============== Fim Image Magick ===================

Load_form_login()

#include "verifica_digitos.au3"
#include "verifica_data.au3"

Func Menu()
	Opt("GUIOnEventMode", 1)
	;Opt("WinWaitDelay", 60000)
	Global $Form1 = GUICreate("GAFIC", 452, 289, 504, 257)
	$Group6 = GUICtrlCreateGroup("Executar", 16, 48, 217, 209)
	Global $campo_Caixa = GUICtrlCreateInput("", 26, 104, 89, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_UPPERCASE))
	Global $campo_lote = GUICtrlCreateInput("", 127, 104, 89, 21)
	Global $Opt_Arquivo = GUICtrlCreateRadio("Arquivo", 24, 136, 65, 17)
	Global $Opt_Lote = GUICtrlCreateRadio("Lote", 92, 136, 41, 17)
	Global $Opt_doc = GUICtrlCreateRadio("Documento", 144, 136, 81, 17)
	$Group7 = GUICtrlCreateGroup("Emissão", 24, 160, 193, 65)
	Global $Opt_1_Menor = GUICtrlCreateRadio("1º Via Menor", 32, 176, 81, 17)
	Global $Opt_1_Maior = GUICtrlCreateRadio("1º Via Maior", 136, 176, 81, 17)
	Global $Opt_2_Via = GUICtrlCreateRadio("2º Via", 32, 200, 65, 17)
	Global $CR = GUICtrlCreateCheckbox("Criminal", 136, 200, 73, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Global $Button1 = GUICtrlCreateButton("Buscar", 24, 232, 195, 17)
	Global $Campo_Posto = GUICtrlCreateLabel("81109", 88, 64, 36, 17)
	$Label25 = GUICtrlCreateLabel("Posto:", 40, 64, 34, 16)
	$Label26 = GUICtrlCreateLabel("Caixa N:", 48, 88, 44, 16)
	$Label1 = GUICtrlCreateLabel("Lote N:", 152, 88, 39, 16)
	$Label2 = GUICtrlCreateLabel("Cidade Ademar", 136, 64, 76, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Group5 = GUICtrlCreateGroup("Arquivos", 248, 48, 185, 209)
	Global $Bt_processados = GUICtrlCreateButton("Liberar Processados", 256, 176, 80, 33, $BS_MULTILINE)
	Global $Bt_export_list = GUICtrlCreateButton("Exportar Lista de Envio", 344, 176, 75, 33, $BS_MULTILINE)
	Global $Bt_verifica_fila = GUICtrlCreateButton("Verificar Fila", 256, 224, 112, 25)
	Global $CHk_verifica_Filtro = GUICtrlCreateCheckbox("Filtro?", 376, 224, 49, 25, BitOR($GUI_SS_DEFAULT_CHECKBOX,$BS_RIGHT))
	$Label22 = GUICtrlCreateLabel("Processados:", 264, 80, 68, 17)
	$Label23 = GUICtrlCreateLabel("Em Fila:", 264, 104, 41, 17)
	$Label24 = GUICtrlCreateLabel("Finalizadas:", 264, 128, 62, 17)
	Global $Lbl_Processadas = GUICtrlCreateLabel("", 344, 80, 30, 17)
	Global $Lbl_fila = GUICtrlCreateLabel("", 344, 104, 30, 17)
	Global $Lbl_finalizadas = GUICtrlCreateLabel("", 344, 128, 30, 17)
	Global $lbl_ratio_p = GUICtrlCreateLabel("", 392, 80, 20, 17)
	Global $lbl_ratio_f = GUICtrlCreateLabel("", 392, 104, 20, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$Label3 = GUICtrlCreateLabel("Gerenciador de Arquivamento de FIC", 72, 8, 319, 28)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	global $hStatus  = _GUICtrlStatusBar_Create($Form1)
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	GUISetState(@SW_SHOW)
	GUICtrlSetState($bt_verifica_fila, $GUI_HIDE )
	GUICtrlSetState($CHk_verifica_Filtro, $GUI_HIDE)
	GUICtrlSetState($Bt_processados, $GUI_HIDE)
	GUICtrlSetState($Bt_export_list, $GUI_HIDE)
	GUICtrlSetState($Opt_2_Via, $GUI_CHECKED)
	GUICtrlSetState($opt_arquivo, $GUI_CHECKED)

	;HotKeySet("{enter}", "abrir")

	GUICtrlSetOnEvent($Button1, "abrir")
	GUICtrlSetOnEvent($bt_verifica_fila, "fila")
	GUICtrlSetOnEvent($Bt_processados, "libera_processadas")
	GUICtrlSetOnEvent($Bt_export_list, "Export_lista_excel")
	GUISetOnEvent($GUI_EVENT_CLOSE, "sair_principal")

EndFunc

Func abrir()

	If BitAND(GUICtrlRead($opt_arquivo), $GUI_CHECKED) = $GUI_CHECKED Then
		If BitAND(GUICtrlRead($Opt_1_Menor), $GUI_UNCHECKED) = $GUI_UNCHECKED and BitAND(GUICtrlRead($Opt_1_Maior), $GUI_UNCHECKED) = $GUI_UNCHECKED and BitAND(GUICtrlRead($Opt_2_Via), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
			Msgbox(0,"","Por favor selecione uma opção para 1ª Via ou 2ª Via")
		else
			if GUICtrlRead($campo_Caixa) = "" Then
				Msgbox(0,"","Por favor informe o numero da caixa!")
			Else
				if DirGetSize($iniArray[3][1]&"\"&GUICtrlRead($campo_Caixa,1)) <> -1 and DirGetSize($iniArray[4][1]&"\"&GUICtrlRead($campo_Caixa,1)) <> -1 and DirGetSize($iniArray[5][1]&"\"&GUICtrlRead($campo_Caixa,1)) <> -1 Then
					If $console = "Yes" then ConsoleWrite("a Pasta: "&$iniArray[3][1]&"\"&GUICtrlRead($campo_Caixa,1)&" já existe!")
				Else
					DirCreate($iniArray[3][1]&"\"&GUICtrlRead($campo_Caixa,1))
					DirCreate($iniArray[4][1]&"\"&GUICtrlRead($campo_Caixa,1))
					DirCreate($iniArray[5][1]&"\"&GUICtrlRead($campo_Caixa,1))
				EndIf
				$export_imagens = $iniArray[3][1]&"\"&GUICtrlRead($campo_Caixa,1)
				$fila_imagens = $iniArray[4][1]&"\"&GUICtrlRead($campo_Caixa,1)
				$final_imagens = $iniArray[5][1]&"\"&GUICtrlRead($campo_Caixa,1)
				abre_arquivo("normal")
			EndIf
		EndIf

	ElseIf BitAND(GUICtrlRead($opt_lote), $GUI_CHECKED) = $GUI_CHECKED Then
		If BitAND(GUICtrlRead($Opt_1_Menor), $GUI_UNCHECKED) = $GUI_UNCHECKED and BitAND(GUICtrlRead($Opt_1_Maior), $GUI_UNCHECKED) = $GUI_UNCHECKED and BitAND(GUICtrlRead($Opt_2_Via), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
			Msgbox(0,"","Por favor selecione uma opção para 1ª Via ou 2ª Via")
		else
			if GUICtrlRead($campo_Caixa) = "" Then
				Msgbox(0,"","Por favor informe o numero da caixa!")
			Else
				if DirGetSize($iniArray[3][1]&"\"&GUICtrlRead($campo_Caixa,1)) <> -1 and DirGetSize($iniArray[4][1]&"\"&GUICtrlRead($campo_Caixa,1)) <> -1 and DirGetSize($iniArray[5][1]&"\"&GUICtrlRead($campo_Caixa,1)) <> -1 Then
					If $console = "Yes" then ConsoleWrite("a Pasta: "&$iniArray[3][1]&"\"&GUICtrlRead($campo_Caixa,1)&" já existe!")
				Else
					DirCreate($iniArray[3][1]&"\"&GUICtrlRead($campo_Caixa,1))
					DirCreate($iniArray[4][1]&"\"&GUICtrlRead($campo_Caixa,1))
					DirCreate($iniArray[5][1]&"\"&GUICtrlRead($campo_Caixa,1))
				EndIf
				$export_imagens = $iniArray[3][1]&"\"&GUICtrlRead($campo_Caixa,1)
				$fila_imagens = $iniArray[4][1]&"\"&GUICtrlRead($campo_Caixa,1)
				$final_imagens = $iniArray[5][1]&"\"&GUICtrlRead($campo_Caixa,1)
				abre_lote("normal")
			EndIf
		EndIf

	ElseIf BitAND(GUICtrlRead($opt_doc), $GUI_CHECKED) = $GUI_CHECKED Then
		If BitAND(GUICtrlRead($Opt_1_Menor), $GUI_UNCHECKED) = $GUI_UNCHECKED and BitAND(GUICtrlRead($Opt_1_Maior), $GUI_UNCHECKED) = $GUI_UNCHECKED and BitAND(GUICtrlRead($Opt_2_Via), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
			Msgbox(0,"","Por favor selecione uma opção para 1ª Via ou 2ª Via")
		else
			if GUICtrlRead($campo_Caixa) = "" Then
				Msgbox(0,"","Por favor informe o numero da caixa!")
			Else
				if DirGetSize($iniArray[3][1]&"\"&GUICtrlRead($campo_Caixa,1)) <> -1 and DirGetSize($iniArray[4][1]&"\"&GUICtrlRead($campo_Caixa,1)) <> -1 and DirGetSize($iniArray[5][1]&"\"&GUICtrlRead($campo_Caixa,1)) <> -1 Then
					If $console = "Yes" then ConsoleWrite("a Pasta: "&$iniArray[3][1]&"\"&GUICtrlRead($campo_Caixa,1)&" já existe!")
				Else
					DirCreate($iniArray[3][1]&"\"&GUICtrlRead($campo_Caixa,1))
					DirCreate($iniArray[4][1]&"\"&GUICtrlRead($campo_Caixa,1))
					DirCreate($iniArray[5][1]&"\"&GUICtrlRead($campo_Caixa,1))
				EndIf
				$export_imagens = $iniArray[3][1]&"\"&GUICtrlRead($campo_Caixa,1)
				$fila_imagens = $iniArray[4][1]&"\"&GUICtrlRead($campo_Caixa,1)
				$final_imagens = $iniArray[5][1]&"\"&GUICtrlRead($campo_Caixa,1)
				global $fics_fila = "sim"
				abre_arquivo("fila")
			EndIf
		EndIf


	EndIf


EndFunc

func sair_principal()
	Exit
EndFunc

Func abre_arquivo($local)

	if $local = "normal" Then
		global $sFile = FileOpenDialog("Selecione o Arquivo...", $import_imagens, "Images (*.jpg)",$FD_FILEMUSTEXIST)
		If @error <> 1 Then
			Global $sFile2 = $sFile

			local $hora_inicio = TimerInit()
			Global $iHours = 0, $iMins = 0, $iSecs = 0

			$sFile = StringReplace($sFile, "|", @CRLF)
			$fics_exportadas = Null

			Form_fic()
			Run_OCR()

			verifica_fila()

			local $hora_final = TimerDiff($hora_inicio)
			_TicksToTime($hora_final, $iHours, $iMins, $iSecs)
			global $tempo_processamento = StringFormat("%02d:%02d:%02d", $iHours, $iMins, $iSecs)

			if $fics_fila = "não" Then
				ProcessImages("carimbo")

				pos_carimbo()

				local $hora_final2 = TimerDiff($hora_inicio)
				_TicksToTime($hora_final2, $iHours, $iMins, $iSecs)
				global $tempo_processamento2 = StringFormat("%02d:%02d:%02d", $iHours, $iMins, $iSecs)

				local $mensagem = $hora_agora&" - Fic Exportada! RG: "&$RG_numero& " Tempo OCR: "& $tempo_processamento & ", Tempo Total: "& $tempo_processamento2
				_push("GAFIC Report", $mensagem)

				Grava_log_report_txt("Simples")

				if $user_on = "Administrador - Wagner" Then
					status()
				Else
					status_user()
				EndIf
			EndIf

		Else
			MsgBox(0,"", "Por favor selecione um arquivo!")
			DirRemove($fila_imagens, 0)
			DirRemove($export_imagens, 0)
			DirRemove($final_imagens, 0)
			global $export_imagens = $iniArray[3][1]
			global $fila_imagens = $iniArray[4][1]
			global $final_imagens = $iniArray[5][1]
			GUICtrlSetData($campo_Caixa, "")
			GUICtrlSetData($campo_lote, "")
		EndIf

	EndIf

	if $local = "fila" Then
		global $sFile = FileOpenDialog("Selecione o Arquivo...", $fila_imagens, "Images (*.jpg)",$FD_FILEMUSTEXIST)
		Global $sFile2 = $sFile

		local $hora_inicio = TimerInit()
		Global $iHours = 0, $iMins = 0, $iSecs = 0

		$sFile = StringReplace($sFile, "|", @CRLF)
		$fics_exportadas = Null
		ProcessImages("fila")

		Form_fic()
		skip_fila() ;não faz reconhecimento de arquivos na fila, abre para digitação direta.
		;Run_OCR()

		verifica_fila()

			local $hora_final = TimerDiff($hora_inicio)
			_TicksToTime($hora_final, $iHours, $iMins, $iSecs)
			global $tempo_processamento = StringFormat("%02d:%02d:%02d", $iHours, $iMins, $iSecs)

		if $fics_fila = "não" Then
			ProcessImages("carimbo")

			pos_carimbo()

			local $hora_final2 = TimerDiff($hora_inicio)
			_TicksToTime($hora_final2, $iHours, $iMins, $iSecs)
			global $tempo_processamento2 = StringFormat("%02d:%02d:%02d", $iHours, $iMins, $iSecs)

			local $mensagem = $hora_agora&" - Fic Exportada! RG: "&$RG_numero& " Tempo OCR: "& $tempo_processamento & ", Tempo Total: "& $tempo_processamento2
			_push("GAFIC Report", $mensagem)

			Grava_log_report_txt("Simples")

			if $user_on = "Administrador - Wagner" Then
				status()
			Else
				status_user()
			EndIf
		EndIf

	EndIf

EndFunc

Func abre_lote($local)

	if $local = "normal" then
		Global $file = FileSelectFolder("Selecione a Pasta...", $import_imagens)

		If @error <> 1 Then
			GLOBAL $sFile = _FileListToArray($file, $sFilter,"", true)

			$fics_exportadas = Null
			$lista = Null

			Lote_fic("normal")

		Else
			MsgBox(0,"", "Por favor selecione um pasta!")
			DirRemove($fila_imagens, 0)
			DirRemove($export_imagens, 0)
			DirRemove($final_imagens, 0)
			global $export_imagens = $iniArray[3][1]
			global $fila_imagens = $iniArray[4][1]
			global $final_imagens = $iniArray[5][1]
			GUICtrlSetData($campo_Caixa, "")
			GUICtrlSetData($campo_lote, "")
		EndIf

	EndIf

	if $local = "fila" then
		Global $file = $fila_imagens
		GLOBAL $sFile = _FileListToArray($file, $sFilter,"", true)

		$fics_exportadas = Null
		$lista = Null
		if BitAND(GUICtrlRead($CHk_verifica_Filtro), $GUI_CHECKED) = $GUI_CHECKED Then
			ProcessImages("fila")
		EndIf

		Lote_fic("fila")

	EndIf

EndFunc

Func Lote_fic($local)

	if $local = "normal" then
		local $last_fic = $sFile[0]
		local $hora_inicio = TimerInit()
		Global $iHours = 0, $iMins = 0, $iSecs = 0

		For $p = 0 to $last_fic Step 1
			If FileExists ($sFile[$p]) Then
				Global $sFile2 = $sFile[$p]
				If $sFile[0] > 0 Then

					Form_fic()
					Run_OCR()

				Else

					MsgBox(0,"", "nao achei a imagem")

				EndIf
			EndIf
		Next

		verifica_fila()

		local $hora_final = TimerDiff($hora_inicio)
		 _TicksToTime($hora_final, $iHours, $iMins, $iSecs)
		global $tempo_processamento = StringFormat("%02d:%02d:%02d", $iHours, $iMins, $iSecs)

		if $fics_fila = "não" Then
			ProcessImages("carimbo")

			pos_carimbo()

			local $hora_final2 = TimerDiff($hora_inicio)
			_TicksToTime($hora_final2, $iHours, $iMins, $iSecs)
			global $tempo_processamento2 = StringFormat("%02d:%02d:%02d", $iHours, $iMins, $iSecs)

			MsgBox(0,"", "FICS Exportadas: "&$fics_exportadas& ", Tempo OCR: "& $tempo_processamento&", Tempo Total: "&$tempo_processamento2, 3)
			local $mensagem = $hora_agora&" - Fics Exportadas: "& $fics_exportadas & ", Tempo OCR: "& $tempo_processamento&", Tempo Total: "&$tempo_processamento2&", Lista: "&$lista
			_push("GAFIC Report", $mensagem)

			Grava_log_report_txt("Sucesso")

			if $user_on = "Administrador - Wagner" Then
				status()
			Else
				status_user()
			EndIf

		Else
			MsgBox(0,"", "FICS processadas no 1º OCR: "&$fics_exportadas& ", Tempo OCR: "& $tempo_processamento&@CRLF& "Total de FICS Pendentes: "&$n_fics_fila, 3)
			local $mensagem =  $hora_agora&" - Fics processadas no 1º OCR: "& $fics_exportadas & ", Total de FICS Pendentes: "&$n_fics_fila &", Tempo OCR: "& $tempo_processamento&", Lista: "&$lista
			_push("GAFIC Report", $mensagem)

			Grava_log_report_txt("Fila")

			if $user_on = "Administrador - Wagner" Then
				status()
			Else
				status_user()
			EndIf

		EndIf

	EndIf

	if $local = "fila" then
		local $last_fic = $sFile[0]
		local $hora_inicio = TimerInit()
		Global $iHours = 0, $iMins = 0, $iSecs = 0

		For $p = 0 to $last_fic Step 1
			if $pause <> "Yes" then
				If FileExists ($sFile[$p]) Then
					Global $sFile2 = $sFile[$p]
					If $sFile[0] > 0 Then
						$fics_fila = "sim"
						Form_fic()
						skip_fila() ;não faz reconhecimento de arquivos na fila, abre para digitação direta.
						;Run_OCR()

					EndIf
				EndIf
			EndIf

		Next

		local $hora_final = TimerDiff($hora_inicio)
		_TicksToTime($hora_final, $iHours, $iMins, $iSecs)
		global $tempo_processamento = StringFormat("%02d:%02d:%02d", $iHours, $iMins, $iSecs)

		verifica_fila()
		if $fics_fila = "não" Then
			ProcessImages("carimbo")

			pos_carimbo()

			local $hora_final2 = TimerDiff($hora_inicio)
			_TicksToTime($hora_final2, $iHours, $iMins, $iSecs)
			global $tempo_processamento2 = StringFormat("%02d:%02d:%02d", $iHours, $iMins, $iSecs)

			MsgBox(0,"", "FICS arquivadas: "&$fics_exportadas& ", Tempo 2º OCR: "& $tempo_processamento&", Tempo Total: "&$tempo_processamento2, 3)
			local $mensagem = $hora_agora&" - Fics Exportadas: "& $fics_exportadas & ", Tempo 2º OCR: "& $tempo_processamento&", Tempo Total: "&$tempo_processamento2&", Lista: "&$lista
			_push("GAFIC Report", $mensagem)

			Grava_log_report_txt("2 Passada")

			if $user_on = "Administrador - Wagner" Then
				status()
			Else
				status_user()
			EndIf
		EndIf
	EndIf

EndFunc

func verifica_fila()

	local $file = $fila_imagens
	local $sFile = _FileListToArray($file, $sFilter,"", true)
	if IsArray($sFile) Then
		global $n_fics_fila = $sFile[0]

		if $n_fics_fila >= 1 Then
			if $user_on = "Administrador - Wagner" Then

				status()
			Else

				status_user()
			EndIf
			;GUICtrlSetData($campo_fics_fila, "Existe "&$sFile[0]& " FIC pendente!")

		EndIf
		;if $n_fics_fila > 1 Then
			;GUICtrlSetData($campo_fics_fila, "Existem "&$sFile[0]& " FICs pendentes!")
		;EndIf
		;GUICtrlSetState($bt_verifica_fila, $GUI_SHOW )

	Else
		global $fics_fila = "não"
	EndIf
EndFunc


func verifica_fila_pastas()
	$pastas_fila = _FileListToArray($iniArray[4][1], "*", $FLTA_FOLDERS, false)

	if IsArray($pastas_fila) Then
		if $mensagens = "Yes" then _ArrayDisplay($pastas_fila, "Subpastas da Fila", Default, 10)
		global $fila_imagens = $iniArray[4][1]&"\"&$pastas_fila[1]
		global $export_imagens = $iniArray[3][1]&"\"&$pastas_fila[1]
		if DirGetSize($export_imagens) = -1 Then DirCreate($export_imagens)
		global $final_imagens = $iniArray[5][1]&"\"&$pastas_fila[1]
		if DirGetSize($final_imagens) = -1 Then DirCreate($final_imagens)
		GUICtrlSetData($campo_Caixa, $pastas_fila[1])
	EndIf

EndFunc


Func libera_processadas()

	if GUICtrlRead($Lbl_processadas, 0) > 1 Then

		local $hora_inicio = TimerInit()
		Global $iHours = 0, $iMins = 0, $iSecs = 0

		ProcessImages("carimbo")

		pos_carimbo()

		local $hora_final = TimerDiff($hora_inicio)
		_TicksToTime($hora_final, $iHours, $iMins, $iSecs)
		global $tempo_processamento = StringFormat("%02d:%02d:%02d", $iHours, $iMins, $iSecs)

		MsgBox(0,"", "FICS Exportadas: "&$fics_exportadas& ", Tempo de exportação: "& $tempo_processamento, 3)
		local $mensagem = $hora_agora&" - Fics Exportadas: "& $fics_exportadas & ", Tempo de exportação: "& $tempo_processamento
		_push("GAFIC Report", $mensagem)

		;Grava_log_report_txt("Sucesso")
		sleep(10)
		if $user_on = "Administrador - Wagner" Then
			status()
		Else
			status_user()
		EndIf
	EndIf

	if GUICtrlRead($Lbl_processadas, 0) = 1 Then

		local $hora_inicio = TimerInit()
		Global $iHours = 0, $iMins = 0, $iSecs = 0

		ProcessImages("carimbo")

		pos_carimbo()

		local $hora_final = TimerDiff($hora_inicio)
		_TicksToTime($hora_final, $iHours, $iMins, $iSecs)
		global $tempo_processamento = StringFormat("%02d:%02d:%02d", $iHours, $iMins, $iSecs)

		local $mensagem = $hora_agora&" - Fic Exportada! RG: "&$RG_numero& " Tempo de exportação: "& $tempo_processamento
		_push("GAFIC Report", $mensagem)

		;Grava_log_report_txt("Simples")
		sleep(10)

		if $user_on = "Administrador - Wagner" Then
			status()
		Else
			status_user()
		EndIf
	EndIf


EndFunc

Func pos_carimbo()

	local $arq_processados = _FileListToArray($export_imagens, "*.jpg", 0, false)
	local $arq_finalizados = _FileListToArray($final_imagens, "*.jpg", 0, false)

	if IsArray($arq_processados) and IsArray($arq_finalizados) Then

		if $arq_processados[0] <> 0 Then
			ProgressOn("Aguarde!", "Adicionando ao Banco de dados!")
			$step = 100 / $arq_processados[0]
			$increment = $step

			_FileReadToArray($Arquivo_TXT_path, $prepara_log, $FRTA_NOCOUNT, ";")

				For $i = 1 to $arq_processados[0] Step 1
					ProgressSet($increment, Round($increment) & " %")
					$index = _ArraySearch($arq_finalizados, $arq_processados[$i],1,$arq_finalizados[0], 0, 0, 0, 0, False)
					if @error = 6 Then
						If $console = "Yes" then ConsoleWrite("o arquivo: "& $arq_processados[$i]&", não foi encontrado na pasta: "&$arq_finalizados& @CRLF)
						;ExitLoop
					Else
						If $console = "Yes" then ConsoleWrite("o arquivo: "& $arq_processados[$i]&" foi encontrado na pasta: "&$arq_finalizados&", index: "&$index& @CRLF)
						If $console = "Yes" then ConsoleWrite("o arquivo: "& $arq_processados[$i]&", será apagado da pasta: "&$export_imagens& @CRLF)

						FileDelete($export_imagens& "\"& $arq_processados[$i])

						if $mensagens = "Yes" then _ArrayDisplay($prepara_log, "array quando abre", default, 10)
						local $arq_final_deletado = $export_imagens& "\"& $arq_processados[$i]
						if $mensagens = "Yes" then msgbox(0,"","está procurando: "&$arq_final_deletado)
						local $index2 = _ArraySearch($prepara_log, $arq_final_deletado, 0, UBound($prepara_log,1), 0, 0, 1, 8)
						If @error Then
							MsgBox(0,"","Erro na busca do index2(array prepara_log) esse é o index retornado: "& @error)
						Else
							$prepara_log[$index2][8] = $final_imagens& "\"&$arq_finalizados[$index]
							global $prepara_log_final = $prepara_log
							if $mensagens = "Yes" then _ArrayDisplay($prepara_log_final, "array depois de gravar", default, 10)

							;_ArrayDelete($arq_processados, $i)
							$arq_processados[0] -= 1
							$increment += $step

							;_ArrayDelete($prepara_log, 0)
						EndIf

					EndIf
				Next

				global $Arquivo_TXT_path = $banco_path & "\imagens_gafic.txt"
				global $Arquivo_TXT = FileOpen($Arquivo_TXT_path, 2)
				_FileWriteFromArray($Arquivo_TXT, $prepara_log_final, default, default, ";")
				FileClose($Arquivo_TXT)
				If @error Then
					MsgBox(0,"","esse é erro retornado no filewrite: "& @error)
				EndIf

			ProgressSet(100 , "Pronto!", "Processamento completo!")

			ProgressOff()
		EndIf
	EndIf

	local $arq_processados = _FileListToArray($export_imagens, "*.jpg", 0, false)
	local $arq_fila = _FileListToArray($fila_imagens, "*.jpg", 0, false)

	if DirGetSize($arq_processados) > 0 then
		MsgBox(4096,"","Ainda existem arquivos a serem processado.")
	Else
		if IsArray($arq_fila) then
			MsgBox(4096,"Atenção","Ainda existem arquivos para liberação na Fila!")
		Else
			DirRemove($fila_imagens, 0)
			DirRemove($export_imagens, 0)
			global $export_imagens = $iniArray[3][1]
			global $fila_imagens = $iniArray[4][1]
			global $final_imagens = $iniArray[5][1]
			GUICtrlSetData($campo_Caixa, "")
			GUICtrlSetData($campo_lote, "")
		EndIf
	EndIf

EndFunc


func fila()

	verifica_fila()

	if $n_fics_fila > 0 Then
		;local $resposta = MsgBox(4, "Atenção!", "Existem " & $n_fics_fila &" arquivos na fila de reconhecimento, deseja verificar agora?")
		;if $resposta = 6 Then
			;Global $fics_fila = "sim"
			abre_lote("fila")
		;EndIf
		;if $resposta = 7 Then
		;	global $fics_fila = Null

		;EndIf

	EndIf

EndFunc


Func Load_fic()

	; Load image
	_GDIPlus_Startup()
	global $hImage = _GDIPlus_ImageLoadFromFile($sFile2)

	Local $ImageWidth = _GDIPlus_ImageGetWidth($hImage)
	Local $ImageHeight = _GDIPlus_ImageGetHeight($hImage)

	;MsgBox(0,"", "tamanho x "&$ImageWidth&" tamanho y "&$ImageHeight)

	; Draw image
	Local $hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	;$hImage2 = _GDIPlus_ImageGreyscale($hImage)
	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage, 0, ($posicao_x_load_fic+120), $ImageWidth/3, $ImageHeight/3)
	_GDIPlus_GraphicsDispose($hGraphic)
	if $console = "Yes" then ConsoleWrite("Fic carregada" & @CRLF)

EndFunc

Func Run_OCR()


	Cria_zoom_campo_rg ()

	if $console = "Yes" then ConsoleWrite("Criado zoom do campo" & @CRLF)

	if $achou_campo = "Sim" Then

		if $console = "Yes" then ConsoleWrite("achou o campo RG, iniciando função verifica_digitos()" & @CRLF)

		verifica_digitos()

		if $console = "Yes" then ConsoleWrite("fim da função verifica_digitos(), iniciando função validador()" & @CRLF)

		validador()

		if $compara_digito_validador = "Ok" Then

		if $console = "Yes" then ConsoleWrite("validação do RG ok, iniciando função procura_data()" & @CRLF)

			procura_data()

			if $achou_data = "Sim" Then

				if $console = "Yes" then ConsoleWrite("campo data encontrado, iniciando função verifica_data()" & @CRLF)

				verifica_data()

				if $console = "Yes" then ConsoleWrite("iniciando função validador_data()" & @CRLF)
				validador_data()

				if $compara_data = "Ok" Then

					if $console = "Yes" then ConsoleWrite("iniciando função Check_validadores()" & @CRLF)
					Check_validadores()

				Else

					if $fics_fila = "não" or $fics_fila = Null or $fics_fila = "" Then
						if $console = "Yes" then ConsoleWrite("problema na checagem da data, arquivo adiconado a fila" & @CRLF)
						Global $validadores = "Fila"
					Else
						Global $validadores = "Erro"
					EndIf

				EndIf

			Else

				if $fics_fila = "não" or $fics_fila = Null or $fics_fila = "" Then
					if $console = "Yes" then ConsoleWrite("campo data não encontrado, arquivo adiconado a fila" & @CRLF)
					Global $validadores = "Fila"
				Else
					Global $validadores = "Erro"
				EndIf

			EndIf


		Else

			if $fics_fila = "não" or $fics_fila = Null or $fics_fila = "" Then
				if $console = "Yes" then ConsoleWrite("problema na checagem do numero do RG, arquivo adiconado a fila" & @CRLF)
				Global $validadores = "Fila"
			Else
				Global $validadores = "Erro"
			EndIf

		EndIf

	Else

		if $fics_fila = "não" or $fics_fila = Null or $fics_fila = "" Then
			if $console = "Yes" then ConsoleWrite("Campo RG não encontrado, arquivo adicionado a fila" & @CRLF)
			Global $validadores = "Fila"
		Else
			Global $validadores = "Erro"
		EndIf

	EndIf


	if $validadores = "Ok" Then

		Salva_arquivo_renomeado()

		;Grava_log_excel()
		Grava_log_txt()
		Grava_lista_txt()

		Limpa_digitos()

	EndIf

	if $validadores = "Fila" Then

		if $fics_fila = "não" or $fics_fila = Null or $fics_fila = "" Then

			Salva_arquivo_fila()
			Grava_log_erro_txt()
			Limpa_digitos()

		Else
			Limpa_digitos()
		EndIf

	EndIf




EndFunc

Func skip_fila()
	global $validadores = "Erro"

	GUIRegisterMsg($WM_COMMAND, "MY_WM_COMMAND") ; habilita auto tabulação dos campos
	GUIRegisterMsg($WM_SYSCOMMAND, "WM_SYSCOMMAND")

	MsgBox (0,"Erro!", "Por favor verifique se todos os valores foram reconhecidos corretamente")
	GUICtrlSetState($1_digito_n_campo, $GUI_FOCUS)
	;HotKeySet("{enter}", "Check_validadores_bt")

	if $console = "Yes" then ConsoleWrite("validadores = erro"&@CRLF)
	global $counter = 0
	Global $pause = "Yes"
	_pause()

EndFunc


Func _pause()

	while $validadores = "Erro"

		Select
			case WinActive($hGui) = True
				$counter +=1
				if $console = "Yes" then ConsoleWrite("Janela ativa = $hGui aguardando "& $counter&" segundos"&@CRLF)
				Sleep(1000)

			Case WinExists($hGui) = False
				if $console = "Yes" then ConsoleWrite("Janela não existe = $hGui saindo do while"&@CRLF)
				ExitLoop
		EndSelect

	WEnd

EndFunc



Func bt_add_ref()
	form_referencia("Fila")
EndFunc

Func bt_salvar()
	Check_validadores()

	if $validadores = "Ok" Then

		Salva_arquivo_renomeado()

		;Grava_log_excel()
		Grava_log_txt()
		Grava_lista_txt()

		Limpa_digitos()

		Global $pause = "No"

	EndIf

	if $validadores = "Erro" Then

		MsgBox (0,"Erro!", "Por favor verifique se todos os valores foram reconhecidos corretamente")
		GUICtrlSetState($1_digito_n_campo, $GUI_FOCUS)
	EndIf
EndFunc


func Check_validadores_bt ()

	if WinActive($Title1) Then

		Check_validadores()

		if $validadores = "Ok" Then

			Salva_arquivo_renomeado()

			;Grava_log_excel()
			Grava_log_txt()
			Grava_lista_txt()

			Limpa_digitos()

			Global $pause = "No"

		EndIf

		if $validadores = "Erro" Then

			MsgBox (0,"Erro!", "Por favor verifique se todos os valores foram reconhecidos corretamente")

		EndIf

	EndIf


EndFunc

;==========================================================================================  greyscale

Func _GDIPlus_ImageGreyscale(Const ByRef $hImage)
    Local $tColorMatrix, $x, $hImgAttrib, $iW = _GDIPlus_ImageGetWidth($hImage), $iH = _GDIPlus_ImageGetHeight($hImage), $hGraphics, $hGraphics2, $hBitmap
;;create color matrix data
    $tColorMatrix = DllStructCreate("float[5];float[5];float[5];float[5];float[5]")
    ;greyscale values:

	global $var1 = -0.35 ;original 0.30
	global $var2 = 1.35 ;original 0.59
	global $var3 = 0 ;original 0.11
	global $var4 = 1.00 ;original 1.00 = ALPHA


    $x = DllStructSetData($tColorMatrix, 1, $var1, 1) * DllStructSetData($tColorMatrix, 1, $var1, 2) * DllStructSetData($tColorMatrix, 1, $var1, 3) * _
         DllStructSetData($tColorMatrix, 2, $var2, 1) * DllStructSetData($tColorMatrix, 2, $var2, 2) * DllStructSetData($tColorMatrix, 2, $var2, 3) * _
         DllStructSetData($tColorMatrix, 3, $var3, 1) * DllStructSetData($tColorMatrix, 3, $var3, 2) * DllStructSetData($tColorMatrix, 3, $var3, 3) * _
         DllStructSetData($tColorMatrix, 4, $var4, 4) * DllStructSetData($tColorMatrix, 5, $var4, 5)
;;create an image attributes object and update its color matrix
    $hImgAttrib = _GDIPlus_ImageAttributesCreate()
    _GDIPlus_ImageAttributesSetColorMatrix($hImgAttrib, 1, DllStructGetPtr($tColorMatrix))
;;copy image
    $hGraphics = _GDIPlus_ImageGetGraphicsContext($hImage)
    $hBitmap = _GDIPlus_BitmapCreateFromGraphics($iW, $iH, $hGraphics)
    $hGraphics2 = _GDIPlus_ImageGetGraphicsContext($hBitmap)
;;draw original into copy with attributes
    _GDIPlus_GraphicsDrawImageRectRectEx($hGraphics2, $hImage, 0, 0, $iW, $iH, 0, 0, $iW, $iH, 2, $hImgAttrib)
;;clean up
    _GDIPlus_GraphicsDispose($hGraphics)
    _GDIPlus_GraphicsDispose($hGraphics2)
    _GDIPlus_ImageAttributesDispose($hImgAttrib)

    Return $hBitmap
EndFunc


Func _GDIPlus_ImageAttributesSetColorMatrix($hImgAttrib, $iColorAdjustType, $pColorMatrix = 0, $pGrayMatrix = 0, $iColorMatrixFlags = 1)
    Local $fEnable = 1, $aResult = DllCall($__g_hGDIPDLL, "int", "GdipSetImageAttributesColorMatrix", "ptr",$hImgAttrib, "int",$iColorAdjustType, _
                                            "int",$fEnable, "ptr",$pColorMatrix, "ptr",$pGrayMatrix, "int",$iColorMatrixFlags)
    Return SetError($aResult[0], 0, $aResult[0] = 0)
EndFunc

;;Creates ImageAttributes object
Func _GDIPlus_ImageAttributesCreate()
    Local $aResult = DllCall($__g_hGDIPDLL, "int", "GdipCreateImageAttributes", "ptr*", 0)
    Return SetError($aResult[0], 0, $aResult[1])
EndFunc

;;Deletes ImageAttributes object
Func _GDIPlus_ImageAttributesDispose($hImgAttrib)
    Local $aResult = DllCall($__g_hGDIPDLL, "int", "GdipDisposeImageAttributes", "ptr", $hImgAttrib)
    Return SetError($aResult[0], 0, $aResult[0] = 0)
EndFunc

;; _GDIPlus_GraphicsDrawImageRectRectEx()
;; Same as _GDIPlus_GraphicsDrawImageRectRect(), but adds 1 optional parameter - $hImgAttrib (handle to ImageAttributes object)
Func _GDIPlus_GraphicsDrawImageRectRectEx($hGraphics, $hImage, $iSrcX, $iSrcY, $iSrcWidth, $iSrcHeight, $iDstX, $iDstY, $iDstWidth, $iDstHeight, $iUnit = 2, $hImgAttrib = 0)
    Local $aResult = DllCall($__g_hGDIPDLL, "int", "GdipDrawImageRectRectI", "hwnd", $hGraphics, "hwnd", $hImage, "int", $iDstX, "int", _
            $iDstY, "int", $iDstWidth, "int", $iDstHeight, "int", $iSrcX, "int", $iSrcY, "int", $iSrcWidth, "int", _
            $iSrcHeight, "int", $iUnit, "ptr", $hImgAttrib, "int", 0, "int", 0)
    Return SetError($aResult[0], 0, $aResult[0] = 0)
EndFunc



;=========================================================================================== fim greyscale





Func Cria_zoom_campo_rg ()

	verifica_campo()

	if $achou_campo = "Não" Then

		;MsgBox(0,"Campo RG não encontrado", "Campo RG não encontrado")
		;Global $validadores = "fila"

	endif
	if $achou_campo = "Sim" Then

		negativo("campo_rg")

;~ 		_GDIPlus_Startup()

 		;=== cria o arquivo em escala de cinza

;~ 		$img = $sFile2
;~ 		global $hImage2 = _GDIPlus_ImageGreyscale($hImage)

		;==== fim da escala de cinza

;~ 		Global $hGraphic3 = _GDIPlus_GraphicsCreateFromHWND($hGUI)
		;_GDIPlus_GraphicsDrawImageRectRect($hGraphic3, $hImage, ($X_campo_i*3+$x*3)+16,(($Y_campo_i-100)*3+$y+10*3),470,70,10,30,470,70) ;enquadra com o arquivo da imagem original
;~ 		_GDIPlus_GraphicsDrawImageRectRect($hGraphic3, $hImage2, ($X_campo_i*3+$x*3)-10,(($Y_campo_i)-120-$posicao_x_load_fic+$y*2.5),470,80,10,30,470,80) ;enquadra campo RG com o arquivo da imagem original

	EndIf

EndFunc


Func Limpa_digitos ()
	;Global $y = 0, $x = 0
	Global $1_digito_n = ""
	Global $2_digito_n = ""
	Global $3_digito_n = ""
	Global $4_digito_n = ""
	Global $5_digito_n = ""
	Global $6_digito_n = ""
	Global $7_digito_n = ""
	Global $8_digito_n = ""
	Global $9_digito_n = ""
	Global $1_digito_n_data = ""
	Global $2_digito_n_data = ""
	Global $3_digito_n_data = ""
	Global $4_digito_n_data = ""
	Global $5_digito_n_data = ""
	Global $6_digito_n_data = ""
	Global $7_digito_n_data = ""
	Global $8_digito_n_data = ""
	Global $1_digito_x = "", $1_digito_y = ""
	Global $2_digito_x = "", $2_digito_y = ""
	Global $3_digito_x = "", $3_digito_y = ""
	Global $4_digito_x = "", $4_digito_y = ""
	Global $5_digito_x = "", $5_digito_y = ""
	Global $6_digito_x = "", $6_digito_y = ""
	Global $7_digito_x = "", $7_digito_y = ""
	Global $8_digito_x = "", $8_digito_y = ""
	Global $9_digito_x = "", $9_digito_y = ""
	global $modelo_fic = ""
	Global $digito_verificador_rg = ""
	global $imagem_path = ""
	Global $compara_digito_validador = Null
	Global $compara_data = Null
	Global $validadores = Null
	global $erro_descricao = ""
	global $erro_descricao_detalhado = ""

	_GDIPlus_Startup()
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic3)
	_GDIPlus_GraphicsDispose($hGraphic)

    _GDIPlus_Shutdown()
	if $user_on = "Administrador - Wagner" Then
		status()
	Else
		status_user()
	EndIf

	_ReduceMemory()

	GUIDelete($hGUI)
	GUISetState()

	;HotKeySet("{enter}", "abrir")

EndFunc

Func _ReduceMemory($i_PID = -1)
    If $i_PID <> -1 Then
        Local $ai_Handle = DllCall("kernel32.dll", 'int', 'OpenProcess', 'int', 0x1f0fff, 'int', False, 'int', $i_PID)
        $ai_Return = DllCall("psapi.dll", 'int', 'EmptyWorkingSet', 'long', $ai_Handle[0])
        DllCall('kernel32.dll', 'int', 'CloseHandle', 'int', $ai_Handle[0])
    Else
        $ai_Return = DllCall("psapi.dll", 'int', 'EmptyWorkingSet', 'long', -1)
    EndIf

    Return $ai_Return[0]
EndFunc   ;==>_ReduceMemory




Func Salva_arquivo_renomeado()
	$rg_numero_sem_digito = $1_digito_n & $2_digito_n &$3_digito_n& $4_digito_n& $5_digito_n& $6_digito_n& $7_digito_n& $8_digito_n
	$RG_numero = $1_digito_n & $2_digito_n &$3_digito_n& $4_digito_n& $5_digito_n& $6_digito_n& $7_digito_n& $8_digito_n&$digito_verificador_rg
	$RG_numero_nomedoarquivo = GUICtrlRead($Campo_Posto)&"_"& StringReplace($data_agora, "/", "-") &"_"&$1_digito_n & $2_digito_n & $3_digito_n& $4_digito_n& $5_digito_n& $6_digito_n& $7_digito_n& $8_digito_n&"-"&$digito_verificador_rg
	$data_atendimento = $1_digito_n_data & $2_digito_n_data&"/"&$3_digito_n_data& $4_digito_n_data&"/"&$5_digito_n_data& $6_digito_n_data& $7_digito_n_data& $8_digito_n_data
	$data_atendimento_sem_barra = $1_digito_n_data&$2_digito_n_data&$3_digito_n_data&$4_digito_n_data&$5_digito_n_data&$6_digito_n_data&$7_digito_n_data&$8_digito_n_data

		if FileExists ($final_imagens&"\"&$RG_numero_nomedoarquivo&".jpg") Then

			for $i = 100 To 1 Step -1
			if FileExists ($final_imagens&"\"&$RG_numero_nomedoarquivo&" ("&$i&").jpg") then
				_GDIPlus_ImageSaveToFile($hImage, $export_imagens&"\"&$RG_numero_nomedoarquivo&" ("&$i+1&").jpg")
				global $imagem_path = $export_imagens&"\"&$RG_numero_nomedoarquivo&" ("&$i+1&").jpg"
				_GUICtrlStatusBar_SetText($hStatus, "Arquivo salvo: "& $RG_numero_nomedoarquivo&" ("&$i+1&").jpg") ;display in status bar o nome do arquivo salvo
				ExitLoop
			ElseIf FileExists ($final_imagens&"\"&$RG_numero_nomedoarquivo&" (1).jpg") = False then
				_GDIPlus_ImageSaveToFile($hImage, $export_imagens&"\"&$RG_numero_nomedoarquivo&" (1).jpg")
				global $imagem_path = $export_imagens&"\"&$RG_numero_nomedoarquivo&" (1).jpg"
				_GUICtrlStatusBar_SetText($hStatus, "Arquivo salvo: "& $RG_numero_nomedoarquivo&" (1).jpg") ;display in status bar o nome do arquivo salvo
				ExitLoop
			endif
			Next

		Else
			_GDIPlus_ImageSaveToFile($hImage, $export_imagens&"\"&$RG_numero_nomedoarquivo&".jpg")
			global $imagem_path = $export_imagens&"\"&$RG_numero_nomedoarquivo&".jpg"
			_GUICtrlStatusBar_SetText($hStatus, "Arquivo salvo: "& $RG_numero_nomedoarquivo&".jpg") ;display in status bar o nome do arquivo salvo

		EndIf

		if $console = "Yes" then ConsoleWrite(">Arquivo salvo: "&$imagem_path & @CRLF)
		$ahIcons[0] = _WinAPI_LoadShell32Icon(23) ;carrega primeiro icone no Statusbar
		$ahIcons[1] = _WinAPI_LoadShell32Icon(40) ;carrega segundo icone no Statusbar
		_GUICtrlStatusBar_SetIcon($hStatus, 0, $ahIcons[0]) ;exibe primeiro icone no Statusbar
		_GUICtrlStatusBar_SetIcon($hStatus, 1, $ahIcons[1]) ;exibe primeiro icone no Statusbar
		_GUICtrlStatusBar_SetText($hStatus, "Sucesso!", 1) ;display in status bar
		if $fics_fila = "sim" Then
			_GDIPlus_Startup()
			_GDIPlus_ImageDispose($hImage)
			_GDIPlus_Shutdown()
			FileDelete($sFile2)
		EndIf

		$fics_exportadas = $fics_exportadas + 1

		if $lista = Null Then
			$lista = $RG_numero
		Else
			$lista = $lista &", "&$RG_numero
		EndIf

EndFunc

Func Salva_arquivo_fila()

	Local $temp = StringSplit($sFile2, "\")
	local $temp2 = StringSplit($temp[$temp[0]], ".jpg", $STR_ENTIRESPLIT)
	Assign("RG_numero_nomedoarquivo", $temp2[1])
	;MsgBox(0,"",$temp2[1])

	if FileExists ($fila_imagens&"\"&$RG_numero_nomedoarquivo&".jpg") Then

		for $i = 100 To 1 Step -1
		if FileExists ($fila_imagens&"\"&$RG_numero_nomedoarquivo&" ("&$i&").jpg") then
			_GDIPlus_ImageSaveToFile($hImage, $fila_imagens&"\"&$RG_numero_nomedoarquivo&" ("&$i+1&").jpg")
			global $imagem_path = $fila_imagens&"\"&$RG_numero_nomedoarquivo&" ("&$i+1&").jpg"
			_GUICtrlStatusBar_SetText($hStatus, "Arquivo salvo na fila: "&$RG_numero_nomedoarquivo&" ("&$i+1&").jpg") ;display in status bar o nome do arquivo salvo
			ExitLoop
		ElseIf FileExists ($fila_imagens&"\"&$RG_numero_nomedoarquivo&" (1).jpg") = False then
			_GDIPlus_ImageSaveToFile($hImage, $fila_imagens&"\"&$RG_numero_nomedoarquivo&" (1).jpg")
			global $imagem_path = $fila_imagens&"\"&$RG_numero_nomedoarquivo&" (1).jpg"
			_GUICtrlStatusBar_SetText($hStatus, "Arquivo salvo na fila: "&$RG_numero_nomedoarquivo&" (1).jpg") ;display in status bar o nome do arquivo salvo
			ExitLoop
		endif
		Next
	Else
		_GDIPlus_ImageSaveToFile($hImage, $fila_imagens&"\"&$RG_numero_nomedoarquivo&".jpg")
		global $imagem_path = $fila_imagens&"\"&$RG_numero_nomedoarquivo&".jpg"
		_GUICtrlStatusBar_SetText($hStatus, "Arquivo salvo na fila: "& $RG_numero_nomedoarquivo&".jpg") ;display in status bar o nome do arquivo salvo
	EndIf

	if $console = "Yes" then ConsoleWrite("Arquivo salvo na fila: "& $RG_numero_nomedoarquivo & @CRLF & @CRLF)
	$ahIcons[0] = _WinAPI_LoadShell32Icon(23) ;carrega primeiro icone no Statusbar
	$ahIcons[1] = _WinAPI_LoadShell32Icon(40) ;carrega segundo icone no Statusbar
	_GUICtrlStatusBar_SetIcon($hStatus, 0, $ahIcons[0]) ;exibe primeiro icone no Statusbar
	_GUICtrlStatusBar_SetIcon($hStatus, 1, $ahIcons[1]) ;exibe primeiro icone no Statusbar
	_GUICtrlStatusBar_SetText($hStatus, "Sucesso!", 1) ;display in status bar
	if $n_fics_fila = null Then
		$n_fics_fila = 1
	Else
		$n_fics_fila = $n_fics_fila +1
	EndIf

EndFunc

Func Check_validadores()

	validador()

	validador_data()

	If $compara_data = "Ok" and $compara_digito_validador = "Ok" Then
		Global $validadores = "Ok"
	EndIf
	if $compara_data = "Fila" or $compara_digito_validador = "Fila" Then
		Global $validadores = "Fila"
	EndIf
	if $compara_data = "Erro" or $compara_digito_validador = "Erro" Then
		Global $validadores = "Erro"
	EndIf

EndFunc



Func _Input1_Changed()
	If StringLen(GUICtrlRead($1_digito_n_campo)) = 1 Then GUICtrlSetState($2_digito_n_campo, $GUI_FOCUS)
EndFunc
Func _Input2_Changed()
	If StringLen(GUICtrlRead($2_digito_n_campo)) = 1 Then GUICtrlSetState($3_digito_n_campo, $GUI_FOCUS)
EndFunc
Func _Input3_Changed()
	If StringLen(GUICtrlRead($3_digito_n_campo)) = 1 Then GUICtrlSetState($4_digito_n_campo, $GUI_FOCUS)
EndFunc
Func _Input4_Changed()
	If StringLen(GUICtrlRead($4_digito_n_campo)) = 1 Then GUICtrlSetState($5_digito_n_campo, $GUI_FOCUS)
EndFunc
Func _Input5_Changed()
	If StringLen(GUICtrlRead($5_digito_n_campo)) = 1 Then GUICtrlSetState($6_digito_n_campo, $GUI_FOCUS)
EndFunc
Func _Input6_Changed()
	If StringLen(GUICtrlRead($6_digito_n_campo)) = 1 Then GUICtrlSetState($7_digito_n_campo, $GUI_FOCUS)
EndFunc
Func _Input7_Changed()
	If StringLen(GUICtrlRead($7_digito_n_campo)) = 1 Then GUICtrlSetState($8_digito_n_campo, $GUI_FOCUS)
EndFunc
Func _Input8_Changed()
	If StringLen(GUICtrlRead($8_digito_n_campo)) = 1 Then GUICtrlSetState($9_digito_n_campo, $GUI_FOCUS)
EndFunc
Func _Input9_Changed()
	If StringLen(GUICtrlRead($9_digito_n_campo)) = 1 Then GUICtrlSetState($1_digito_n_campo_data, $GUI_FOCUS)
EndFunc
Func _Input1_data_Changed()
	If StringLen(GUICtrlRead($1_digito_n_campo_data)) = 1 Then GUICtrlSetState($2_digito_n_campo_data, $GUI_FOCUS)
EndFunc
Func _Input2_data_Changed()
	If StringLen(GUICtrlRead($2_digito_n_campo_data)) = 1 Then GUICtrlSetState($3_digito_n_campo_data, $GUI_FOCUS)
EndFunc
Func _Input3_data_Changed()
	If StringLen(GUICtrlRead($3_digito_n_campo_data)) = 1 Then GUICtrlSetState($4_digito_n_campo_data, $GUI_FOCUS)
EndFunc
Func _Input4_data_Changed()
	If StringLen(GUICtrlRead($4_digito_n_campo_data)) = 1 Then GUICtrlSetState($5_digito_n_campo_data, $GUI_FOCUS)
EndFunc
Func _Input5_data_Changed()
	If StringLen(GUICtrlRead($5_digito_n_campo_data)) = 1 Then GUICtrlSetState($6_digito_n_campo_data, $GUI_FOCUS)
EndFunc
Func _Input6_data_Changed()
	If StringLen(GUICtrlRead($6_digito_n_campo_data)) = 1 Then GUICtrlSetState($7_digito_n_campo_data, $GUI_FOCUS)
EndFunc
Func _Input7_data_Changed()
	If StringLen(GUICtrlRead($7_digito_n_campo_data)) = 1 Then GUICtrlSetState($8_digito_n_campo_data, $GUI_FOCUS)
EndFunc
Func _Input8_data_Changed()
	If StringLen(GUICtrlRead($8_digito_n_campo_data)) = 1 Then GUICtrlSetState($idSalvarButton, $GUI_FOCUS)
EndFunc

Func MY_WM_COMMAND($hWnd, $msg, $wParam, $lParam)
	Local $nNotifyCode = BitShift ($wParam, 16)
	Local $nID = BitAND($wParam, 0xFFFF)
	Local $hCtrl = $lParam


	if $validadores = "Erro" Then
		Switch $nID
			Case $1_digito_n_campo
				Switch $nNotifyCode
					Case $EN_CHANGE
						_Input1_Changed()
				EndSwitch
			Case $2_digito_n_campo
				Switch $nNotifyCode
					Case $EN_CHANGE
						_Input2_Changed()
				EndSwitch
			Case $3_digito_n_campo
				Switch $nNotifyCode
					Case $EN_CHANGE
						_Input3_Changed()
				EndSwitch
			Case $4_digito_n_campo
				Switch $nNotifyCode
					Case $EN_CHANGE
						_Input4_Changed()
				EndSwitch
			Case $5_digito_n_campo
				Switch $nNotifyCode
					Case $EN_CHANGE
						_Input5_Changed()
				EndSwitch
			Case $6_digito_n_campo
				Switch $nNotifyCode
					Case $EN_CHANGE
						_Input6_Changed()
				EndSwitch
			Case $7_digito_n_campo
				Switch $nNotifyCode
					Case $EN_CHANGE
						_Input7_Changed()
				EndSwitch
			Case $8_digito_n_campo
				Switch $nNotifyCode
					Case $EN_CHANGE
						_Input8_Changed()
				EndSwitch
			Case $9_digito_n_campo
				Switch $nNotifyCode
					Case $EN_CHANGE
						_Input9_Changed()
				EndSwitch
			Case $1_digito_n_campo_data
				Switch $nNotifyCode
					Case $EN_CHANGE
						_Input1_data_Changed()
				EndSwitch
			Case $2_digito_n_campo_data
				Switch $nNotifyCode
					Case $EN_CHANGE
						_Input2_data_Changed()
				EndSwitch
			Case $3_digito_n_campo_data
				Switch $nNotifyCode
					Case $EN_CHANGE
						_Input3_data_Changed()
				EndSwitch
			Case $4_digito_n_campo_data
				Switch $nNotifyCode
					Case $EN_CHANGE
						_Input4_data_Changed()
				EndSwitch
			Case $5_digito_n_campo_data
				Switch $nNotifyCode
					Case $EN_CHANGE
						_Input5_data_Changed()
				EndSwitch
			Case $6_digito_n_campo_data
				Switch $nNotifyCode
					Case $EN_CHANGE
						_Input6_data_Changed()
				EndSwitch
			Case $7_digito_n_campo_data
				Switch $nNotifyCode
					Case $EN_CHANGE
						_Input7_data_Changed()
				EndSwitch
			Case $8_digito_n_campo_data
				Switch $nNotifyCode
					Case $EN_CHANGE
						_Input8_data_Changed()
				EndSwitch

			;====== define a função dos botões no formulario $hGUI (visualizador da fic)

			Case $idSalvarButton
				bt_salvar()

			Case $Bt_add_ref
				bt_add_ref()


			Case $idVoltarButton
				sair_fic()
				Limpa_digitos()
				Global $pause = "No"


			;======= define a função dos botões no formulario $hGui_add_ref (Ferramenta de adição de Referencias)

			;case $OptCamporg
			;	seleciona()

			;case $OptCampodata
			;	seleciona()

			;case $OptHifen
			;	seleciona()

			;case $OptDatabarra
			;	seleciona()

			;case $OptNumero
			;	seleciona()

			;case $TxtNumero
				;seleciona()


			;Case $hButtonSave
			;	saveA()
				;_exit()

		EndSwitch


		Return $GUI_RUNDEFMSG
	EndIf


EndFunc

Func WM_SYSCOMMAND($hWnd, $iMsg, $iwParam, $ilParam)
    Local $hWndFrom, $iIDFrom, $iCode
    ;#forceref $hWnd, $iMsg, $iwParam, $ilParam, $hWndFrom, $iIDFrom, $iCode
    $hWndFrom = $ilParam
    $iIDFrom = BitAND($iwParam, 0xFFFF) ; Low Word
    $iCode = BitShift($iwParam, 16) ; Hi Word

	Switch $iwParam
		Case 0xF060 ;SC_CLOSE
			if $console = "Yes" then ConsoleWrite("!Close window" & @LF)
			Switch_sair($hWnd)
		Case 0xF120 ;SC_RESTORE
			if $console = "Yes" then ConsoleWrite("!Restore window" & @LF)
		Case 0xF020 ;SC_MAXIMIZE
			if $console = "Yes" then ConsoleWrite("!Maximize window" & @LF)
	EndSwitch

    Return $GUI_RUNDEFMSG ; Only workout clicking on the button
EndFunc   ;==>MY_SYS_COMMAND

func Switch_sair($hWnd)

	Switch $hWnd
		Case $hGui_add_ref
			if $mensagens = "Yes" then MsgBox(0,"Bt Close","Saindo do formulário $hGui_add_ref")
			_exit()
			verifica_fila()
			if $fics_fila = "não" Then

			Else
				Form_fic()
				Run_OCR()
			EndIf


		Case $hGui
			if $mensagens= "Yes" then MsgBox(0,"Bt Close","Saindo do formulário $hGui")
			sair_fic()
			Limpa_digitos()

		Case $Form1
			if $mensagens = "Yes" then MsgBox(0,"Bt Close","Saindo do formulário $Form1")
			Exit
	EndSwitch

EndFunc



Func MyErrFunc()
$HexNumber=hex($oMyError.number,8)
;Msgbox(0,"COM Error Test","We intercepted a COM Error !"     & @CRLF & @CRLF & _
;             "err.description is: " & @TAB & $oMyError.description  & @CRLF & _
;             "err.windescription:"   & @TAB & $oMyError.windescription & @CRLF & _
;             "err.number is: "       & @TAB & $HexNumber             & @CRLF & _
;             "err.lastdllerror is: " & @TAB & $oMyError.lastdllerror & @CRLF & _
;             "err.scriptline is: "   & @TAB & $oMyError.scriptline   & @CRLF & _
;             "err.source is: "       & @TAB & $oMyError.source       & @CRLF & _
;             "err.helpfile is: "     & @TAB & $oMyError.helpfile     & @CRLF & _
;             "err.helpcontext is: " & @TAB & $oMyError.helpcontext _
;            )
SetError(1) ; to check for after this function returns
Endfunc