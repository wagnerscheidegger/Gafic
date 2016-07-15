
Func load_bases()
;=========================carrega imagens para verificação=============================

; armazena imagens da pasta $campo_RG_path para Array $campo_RG, onde o valor [0] é o total de imanges na pasta
Global $campo_RG_path = $server_path & '\images\Campo_RG'
GLOBAL $campo_RG = _FileListToArray($campo_RG_path, "*.PNG","", true)
global $total_imagens_campo = $campo_RG[0]

; armazena imagens da pasta $campo_RG_hifen_path para Array $campo_RG_hifen, onde o valor [0] é o total de imanges na pasta
Global $campo_RG_hifen_path = $server_path & '\images\Hifen'
GLOBAL $campo_RG_hifen = _FileListToArray($campo_RG_hifen_path, "*.PNG","", true)
global $total_imagens_hifen = $campo_RG_hifen[0]

; armazena imagens da pasta $campo_data_path para Array $campo_data, onde o valor [0] é o total de imanges na pasta
Global $campo_data_path = $server_path & '\images\Campo_DATA'
GLOBAL $campo_data = _FileListToArray($campo_data_path, "*.PNG","", true)
global $total_imagens_data = $campo_data[0]

; armazena imagens da pasta $campo_data_barra_path para Array $campo_data_barra, onde o valor [0] é o total de imanges na pasta
Global $campo_data_barra_path = $server_path & '\images\Barra'
GLOBAL $campo_data_barra = _FileListToArray($campo_data_barra_path, "*.PNG","", true)
global $total_imagens_barra = $campo_data_barra[0]

Global $digito_path0 = $server_path & '\images\0'
Global $digito_path1 = $server_path & '\images\1'
Global $digito_path2 = $server_path & '\images\2'
Global $digito_path3 = $server_path & '\images\3'
Global $digito_path4 = $server_path & '\images\4'
Global $digito_path5 = $server_path & '\images\5'
Global $digito_path6 = $server_path & '\images\6'
Global $digito_path7 = $server_path & '\images\7'
Global $digito_path8 = $server_path & '\images\8'
Global $digito_path9 = $server_path & '\images\9'
Global $digito_path10 = $server_path & '\images\X'
Global $digito_0 = _FileListToArray($digito_path0, "*.PNG","", true)
Global $digito_1 = _FileListToArray($digito_path1, "*.PNG","", true)
Global $digito_2 = _FileListToArray($digito_path2, "*.PNG","", true)
Global $digito_3 = _FileListToArray($digito_path3, "*.PNG","", true)
Global $digito_4 = _FileListToArray($digito_path4, "*.PNG","", true)
Global $digito_5 = _FileListToArray($digito_path5, "*.PNG","", true)
Global $digito_6 = _FileListToArray($digito_path6, "*.PNG","", true)
Global $digito_7 = _FileListToArray($digito_path7, "*.PNG","", true)
Global $digito_8 = _FileListToArray($digito_path8, "*.PNG","", true)
Global $digito_9 = _FileListToArray($digito_path9, "*.PNG","", true)
Global $digito_x = _FileListToArray($digito_path10, "*.PNG","", true)

Global $digito[11]
$digito[0] = $digito_0
$digito[1] = $digito_1
$digito[2] = $digito_2
$digito[3] = $digito_3
$digito[4] = $digito_4
$digito[5] = $digito_5
$digito[6] = $digito_6
$digito[7] = $digito_7
$digito[8] = $digito_8
$digito[9] = $digito_9
$digito[10] = $digito_x


Global $DigitoText[11] ; Texto para digito encontrado
$DigitoText[0] = "0"
$DigitoText[1] = "1"
$DigitoText[2] = "2"
$DigitoText[3] = "3"
$DigitoText[4] = "4"
$DigitoText[5] = "5"
$DigitoText[6] = "6"
$DigitoText[7] = "7"
$DigitoText[8] = "8"
$DigitoText[9] = "9"
$DigitoText[10] = "X"

;=======================
EndFunc