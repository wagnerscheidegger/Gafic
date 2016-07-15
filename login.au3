#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>


;===========================carrega INI======================
;global Const $ini_Path = @ScriptDir&"\Config.ini" ; Declara o local do arquivo INI
	Global $iniArray_user = IniReadSection($ini_Path, "Usuarios")
	if @error <> 1 Then
		global $user_count = $iniArray_user[0][0]
	Else
		global $user_count =0
	EndIf
		global $user_list
		global $User, $Button1, $Pass, $login

;=======================fim carrega INI======================

;Load_form_login()

;HotKeySet("{enter}", "verifica_senha")

Func Load_form_login()
	#Region ### START Koda GUI section ### Form=c:\users\wscheidegger\desktop\gerenciador de arquivamento de fic\autoit\gafic_beta 1.7\login.kxf
	$Form2 = GUICreate("GAFIC Login", 335, 196, 594, 303)
	$Label3 = GUICtrlCreateLabel("Gerenciador de Arquivamento de FIC", 8, 8, 319, 28)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
	$Pass = GUICtrlCreateInput("Pass", 183, 112, 137, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_PASSWORD))
	$Label1 = GUICtrlCreateLabel("Usuário", 69, 88, 40, 17)
	$Label2 = GUICtrlCreateLabel("Senha", 232, 88, 35, 17)
	$Button1 = GUICtrlCreateButton("Entrar", 130, 152, 75, 25)
	$User = GUICtrlCreateCombo("Selecione o Usuário", 17, 112, 145, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
	$Label4 = GUICtrlCreateLabel("Por favor informe seu Usuário e Senha para entrar.", 46, 56, 243, 17)
	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###
	Carrega_users()

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $Button1
				verifica_senha()
		EndSwitch
	WEnd

EndFunc


Func Carrega_users()
	if $user_count > 3 Then
		For $i = 1 to $user_count Step 3
			$user_list = $user_list & $iniArray_user[$i][1]&"|"
			;MsgBox(0,"",$user_list)
		Next
		GUICtrlSetData($User,$user_list)
	EndIf
	if $user_count = 3 Then
		$user_list = $iniArray_user[1][1]
		;MsgBox(0,"",$user_list)
		GUICtrlSetData($User,$user_list)
	EndIf
	if $user_count = 0 Then
		MsgBox(0,"Nenhum usuário cadastrado", "Atenção, não foram encontrados registros de usuários.")
	EndIf
EndFunc


Func verifica_senha()

		if $user_count > 3 Then

			if GUICtrlRead($User,0) = "Wagner" and GUICtrlRead($Pass,0) = "camila01" then
				GUIDelete("GAFIC Login")
				$user_on = "Administrador - Wagner"
				$login = "ok"
				menu_adm()
			Else
				For $i = 1 to $user_count Step 3
					local $autentic = cria_autenticacao(GUICtrlRead($User,0), GUICtrlRead($Pass,0))
					if GUICtrlRead($User,0) = $iniArray_user[$i][1] and GUICtrlRead($Pass,0) = $iniArray_user[$i+1][1] and $autentic = $iniArray_user[$i+2][1] Then
						GUIDelete("GAFIC Login")
						$user_on = $iniArray_user[$i][1]
						$login = "ok"
						Menu()
						ExitLoop
					Else
						$login = "erro"

					EndIf
				Next
			EndIf

		EndIf
		if $user_count = 3 Then
			if GUICtrlRead($User,0) = "Wagner" and GUICtrlRead($Pass,0) = "camila01" then
				GUIDelete("GAFIC Login")
				$user_on = "Administrador - Wagner"
				$login = "ok"
				menu_adm()
			Else
				For $i = 1 to $user_count Step 3
					local $autentic = cria_autenticacao(GUICtrlRead($User,0), GUICtrlRead($Pass,0))
					if GUICtrlRead($User,0) = $iniArray_user[$i][1] and GUICtrlRead($Pass,0) = $iniArray_user[$i+1][1] and $autentic = $iniArray_user[$i+2][1] Then
						GUIDelete("GAFIC Login")
						$user_on = $iniArray_user[$i][1]
						$login = "ok"
						Menu()
						ExitLoop
					Else
						$login = "erro"

					EndIf
				Next
			EndIf
		EndIf
		if $user_count = 0 and GUICtrlRead($User,0) = "Wagner" and GUICtrlRead($Pass,0) = "camila01" then
			GUIDelete("GAFIC Login")
			$user_on = "Administrador - Wagner"
			menu_adm()
		Elseif $user_count = 0 and GUICtrlRead($User,0) <> "Wagner" and GUICtrlRead($Pass,0) <> "camila01" then
			MsgBox(0,"Nenhum usuário cadastrado", "Atenção, não foram encontrados registros de usuários, por favor entre em contato com o Administrador.")
		EndIf

		if $login = "erro" Then
			MsgBox(0,"Dados incorretos","Usuário e senha incorretos")
		EndIf

EndFunc

Func Carrega_users2()
	Global $iniArray_user = IniReadSection($ini_Path, "Usuarios")
	global $user_count = $iniArray_user[0][0]
	if $user_count > 3 Then
		For $i = 1 to $user_count Step 3
			if $i = 1 Then
				$user_list = $iniArray_user[$i][1]&"|"
				;MsgBox(0,"1",$user_list)
			Else
				$user_list = $user_list&$iniArray_user[$i][1]&"|"
				;MsgBox(0,"2",$user_list)
			EndIf

			;MsgBox(0,"3",$user_list)
		Next
		;GUICtrlSetData($User,$user_list)
	EndIf
	if $user_count = 3 Then
		$user_list = $iniArray_user[1][1]
		;MsgBox(0,"",$user_list)
		;GUICtrlSetData($User,$user_list)
	EndIf
	if $user_count = 0 Then
		MsgBox(0,"Nenhum usuário cadastrado", "Atenção, não foram encontrados registros de usuários, por favor entre em contato com o Administrador.")
	EndIf
EndFunc


func cria_autenticacao($user_name, $pass_st)
local $tt_st_user = StringLen($user_name)
local $tt_st_pass = StringLen($pass_st)
local $1_st_user = StringLeft($user_name, 1)
local $2_st_user = StringRight($user_name, 1)
local $1_st_pass = StringLeft($pass_st, 1)
local $2_st_pass = StringRight($pass_st, 1)

global $autenticacao = $1_st_user&(2*$tt_st_user)&$2_st_user&($tt_st_user+$tt_st_pass)&$1_st_pass&(3*$tt_st_pass)&$2_st_pass

	Return $autenticacao

EndFunc