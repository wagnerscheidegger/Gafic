Func Form_fic ()

	Local $temp = StringSplit($sFile2, "\")
	global $hGUI = GUICreate($Title1 &" - Processando arquivo: "&$temp[$temp[0]], 720, 700, 10, 10)
	Opt("GUIOnEventMode", 1)
	;Opt("WinWaitDelay", 60000)
	GUISetState()
	global $idSalvarButton = GUICtrlCreateButton("Salvar", 5, 5, 70, 20)
	global $idVoltarButton = GUICtrlCreateButton("Voltar", 85, 5, 70, 20)
	global $Bt_add_ref = GUICtrlCreateButton("Adicionar Ref.", 168, 5, 83, 20)
	$Group1 = GUICtrlCreateGroup("RG:", 490, 35, 225, 89)
	$1_digito_n_campo = GUICtrlCreateInput("", 498, 91, 20, 21, $ES_NUMBER)
	$2_digito_n_campo = GUICtrlCreateInput("", 519, 91, 20, 21, $ES_NUMBER)
	$3_digito_n_campo = GUICtrlCreateInput("", 547, 91, 20, 21, $ES_NUMBER)
	$4_digito_n_campo = GUICtrlCreateInput("", 568, 91, 20, 21, $ES_NUMBER)
	$5_digito_n_campo = GUICtrlCreateInput("", 589, 91, 20, 21, $ES_NUMBER)
	$6_digito_n_campo = GUICtrlCreateInput("", 617, 91, 20, 21, $ES_NUMBER)
	$7_digito_n_campo = GUICtrlCreateInput("", 638, 91, 20, 21, $ES_NUMBER)
	$8_digito_n_campo = GUICtrlCreateInput("", 659, 91, 20, 21, $ES_NUMBER)
	$9_digito_n_campo = GUICtrlCreateInput("", 687, 91, 20, 21)
	$Label2 = GUICtrlCreateLabel(".", 611, 72, 7, 17)
	$Label3 = GUICtrlCreateLabel("-", 682, 72, 7, 17)
	$Label1 = GUICtrlCreateLabel(".", 542, 72, 7, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlSetLimit($1_digito_n_campo, 1)
	GUICtrlSetLimit($2_digito_n_campo, 1)
	GUICtrlSetLimit($3_digito_n_campo, 1)
	GUICtrlSetLimit($4_digito_n_campo, 1)
	GUICtrlSetLimit($5_digito_n_campo, 1)
	GUICtrlSetLimit($6_digito_n_campo, 1)
	GUICtrlSetLimit($7_digito_n_campo, 1)
	GUICtrlSetLimit($8_digito_n_campo, 1)
	GUICtrlSetLimit($9_digito_n_campo, 1)

	$Group2 = GUICtrlCreateGroup("Data de Atendimento:", 490, 127, 225, 89)
	$1_digito_n_campo_data = GUICtrlCreateInput("", 498, 177, 20, 21, $ES_NUMBER)
	$2_digito_n_campo_data = GUICtrlCreateInput("", 519, 177, 20, 21, $ES_NUMBER)
	$3_digito_n_campo_data = GUICtrlCreateInput("", 547, 177, 20, 21, $ES_NUMBER)
	$4_digito_n_campo_data = GUICtrlCreateInput("", 568, 177, 20, 21, $ES_NUMBER)
	$5_digito_n_campo_data = GUICtrlCreateInput("", 597, 177, 20, 21, $ES_NUMBER)
	$6_digito_n_campo_data = GUICtrlCreateInput("", 617, 177, 20, 21, $ES_NUMBER)
	$7_digito_n_campo_data = GUICtrlCreateInput("", 638, 177, 20, 21, $ES_NUMBER)
	$8_digito_n_campo_data = GUICtrlCreateInput("", 659, 177, 20, 21, $ES_NUMBER)
	$Label4 = GUICtrlCreateLabel("/", 589, 180, 7, 17)
	$Label5 = GUICtrlCreateLabel("/", 542, 180, 7, 17)
	GUICtrlCreatePic('', 0, 3000, 470, 80) ; Cria campo imagem no form

	global $pddt = GUICtrlCreateProgress(496, 200, 215, 9)
	global $pdt = GUICtrlCreateProgress(496, 112, 215, 9)
	global $pb1 = GUICtrlCreateProgress(504, 64, 9, 25, $PBS_VERTICAL)
	global $pb2 = GUICtrlCreateProgress(522, 64, 9, 25, $PBS_VERTICAL)
	global $pb3 = GUICtrlCreateProgress(552, 64, 9, 25, $PBS_VERTICAL)
	global $pb4 = GUICtrlCreateProgress(573, 64, 9, 25, $PBS_VERTICAL)
	global $pb5 = GUICtrlCreateProgress(595, 64, 9, 25, $PBS_VERTICAL)
	global $pb6 = GUICtrlCreateProgress(622, 64, 9, 25, $PBS_VERTICAL)
	global $pb7 = GUICtrlCreateProgress(642, 64, 9, 25, $PBS_VERTICAL)
	global $pb8 = GUICtrlCreateProgress(663, 64, 9, 25, $PBS_VERTICAL)
	global $pb9 = GUICtrlCreateProgress(693, 64, 9, 25, $PBS_VERTICAL)

	global $pbd1 = GUICtrlCreateProgress(504, 152, 9, 25, $PBS_VERTICAL)
	global $pbd2 = GUICtrlCreateProgress(522, 152, 9, 25, $PBS_VERTICAL)
	global $pbd3 = GUICtrlCreateProgress(552, 152, 9, 25, $PBS_VERTICAL)
	global $pbd4 = GUICtrlCreateProgress(573, 152, 9, 25, $PBS_VERTICAL)
	global $pbd5 = GUICtrlCreateProgress(603, 152, 9, 25, $PBS_VERTICAL)
	global $pbd6 = GUICtrlCreateProgress(622, 152, 9, 25, $PBS_VERTICAL)
	global $pbd7 = GUICtrlCreateProgress(642, 152, 9, 25, $PBS_VERTICAL)
	global $pbd8 = GUICtrlCreateProgress(663, 152, 9, 25, $PBS_VERTICAL)

	global $ld1 = GUICtrlCreateLabel("", 504, 56, 7, 7)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUICtrlSetState(-1, $GUI_HIDE)
	global $ld2 = GUICtrlCreateLabel("", 522, 56, 7, 7)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUICtrlSetState(-1, $GUI_HIDE)
	global $ld3 = GUICtrlCreateLabel("", 552, 56, 7, 7)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUICtrlSetState(-1, $GUI_HIDE)
	global $ld4 = GUICtrlCreateLabel("", 573, 56, 7, 7)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUICtrlSetState(-1, $GUI_HIDE)
	global $ld5 = GUICtrlCreateLabel("", 595, 56, 7, 7)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUICtrlSetState(-1, $GUI_HIDE)
	global $ld6 = GUICtrlCreateLabel("", 622, 56, 7, 7)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUICtrlSetState(-1, $GUI_HIDE)
	global $ld7 = GUICtrlCreateLabel("", 642, 56, 7, 7)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUICtrlSetState(-1, $GUI_HIDE)
	global $ld8 = GUICtrlCreateLabel("", 663, 56, 7, 7)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUICtrlSetState(-1, $GUI_HIDE)
	global $ld9 = GUICtrlCreateLabel("", 693, 56, 7, 7)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUICtrlSetState(-1, $GUI_HIDE)

	global $ldd1 = GUICtrlCreateLabel("", 504, 144, 7, 7)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUICtrlSetState(-1, $GUI_HIDE)
	global $ldd2 = GUICtrlCreateLabel("", 522, 144, 7, 7)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUICtrlSetState(-1, $GUI_HIDE)
	global $ldd3 = GUICtrlCreateLabel("", 552, 144, 7, 7)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUICtrlSetState(-1, $GUI_HIDE)
	global $ldd4 = GUICtrlCreateLabel("", 573, 144, 7, 7)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUICtrlSetState(-1, $GUI_HIDE)
	global $ldd5 = GUICtrlCreateLabel("", 603, 144, 7, 7)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUICtrlSetState(-1, $GUI_HIDE)
	global $ldd6 = GUICtrlCreateLabel("", 622, 144, 7, 7)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUICtrlSetState(-1, $GUI_HIDE)
	global $ldd7 = GUICtrlCreateLabel("", 642, 144, 7, 7)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUICtrlSetState(-1, $GUI_HIDE)
	global $ldd8 = GUICtrlCreateLabel("", 663, 144, 7, 7)
	GUICtrlSetBkColor(-1, 0x00FF00)
	GUICtrlSetState(-1, $GUI_HIDE)



	GUICtrlSetState(-1, $GUI_DISABLE)
	global $hPic = GUICtrlGetHandle(-1)

	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlSetLimit($1_digito_n_campo_data, 1)
	GUICtrlSetLimit($2_digito_n_campo_data, 1)
	GUICtrlSetLimit($3_digito_n_campo_data, 1)
	GUICtrlSetLimit($4_digito_n_campo_data, 1)
	GUICtrlSetLimit($5_digito_n_campo_data, 1)
	GUICtrlSetLimit($6_digito_n_campo_data, 1)
	GUICtrlSetLimit($7_digito_n_campo_data, 1)
	GUICtrlSetLimit($8_digito_n_campo_data, 1)


	global $input_name[10]
	$input_name[0] = 9
	$input_name[1] = $1_digito_n_campo
	$input_name[2] = $2_digito_n_campo
	$input_name[3] = $3_digito_n_campo
	$input_name[4] = $4_digito_n_campo
	$input_name[5] = $5_digito_n_campo
	$input_name[6] = $6_digito_n_campo
	$input_name[7] = $7_digito_n_campo
	$input_name[8] = $8_digito_n_campo
	$input_name[9] = $9_digito_n_campo

	global $input_name_data[9]
	$input_name_data[0] = 8
	$input_name_data[1] = $1_digito_n_campo_data
	$input_name_data[2] = $2_digito_n_campo_data
	$input_name_data[3] = $3_digito_n_campo_data
	$input_name_data[4] = $4_digito_n_campo_data
	$input_name_data[5] = $5_digito_n_campo_data
	$input_name_data[6] = $6_digito_n_campo_data
	$input_name_data[7] = $7_digito_n_campo_data
	$input_name_data[8] = $8_digito_n_campo_data


	global $input_name_digitos[10]
	$input_name_digitos[0] = 9
	$input_name_digitos[1] = $pb1
	$input_name_digitos[2] = $pb2
	$input_name_digitos[3] = $pb3
	$input_name_digitos[4] = $pb4
	$input_name_digitos[5] = $pb5
	$input_name_digitos[6] = $pb6
	$input_name_digitos[7] = $pb7
	$input_name_digitos[8] = $pb8
	$input_name_digitos[9] = $pb9


	global $input_name_digitos_data[9]
	$input_name_digitos_data[0] = 8
	$input_name_digitos_data[1] = $pbd1
	$input_name_digitos_data[2] = $pbd2
	$input_name_digitos_data[3] = $pbd3
	$input_name_digitos_data[4] = $pbd4
	$input_name_digitos_data[5] = $pbd5
	$input_name_digitos_data[6] = $pbd6
	$input_name_digitos_data[7] = $pbd7
	$input_name_digitos_data[8] = $pbd8




	If $fics_fila = "sim" Then
		GUICtrlSetState($idSalvarButton, $GUI_SHOW)
		GUICtrlSetState($idVoltarButton, $GUI_SHOW)
		if $user_on = "Administrador - Wagner" then
			GUICtrlSetState($Bt_add_ref, $GUI_SHOW)
		Else
			GUICtrlSetState($Bt_add_ref, $GUI_Hide)
		EndIf


	Else
		GUICtrlSetState($idSalvarButton, $GUI_HIDE)
		GUICtrlSetState($idVoltarButton, $GUI_HIDE)
		GUICtrlSetState($Bt_add_ref, $GUI_HIDE)
	EndIf

	;GUICtrlSetOnEvent($idVoltarButton, "Limpa_digitos")
	;GUICtrlSetOnEvent($Bt_add_ref, "bt_add_ref")
	;GUICtrlSetOnEvent($idSalvarButton, "bt_salvar")
	;GUISetOnEvent($GUI_EVENT_CLOSE, "sair_fic")

	load_bases()
	Load_fic()

EndFunc

func sair_fic()

	GUIDelete($hGUI)

EndFunc


