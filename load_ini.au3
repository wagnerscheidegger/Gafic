;===========================carrega INI======================

global Const $ini_Path = @ScriptDir&"\Config.ini" ; Declara o local do arquivo INI
if FileExists($ini_Path) = False Then
	FileWrite($ini_Path, "[Servidor]"&@CRLF)
	FileWriteLine($ini_Path, "[Usuarios]")
	global $server_path = 0; caminho principal do GAFIC
	global $import_imagens = 0 ; caminho da pasta que contem os arquivos a serem verificados
	global $export_imagens = 0 ; caminho da pasta PROCESSADOS após verificação
	global $fila_imagens = 0 ; caminho da pasta FILA após verificação
	global $final_imagens = 0 ; caminho da pasta FINALIZADAS após verificação e carimbo
	global $banco_path = 0 ; caminho do Banco de Dados
Else
	Global $iniArray = IniReadSection($ini_Path, "Servidor")
	global $server_path = $iniArray[1][1] ; caminho principal do GAFIC
	global $import_imagens = $iniArray[2][1] ; caminho da pasta que contem os arquivos a serem verificados
	global $export_imagens = $iniArray[3][1] ; caminho da pasta PROCESSADOS após verificação
	global $fila_imagens = $iniArray[4][1] ; caminho da pasta FILA após verificação
	global $final_imagens = $iniArray[5][1] ; caminho da pasta FINALIZADAS após verificação e carimbo
	global $banco_path = $iniArray[6][1] ; caminho do Banco de Dados
EndIf
;=======================fim carrega INI======================

;========================caminho dos logs========================
global $Arquivo_TXT_path = $banco_path & "\imagens_gafic.txt"
global $Arquivo_TXT_list_path = $banco_path & "\imagens_gafic_list.txt"
global $Arquivo_TXT_erro_path = $banco_path & '\imagens_gafic_erros.txt'
global $Arquivo_TXT_report_path = $banco_path & '\imagens_gafic_report.txt'
;=====================fim caminho dos logs========================