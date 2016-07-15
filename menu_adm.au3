
func menu_adm()
#Region ### START Koda GUI section ### Form=C:\Users\wscheidegger\Desktop\Gerenciador de Arquivamento de FIC\Autoit\GAFIC_beta 1.7\menu_adm.kxf
Opt('GUIOnEventMode', 1)
;Opt("WinWaitDelay", 60000)
global $Form1 = GUICreate("Painel Administrador GAFIC", 503, 371, 471, 194)
GUISetOnEvent($GUI_EVENT_CLOSE, "sair")
$PageControl1 = GUICtrlCreateTab(8, 8, 484, 320)
$TabSheet1 = GUICtrlCreateTabItem("Interface")
$Group3 = GUICtrlCreateGroup(" Notificações ", 20, 277, 441, 41)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
global $Chk_Mensagens = GUICtrlCreateCheckbox("Mensagens", 28, 293, 81, 17)
global $Chk_Console = GUICtrlCreateCheckbox("Console", 143, 293, 81, 17)
global $Chk_Prints = GUICtrlCreateCheckbox("Prints", 257, 293, 81, 17)
global $Chk_Referencias = GUICtrlCreateCheckbox("Referências", 372, 293, 81, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group4 = GUICtrlCreateGroup(" GAFIC ", 24, 48, 441, 217)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$Group5 = GUICtrlCreateGroup(" Arquivos ", 264, 72, 185, 185)
$Label22 = GUICtrlCreateLabel("Processados:", 280, 104, 71, 18)
$Label23 = GUICtrlCreateLabel("Em Fila:", 280, 128, 40, 18)
$Label24 = GUICtrlCreateLabel("Finalizadas: ", 280, 152, 64, 18)
global $Lbl_Processadas = GUICtrlCreateLabel("", 364, 104, 50, 18)
global $lbl_ratio_p = GUICtrlCreateLabel("",410,104,60,18)
global $lbl_ratio_f = GUICtrlCreateLabel("",410,128,60,18)
global $Lbl_fila = GUICtrlCreateLabel("", 364, 128, 50, 18)
global $Lbl_finalizadas = GUICtrlCreateLabel("", 364, 152, 50, 18)
global $Bt_processados = GUICtrlCreateButton("Liberar Processados", 272, 176, 80, 33, $BS_MULTILINE)
Global $Bt_export_list = GUICtrlCreateButton("Exportar Lista de Envio", 360, 176, 75, 33, $BS_MULTILINE)
Global $Bt_verifica_fila = GUICtrlCreateButton("Verificar Fila", 272, 216, 112, 25)
Global $CHk_verifica_Filtro = GUICtrlCreateCheckbox("Filtro? ", 392, 216, 49, 25, BitOR($GUI_SS_DEFAULT_CHECKBOX,$BS_RIGHT))
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group6 = GUICtrlCreateGroup(" Executar ", 36, 69, 217, 177)
global $campo_Caixa = GUICtrlCreateInput("", 44, 133, 89, 22, $ES_UPPERCASE)
global $campo_lote = GUICtrlCreateInput("", 148, 133, 89, 22, $ES_UPPERCASE)
global $Campo_Posto = GUICtrlCreateLabel("81109", 110, 85, 36, 18)
$Label32 = GUICtrlCreateLabel("Cidade Ademar", 152, 85, 78, 18)
global $Opt_Lote = GUICtrlCreateRadio("Lote", 116, 165, 41, 17)
global $Opt_Arquivo = GUICtrlCreateRadio("Arquivo", 44, 165, 65, 17)
global $Opt_doc = GUICtrlCreateRadio("Documento", 168, 165, 113, 17)
$Label25 = GUICtrlCreateLabel("Posto:", 68, 85, 34, 18)
$Label26 = GUICtrlCreateLabel("Caixa N:", 68, 117, 44, 16)
$Label33 = GUICtrlCreateLabel("Lote N:", 172, 117, 44, 16)
$Group7 = GUICtrlCreateGroup(" Emissão ", 44, 184, 201, 57)
global $Opt_1_Menor = GUICtrlCreateRadio("1ª Via Menor", 52, 200, 81, 17)
global $Opt_1_Maior = GUICtrlCreateRadio("1ª Via Maior", 156, 200, 81, 17)
Global $CR = GUICtrlCreateCheckbox("CR", 156, 220, 65, 17)
global $Opt_2_via = GUICtrlCreateRadio("2ª Via", 52, 220, 81, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
global $Button1 = GUICtrlCreateButton("Buscar", 36, 247, 215, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$TabSheet2 = GUICtrlCreateTabItem("Referências")
global $bt_adic_referencias = GUICtrlCreateButton("Adicionar ", 80, 184, 75, 25)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
global $lb_ref_CampoRG = GUICtrlCreateLabel("", 103, 64, 30, 18)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
global $lb_ref_CampoData = GUICtrlCreateLabel("", 103, 90, 30, 18)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
global $lb_ref_Hifen = GUICtrlCreateLabel("", 103, 116, 30, 18)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
global $lb_ref_DataBarra = GUICtrlCreateLabel("", 103, 142, 30, 18)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$Label1 = GUICtrlCreateLabel("Campo RG:", 28, 64, 58, 18)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$Label2 = GUICtrlCreateLabel("Campo Data:", 28, 90, 65, 18)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$Label3 = GUICtrlCreateLabel("Hífen:", 28, 116, 32, 18)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$Label4 = GUICtrlCreateLabel("Barra '/':", 28, 142, 48, 18)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$Group1 = GUICtrlCreateGroup("Digitos", 240, 48, 225, 169)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
global $lb_ref_digito0 = GUICtrlCreateLabel("", 311, 71, 30, 18)
global $lb_ref_digito1 = GUICtrlCreateLabel("", 311, 95, 30, 18)
global $lb_ref_digito2 = GUICtrlCreateLabel("", 311, 119, 30, 18)
global $lb_ref_digito3 = GUICtrlCreateLabel("", 311, 144, 30, 18)
global $lb_ref_digito4 = GUICtrlCreateLabel("", 311, 168, 30, 18)
global $lb_ref_digito5 = GUICtrlCreateLabel("", 311, 192, 30, 18)
global $lb_ref_digitoX = GUICtrlCreateLabel("", 420, 168, 30, 18)
global $lb_ref_digito9 = GUICtrlCreateLabel("", 420, 144, 30, 18)
global $lb_ref_digito8 = GUICtrlCreateLabel("", 420, 120, 30, 18)
global $lb_ref_digito7 = GUICtrlCreateLabel("", 420, 95, 30, 18)
global $lb_ref_digito6 = GUICtrlCreateLabel("", 420, 71, 30, 18)
$Label5 = GUICtrlCreateLabel("0:", 256, 71, 13, 18)
$Label6 = GUICtrlCreateLabel("1:", 256, 95, 13, 18)
$Label7 = GUICtrlCreateLabel("2:", 256, 119, 13, 18)
$Label8 = GUICtrlCreateLabel("3:", 256, 144, 13, 18)
$Label9 = GUICtrlCreateLabel("4:", 256, 168, 13, 18)
$Label10 = GUICtrlCreateLabel("5:", 256, 192, 13, 18)
$Label11 = GUICtrlCreateLabel("6:", 376, 71, 13, 18)
$Label12 = GUICtrlCreateLabel("7:", 376, 95, 13, 18)
$Label13 = GUICtrlCreateLabel("8:", 376, 120, 13, 18)
$Label14 = GUICtrlCreateLabel("9:", 376, 144, 13, 18)
$Label15 = GUICtrlCreateLabel("X:", 375, 168, 14, 18)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$TabSheet3 = GUICtrlCreateTabItem("Configurações")
$Group2 = GUICtrlCreateGroup(" Endereços dos arquivos ", 16, 48, 465, 233)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$Label20 = GUICtrlCreateLabel("Banco de Dados", 26, 247, 84, 18)
$Label19 = GUICtrlCreateLabel("Finalizadas", 26, 215, 58, 18)
$Label18 = GUICtrlCreateLabel("Fila de arquivos", 26, 183, 80, 18)
$Label17 = GUICtrlCreateLabel("Processadas", 26, 151, 68, 18)
$Path = GUICtrlCreateLabel("Importação", 26, 119, 57, 18)
$Label16 = GUICtrlCreateLabel("Servidor: ", 26, 87, 51, 18)
global $Txt_banco_path = GUICtrlCreateInput("Caminho do Banco de Dados", 114, 247, 350, 22)
global $Txt_final_imagens = GUICtrlCreateInput("Caminho das imagens Finalizadas", 114, 215, 350, 22)
global $Txt_fila_imagens = GUICtrlCreateInput("Caminho das imagens em fila", 114, 183, 350, 22)
global $Txt_export_imagens = GUICtrlCreateInput("Caminho das imagens em Processamento", 114, 151, 350, 22)
global $Txt_import_imagens = GUICtrlCreateInput("Caminho de importação das imagens", 114, 119, 350, 22)
global $Txt_server_path = GUICtrlCreateInput("Caminho do servidor", 114, 87, 326, 22)
global $Chk_path_padrao = GUICtrlCreateCheckbox("", 448, 88, 17, 17)
$Label21 = GUICtrlCreateLabel("Padrão", 424, 64, 38, 18)
GUICtrlCreateGroup("", -99, -99, 1, 1)
global $Bt_criar_ini = GUICtrlCreateButton("Criar", 16, 288, 75, 25)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
global $Bt_load_ini = GUICtrlCreateButton("Carregar", 104, 288, 75, 25)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$TabSheet4 = GUICtrlCreateTabItem("Usuários")
$Label27 = GUICtrlCreateLabel("Usuário:", 32, 80, 43, 17)
Global $Txt_User = GUICtrlCreateInput("", 96, 80, 185, 21)
Global $Label28 = GUICtrlCreateLabel("Senha:", 32, 128, 38, 17)
Global $Txt_Pass = GUICtrlCreateInput("", 96, 128, 185, 21)
global $Bt_Criar_User = GUICtrlCreateButton("Novo", 32, 288, 75, 25)
global $Bt_Excluir = GUICtrlCreateButton("Excluir", 112, 288, 75, 25)
global $Cb_User = GUICtrlCreateCombo("Selecione o usuário:", 96, 80, 185, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
global $Bt_alterar = GUICtrlCreateButton("Alterar", 192, 288, 75, 25)
$Group9 = GUICtrlCreateGroup(" Usuários cadastrados ", 344, 72, 129, 89)
$Label29 = GUICtrlCreateLabel("Usuários:", 352, 104, 48, 17)
$Label30 = GUICtrlCreateLabel("Adminstradores:", 352, 136, 79, 17)
$Label31 = GUICtrlCreateLabel("1", 438, 136, 10, 17)
global $Lbl_users = GUICtrlCreateLabel("Lbl_users", 438, 104, 10, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
global $Bt_status = GUICtrlCreateButton("(A)", 464, 0, 25, 25)
global $hStatus = _GUICtrlStatusBar_Create($Form1)
_GUICtrlStatusBar_SetParts($hStatus, $aParts)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

GUICtrlSetState($bt_verifica_fila, $GUI_HIDE )
GUICtrlSetState($CHk_verifica_Filtro, $GUI_HIDE)
GUICtrlSetState($Bt_processados, $GUI_HIDE )
GUICtrlSetState($Bt_export_list, $GUI_HIDE)
GUICtrlSetState($opt_arquivo, $GUI_CHECKED)
GUICtrlSetState($Opt_2_via, $GUI_CHECKED)


GUICtrlSetOnEvent($Button1, "bt_verificar")
GUICtrlSetonEvent($Chk_Mensagens, "check_adm")
GUICtrlSetonEvent($Chk_Console, "check_adm")
GUICtrlSetonEvent($Chk_Prints, "check_adm")
GUICtrlSetonEvent($Chk_Referencias, "check_adm")
GUICtrlSetOnEvent($bt_verifica_fila, "fila")
GUICtrlSetOnEvent($Bt_processados, "libera_processadas")
GUICtrlSetOnEvent($Bt_export_list, "Export_lista_excel")

GUICtrlSetOnEvent($bt_adic_referencias, "form_referencia_adm")

GUICtrlSetOnEvent($Chk_path_padrao, "padrao_ini")
GUICtrlSetOnEvent($Bt_load_ini, "alterar_ini")
GUICtrlSetOnEvent($Bt_criar_ini, "set_ini")

GUICtrlSetData($Cb_User,$user_list)
GUICtrlSetState($Txt_User, $GUI_HIDE)
GUICtrlSetState($Txt_Pass, $GUI_HIDE)
GUICtrlSetState($Label28, $GUI_HIDE)

GUICtrlSetOnEvent($Cb_User, "exibe_senha")
GUICtrlSetOnEvent($Bt_Criar_User , "cria_user")
GUICtrlSetOnEvent($Bt_Excluir , "excluir_user")
GUICtrlSetOnEvent($Bt_alterar , "alterar_user")
GUICtrlSetOnEvent($Bt_status, "status")

EndFunc

Func exibe_senha()
	For $i = 1 to $user_count Step 3
		if GUICtrlRead($Cb_User,0) = $iniArray_user[$i][1] Then
			GUICtrlSetData($Txt_Pass, $iniArray_user[$i+1][1])
			GUICtrlSetState($Txt_Pass, $GUI_SHOW)
			GUICtrlSetState($Txt_Pass, $GUI_DISABLE)
			GUICtrlSetState($Label28, $GUI_SHOW)
		EndIf
	Next
EndFunc

Func cria_user()

	if GUICtrlRead($Bt_Criar_User, 0) = "Salvar" Then
		cria_autenticacao(GUICtrlRead($Txt_User,1), GUICtrlRead($Txt_Pass,1))
		FileWriteLine($ini_Path, @CRLF&"User="&GUICtrlRead($Txt_User,1))
		FileWriteLine($ini_Path, "pass="&GUICtrlRead($Txt_Pass,1))
		FileWriteLine($ini_Path, "authentic="&$autenticacao)
		GUICtrlSetState($Cb_User, $GUI_SHOW)
		GUICtrlSetState($Txt_User, $GUI_HIDE)
		GUICtrlSetState($Txt_Pass, $GUI_HIDE)
		GUICtrlSetState($Label28, $GUI_HIDE)
		GUICtrlSetData($Txt_User, "")
		GUICtrlSetData($Txt_Pass, "")
		GUICtrlSetData($Cb_User,"")
		Carrega_users2()
		GUICtrlSetData($Cb_User,$user_list)
		GUICtrlSetData($Bt_Criar_User, "Novo")
	Else
		GUICtrlSetData($Txt_User, "")
		GUICtrlSetData($Txt_Pass, "")
		GUICtrlSetState($Cb_User, $GUI_HIDE)
		GUICtrlSetState($Txt_User, $GUI_SHOW)
		GUICtrlSetState($Txt_Pass, $GUI_SHOW)
		GUICtrlSetState($Txt_Pass, $GUI_ENABLE)
		GUICtrlSetState($Label28, $GUI_SHOW)
		GUICtrlSetData($Bt_Criar_User, "Salvar")
	EndIf

EndFunc

func form_referencia_adm()
form_referencia("Adm")
EndFunc


Func excluir_user()

	Local $sFileContent1 = StringRegExpReplace(FileRead($ini_Path), "User="&GUICtrlRead($Cb_User,0), "\1")
	Local $hFOpen = FileOpen($ini_Path, 2)
	FileWrite($hFOpen, StringStripWS($sFileContent1, 3))
	FileClose($hFOpen)

	Local $sFileContent2 = StringRegExpReplace(FileRead($ini_Path), "pass="&GUICtrlRead($Txt_Pass,1), "\1")
	Local $hFOpen2 = FileOpen($ini_Path, 2)
	FileWrite($hFOpen2, StringStripWS($sFileContent2, 3))
	FileClose($hFOpen2)

	local $autentic = cria_autenticacao(GUICtrlRead($Cb_User,0), GUICtrlRead($Txt_Pass,1))
	Local $sFileContent3 = StringRegExpReplace(FileRead($ini_Path), "authentic="&$autentic, "\1")
	Local $hFOpen3 = FileOpen($ini_Path, 2)
	FileWrite($hFOpen3, StringStripWS($sFileContent3, 3))
	FileClose($hFOpen3)

	Local $sFileContent4 = StringRegExpReplace(FileRead($ini_Path), "(\r\n){1,}", "\1")
	Local $hFOpen4 = FileOpen($ini_Path, 2)
	FileWrite($hFOpen4, StringStripWS($sFileContent4, 3))
	FileClose($hFOpen4)

	GUICtrlSetState($Txt_Pass, $GUI_HIDE)
	GUICtrlSetState($Txt_Pass, $GUI_DISABLE)
	GUICtrlSetState($Label28, $GUI_HIDE)

	GUICtrlSetData($Cb_User,"")
	Carrega_users2()
	GUICtrlSetData($Cb_User,$user_list)

EndFunc

func alterar_user()
	if GUICtrlRead($Bt_alterar, 0) = "Salvar" Then
		cria_autenticacao(GUICtrlRead($Txt_User,1), GUICtrlRead($Txt_Pass,1))
		FileWriteLine($ini_Path, @CRLF&"User="&GUICtrlRead($Txt_User,1))
		FileWriteLine($ini_Path, "pass="&GUICtrlRead($Txt_Pass,1))
		FileWriteLine($ini_Path, "authentic="&$autenticacao)
		GUICtrlSetState($Cb_User, $GUI_SHOW)
		GUICtrlSetState($Txt_User, $GUI_HIDE)
		GUICtrlSetState($Txt_Pass, $GUI_HIDE)
		GUICtrlSetState($Label28, $GUI_HIDE)
		GUICtrlSetData($Txt_User, "")
		GUICtrlSetData($Txt_Pass, "")
		GUICtrlSetData($Cb_User,"")
		Carrega_users2()
		GUICtrlSetData($Cb_User,$user_list)
		GUICtrlSetData($Bt_alterar, "Alterar")
	Else
		Local $sFileContent1 = StringRegExpReplace(FileRead($ini_Path), "User="&GUICtrlRead($Cb_User,0), "\1")
		Local $hFOpen = FileOpen($ini_Path, 2)
		FileWrite($hFOpen, StringStripWS($sFileContent1, 3))
		FileClose($hFOpen)

		Local $sFileContent2 = StringRegExpReplace(FileRead($ini_Path), "pass="&GUICtrlRead($Txt_Pass,1), "\1")
		Local $hFOpen2 = FileOpen($ini_Path, 2)
		FileWrite($hFOpen2, StringStripWS($sFileContent2, 3))
		FileClose($hFOpen2)

		local $autentic = cria_autenticacao(GUICtrlRead($Cb_User,0), GUICtrlRead($Txt_Pass,1))
		Local $sFileContent3 = StringRegExpReplace(FileRead($ini_Path), "authentic="&$autentic, "\1")
		Local $hFOpen3 = FileOpen($ini_Path, 2)
		FileWrite($hFOpen3, StringStripWS($sFileContent3, 3))
		FileClose($hFOpen3)

		Local $sFileContent4 = StringRegExpReplace(FileRead($ini_Path), "(\r\n){1,}", "\1")
		Local $hFOpen4 = FileOpen($ini_Path, 2)
		FileWrite($hFOpen4, StringStripWS($sFileContent4, 3))
		FileClose($hFOpen4)

		GUICtrlSetState($Cb_User, $GUI_HIDE)
		GUICtrlSetData($Txt_User, GUICtrlRead($Cb_User,0))
		GUICtrlSetState($Txt_User, $GUI_SHOW)
		GUICtrlSetState($Txt_Pass, $GUI_SHOW)
		GUICtrlSetState($Txt_Pass, $GUI_ENABLE)
		GUICtrlSetState($Label28, $GUI_SHOW)

		GUICtrlSetData($Bt_alterar, "Salvar")
	EndIf
EndFunc

func check_adm()

	If BitAND(GUICtrlRead($Chk_Mensagens), $GUI_CHECKED) = $GUI_CHECKED Then
		global $mensagens = "Yes"
	Else
		global $mensagens = "No"
	EndIf

	If BitAND(GUICtrlRead($Chk_Console), $GUI_CHECKED) = $GUI_CHECKED Then
		global $console = "Yes"
	Else
		global $console = "No"
	EndIf

	If BitAND(GUICtrlRead($Chk_Referencias), $GUI_CHECKED) = $GUI_CHECKED Then
		global $debug = "Yes"
	Else
		global $debug = "No"
	EndIf

	If BitAND(GUICtrlRead($Chk_Prints), $GUI_CHECKED) = $GUI_CHECKED Then
		global $prints = "Yes"
	Else
		global $prints = "No"
	EndIf

EndFunc


func bt_verificar()

	check_adm()

	abrir()

EndFunc

func padrao_ini()

	if BitAND(GUICtrlRead($Chk_path_padrao), $GUI_CHECKED) = $GUI_CHECKED then
		GUICtrlSetData($Txt_import_imagens, GUICtrlRead($Txt_server_path,1)&"\Temp")
		GUICtrlSetData($Txt_export_imagens, GUICtrlRead($Txt_server_path,1)&"\Processadas")
		GUICtrlSetData($Txt_fila_imagens, GUICtrlRead($Txt_server_path,1)&"\Fila")
		GUICtrlSetData($Txt_final_imagens, GUICtrlRead($Txt_server_path,1)&"\Finalizadas")
		GUICtrlSetData($Txt_banco_path, GUICtrlRead($Txt_server_path,1)&"\Banco")
		GUICtrlSetState($Txt_import_imagens, $GUI_DISABLE)
		GUICtrlSetState($Txt_export_imagens, $GUI_DISABLE)
		GUICtrlSetState($Txt_fila_imagens, $GUI_DISABLE)
		GUICtrlSetState($Txt_final_imagens, $GUI_DISABLE)
		GUICtrlSetState($Txt_banco_path, $GUI_DISABLE)
	Else
		GUICtrlSetState($Txt_import_imagens, $GUI_ENABLE)
		GUICtrlSetState($Txt_export_imagens, $GUI_ENABLE)
		GUICtrlSetState($Txt_fila_imagens, $GUI_ENABLE)
		GUICtrlSetState($Txt_final_imagens, $GUI_ENABLE)
		GUICtrlSetState($Txt_banco_path, $GUI_ENABLE)
	EndIf

EndFunc

func alterar_ini()
	if GUICtrlRead($Bt_load_ini, 0) = "Salvar" Then
		set_ini()
		GUICtrlSetData($Bt_load_ini, "Carregar")
	Else
		load_ini()
		GUICtrlSetData($Bt_load_ini, "Salvar")
	EndIf
EndFunc



func set_ini()

		if BitAND(GUICtrlRead($Chk_path_padrao), $GUI_CHECKED) = $GUI_CHECKED then
			GUICtrlSetData($Txt_import_imagens, GUICtrlRead($Txt_server_path,1)&"\Temp")
			GUICtrlSetData($Txt_export_imagens, GUICtrlRead($Txt_server_path,1)&"\Processadas")
			GUICtrlSetData($Txt_fila_imagens, GUICtrlRead($Txt_server_path,1)&"\Fila")
			GUICtrlSetData($Txt_final_imagens, GUICtrlRead($Txt_server_path,1)&"\Finalizadas")
			GUICtrlSetData($Txt_banco_path, GUICtrlRead($Txt_server_path,1)&"\Banco")

			IniWrite($ini_Path, "Servidor", "server_path", GUICtrlRead($Txt_server_path,1))
			if DirGetSize(GUICtrlRead($Txt_server_path,1)) <> -1 Then
				If $console = "Yes" then ConsoleWrite("a Pasta: "& $Txt_server_path&" já existe!")
			Else
				DirCreate(GUICtrlRead($Txt_server_path,1))
			EndIf

			IniWrite($ini_Path, "Servidor", "import_imagens", GUICtrlRead($Txt_import_imagens,1))
			if DirGetSize(GUICtrlRead($Txt_import_imagens,1)) <> -1 Then
				If $console = "Yes" then ConsoleWrite("a Pasta: "& $Txt_import_imagens&" já existe!")
			Else
				DirCreate(GUICtrlRead($Txt_import_imagens,1))
			EndIf
			IniWrite($ini_Path, "Servidor", "export_imagens", GUICtrlRead($Txt_export_imagens,1))
			if DirGetSize(GUICtrlRead($Txt_export_imagens,1)) <> -1 Then
				If $console = "Yes" then ConsoleWrite("a Pasta: "& $Txt_export_imagens&" já existe!")
			Else
				DirCreate(GUICtrlRead($Txt_export_imagens,1))
			EndIf
			IniWrite($ini_Path, "Servidor", "fila_imagens", GUICtrlRead($Txt_fila_imagens,1))
			if DirGetSize(GUICtrlRead($Txt_fila_imagens,1)) <> -1 Then
				If $console = "Yes" then ConsoleWrite("a Pasta: "&$Txt_fila_imagens&" já existe!")
			Else
				DirCreate(GUICtrlRead($Txt_fila_imagens,1))
			EndIf
			IniWrite($ini_Path, "Servidor", "final_imagens", GUICtrlRead($Txt_final_imagens,1))
			if DirGetSize(GUICtrlRead($Txt_final_imagens,1)) <> -1 Then
				If $console = "Yes" then ConsoleWrite("a Pasta: "&$Txt_final_imagens&" já existe!")
			Else
				DirCreate(GUICtrlRead($Txt_final_imagens,1))
			EndIf
			IniWrite($ini_Path, "Servidor", "banco_path", GUICtrlRead($Txt_banco_path,1))
			if DirGetSize(GUICtrlRead($Txt_banco_path,1)) <> -1 Then
				If $console = "Yes" then ConsoleWrite("a Pasta: "&$Txt_banco_path&" já existe!")
			Else
				DirCreate(GUICtrlRead($Txt_banco_path,1))
			EndIf
		Else
			IniWrite($ini_Path, "Servidor", "server_path", GUICtrlRead($Txt_server_path,1))
			if DirGetSize(GUICtrlRead($Txt_server_path,1)) <> -1 Then
				If $console = "Yes" then ConsoleWrite("a Pasta: "& $Txt_server_path&" já existe!")
			Else
				DirCreate(GUICtrlRead($Txt_server_path,1))
			EndIf

			IniWrite($ini_Path, "Servidor", "import_imagens", GUICtrlRead($Txt_import_imagens,1))
			if DirGetSize(GUICtrlRead($Txt_import_imagens,1)) <> -1 Then
				If $console = "Yes" then ConsoleWrite("a Pasta: "& $Txt_import_imagens&" já existe!")
			Else
				DirCreate(GUICtrlRead($Txt_import_imagens,1))
			EndIf
			IniWrite($ini_Path, "Servidor", "export_imagens", GUICtrlRead($Txt_export_imagens,1))
			if DirGetSize(GUICtrlRead($Txt_export_imagens,1)) <> -1 Then
				If $console = "Yes" then ConsoleWrite("a Pasta: "& $Txt_export_imagens&" já existe!")
			Else
				DirCreate(GUICtrlRead($Txt_export_imagens,1))
			EndIf
			IniWrite($ini_Path, "Servidor", "fila_imagens", GUICtrlRead($Txt_fila_imagens,1))
			if DirGetSize(GUICtrlRead($Txt_fila_imagens,1)) <> -1 Then
				If $console = "Yes" then ConsoleWrite("a Pasta: "&$Txt_fila_imagens&" já existe!")
			Else
				DirCreate(GUICtrlRead($Txt_fila_imagens,1))
			EndIf
			IniWrite($ini_Path, "Servidor", "final_imagens", GUICtrlRead($Txt_final_imagens,1))
			if DirGetSize(GUICtrlRead($Txt_final_imagens,1)) <> -1 Then
				If $console = "Yes" then ConsoleWrite("a Pasta: "&$Txt_final_imagens&" já existe!")
			Else
				DirCreate(GUICtrlRead($Txt_final_imagens,1))
			EndIf
			IniWrite($ini_Path, "Servidor", "banco_path", GUICtrlRead($Txt_banco_path,1))
			if DirGetSize(GUICtrlRead($Txt_banco_path,1)) <> -1 Then
				If $console = "Yes" then ConsoleWrite("a Pasta: "&$Txt_banco_path&" já existe!")
			Else
				DirCreate(GUICtrlRead($Txt_banco_path,1))
			EndIf
		EndIf

EndFunc

func load_ini()
	if FileExists($ini_Path) Then
		GUICtrlSetData($Txt_server_path, $server_path)
		GUICtrlSetData($Txt_import_imagens, $import_imagens)
		GUICtrlSetData($Txt_export_imagens, $export_imagens)
		GUICtrlSetData($Txt_fila_imagens, $fila_imagens)
		GUICtrlSetData($Txt_final_imagens, $final_imagens)
		GUICtrlSetData($Txt_banco_path, $banco_path)
	Else
		msgbox(0,"","Arquivo .INI não encontrado! Utilize a opção 'Criar'")
	EndIf
EndFunc

func status()

	_GUICtrlStatusBar_SetText($hStatus, ">>>>> Finanlizando, por favor aguarde! <<<<<") ;display in status bar o texto

	verifica_fila_pastas()

	local $arquivos_fila = _FileListToArray($fila_imagens, "*.JPG", "", false)
	if IsArray($arquivos_fila) Then
		GUICtrlSetData($Lbl_fila, $arquivos_fila[0])
		GUICtrlSetState($bt_verifica_fila, $GUI_SHOW)
		GUICtrlSetState($CHk_verifica_Filtro, $GUI_SHOW)
	Else
		GUICtrlSetData($Lbl_fila, "0")
		GUICtrlSetState($bt_verifica_fila, $GUI_HIDE)
		GUICtrlSetState($CHk_verifica_Filtro, $GUI_HIDE)
	EndIf

	local $arquivos_processados = _FileListToArray($export_imagens, "*.JPG", "", false)
	if IsArray($arquivos_processados) Then
		GUICtrlSetData($Lbl_processadas, $arquivos_processados[0])
		GUICtrlSetState($Bt_processados, $GUI_SHOW)

		local $ratio_p = Round(((GUICtrlRead($Lbl_processadas, 1) / (GUICtrlRead($Lbl_processadas, 1) + GUICtrlRead($Lbl_fila, 1)))*100), 2)&"%"
		GUICtrlSetData($Lbl_ratio_p, $ratio_p)

		local $ratio_f = Round(((GUICtrlRead($Lbl_fila, 1) / (GUICtrlRead($Lbl_processadas, 1) + GUICtrlRead($Lbl_fila, 1)))*100), 2)&"%"
		GUICtrlSetData($Lbl_ratio_f, $ratio_f)

	Else
		GUICtrlSetData($Lbl_processadas, "0")
		GUICtrlSetData($Lbl_ratio_p, "")
		GUICtrlSetData($Lbl_ratio_f, "")
		GUICtrlSetState($Bt_processados, $GUI_HIDE)
	EndIf



	local $arquivos_final = _FileListToArrayRec($final_imagens, "*.JPG", $FLTAR_RECUR, $FLTAR_SORT) ; use $FLTAR_FILESFOLDERS para contar as pastas
	if  IsArray($arquivos_final) Then
		GUICtrlSetData($Lbl_finalizadas, $arquivos_final[0])
	Else
		GUICtrlSetData($Lbl_finalizadas, "0")
	EndIf

	if IsArray($arquivos_fila) = False and IsArray($arquivos_processados) = false and IsArray($arquivos_final) Then
		GUICtrlSetState($Bt_export_list, $GUI_SHOW)
		_GUICtrlStatusBar_SetText($hStatus, "Pronto!") ;display in status bar o texto
	Else
		GUICtrlSetState($Bt_export_list, $GUI_HIDE)
	EndIf

	GUICtrlSetData($Lbl_users, $user_count/3)

load_bases()

	if IsArray($campo_RG) Then
		GUICtrlSetData($lb_ref_CampoRG, $campo_RG[0])
	Else
		GUICtrlSetData($lb_ref_CampoRG, "0")
	EndIf
	if IsArray($campo_RG_hifen) Then
		GUICtrlSetData($lb_ref_Hifen, $campo_RG_hifen[0])
	Else
		GUICtrlSetData($lb_ref_Hifen, "0")
	EndIf
	if IsArray($campo_data) Then
		GUICtrlSetData($lb_ref_CampoData, $campo_data[0])
	Else
		GUICtrlSetData($lb_ref_CampoData, "0")
	EndIf
	if IsArray($campo_data_barra) Then
		GUICtrlSetData($lb_ref_DataBarra, $campo_data_barra[0])
	Else
		GUICtrlSetData($lb_ref_DataBarra, "0")
	EndIf
	if IsArray($digito_0) Then
		GUICtrlSetData($lb_ref_digito0, $digito_0[0])
	Else
		GUICtrlSetData($lb_ref_digito0, "0")
	EndIf
	if IsArray($digito_1) Then
		GUICtrlSetData($lb_ref_digito1, $digito_1[0])
	Else
		GUICtrlSetData($lb_ref_digito1, "0")
	EndIf
	if IsArray($digito_2) Then
		GUICtrlSetData($lb_ref_digito2, $digito_2[0])
	Else
		GUICtrlSetData($lb_ref_digito2, "0")
	EndIf
	if IsArray($digito_3) Then
		GUICtrlSetData($lb_ref_digito3, $digito_3[0])
	Else
		GUICtrlSetData($lb_ref_digito3, "0")
	EndIf
	if IsArray($digito_4) Then
		GUICtrlSetData($lb_ref_digito4, $digito_4[0])
	Else
		GUICtrlSetData($lb_ref_digito4, "0")
	EndIf
	if IsArray($digito_5) Then
		GUICtrlSetData($lb_ref_digito5, $digito_5[0])
	Else
		GUICtrlSetData($lb_ref_digito5, "0")
	EndIf
	if IsArray($digito_6) Then
		GUICtrlSetData($lb_ref_digito6, $digito_6[0])
	Else
		GUICtrlSetData($lb_ref_digito6, "0")
	EndIf
	if IsArray($digito_7) Then
		GUICtrlSetData($lb_ref_digito7, $digito_7[0])
	Else
		GUICtrlSetData($lb_ref_digito7, "0")
	EndIf
	if IsArray($digito_8) Then
		GUICtrlSetData($lb_ref_digito8, $digito_8[0])
	Else
		GUICtrlSetData($lb_ref_digito8, "0")
	EndIf
	if IsArray($digito_9) Then
		GUICtrlSetData($lb_ref_digito9, $digito_9[0])
	Else
		GUICtrlSetData($lb_ref_digito9, "0")
	EndIf
	if IsArray($digito_x) Then
		GUICtrlSetData($lb_ref_digitox, $digito_x[0])
	Else
		GUICtrlSetData($lb_ref_digitox, "0")
	EndIf



EndFunc

func status_user()

	_GUICtrlStatusBar_SetText($hStatus, ">>>>> Finanlizando, por favor aguarde! <<<<<") ;display in status bar o texto

	verifica_fila_pastas()
	global $arquivos_fila = _FileListToArray($fila_imagens, "*.JPG", "", false)

	if IsArray($arquivos_fila) Then
		GUICtrlSetData($Lbl_fila, $arquivos_fila[0])
		GUICtrlSetState($bt_verifica_fila, $GUI_SHOW)
		GUICtrlSetState($CHk_verifica_Filtro, $GUI_SHOW)
	Else
		GUICtrlSetData($Lbl_fila, "0")
		GUICtrlSetState($bt_verifica_fila, $GUI_HIDE)
		GUICtrlSetState($CHk_verifica_Filtro, $GUI_HIDE)
	EndIf

	local $arquivos_processados = _FileListToArray($export_imagens, "*.JPG", "", false)
	if IsArray($arquivos_processados) Then
		GUICtrlSetData($Lbl_processadas, $arquivos_processados[0])
		GUICtrlSetState($Bt_processados, $GUI_SHOW)

		local $ratio_p = Round(((GUICtrlRead($Lbl_processadas, 1) / (GUICtrlRead($Lbl_processadas, 1) + GUICtrlRead($Lbl_fila, 1)))*100), 2)&"%"
		GUICtrlSetData($Lbl_ratio_p, $ratio_p)

		local $ratio_f = Round(((GUICtrlRead($Lbl_fila, 1) / (GUICtrlRead($Lbl_processadas, 1) + GUICtrlRead($Lbl_fila, 1)))*100), 2)&"%"
		GUICtrlSetData($Lbl_ratio_f, $ratio_f)

	Else
		GUICtrlSetData($Lbl_processadas, "0")
		GUICtrlSetData($Lbl_ratio_p, "")
		GUICtrlSetData($Lbl_ratio_f, "")
		GUICtrlSetState($Bt_processados, $GUI_HIDE)
	EndIf

	local $arquivos_final = _FileListToArrayRec($final_imagens, "*.JPG", $FLTAR_RECUR, $FLTAR_SORT) ; use $FLTAR_FILESFOLDERS para contar as pastas
	if  IsArray($arquivos_final) Then
		GUICtrlSetData($Lbl_finalizadas, $arquivos_final[0])
	Else
		GUICtrlSetData($Lbl_finalizadas, "0")
	EndIf

	if IsArray($arquivos_fila) = False and IsArray($arquivos_processados) = false and IsArray($arquivos_final) Then
		GUICtrlSetState($Bt_export_list, $GUI_SHOW)
		_GUICtrlStatusBar_SetText($hStatus, "Pronto!") ;display in status bar o texto
	Else
		GUICtrlSetState($Bt_export_list, $GUI_HIDE)
	EndIf



EndFunc


Func sair()
exit
EndFunc
