Global $versao = "Beta 1.8.2"
global $versao_data = "12/11/2015"
Global $Title1 = "Visualizador de FIC" ; Name of the Window

Global $ichkBackground ; Background mode enabled disabled
Global $BSpos[2] ; Inside BlueStacks positions relative to the screen
Global $Hide = False ; If hidden or not
Global $HWnD = WinGetHandle($Title1) ;Handle for Bluestacks window
global $imagem

global $input_name[10]

global $input_name_data[9]

global $y = 0, $x = 0

global $y_data = 0, $x_data = 0

Global $1_digito_n, $2_digito_n, $3_digito_n, $4_digito_n, $5_digito_n, $6_digito_n, $7_digito_n, $8_digito_n, $9_digito_n
Global $1_digito_n_data, $2_digito_n_data, $3_digito_n_data, $4_digito_n_data, $5_digito_n_data, $6_digito_n_data, $7_digito_n_data, $8_digito_n_data
Global $n_fics_fila, $fics_fila, $modelo_fic, $campo_fics_fila, $bt_verifica_fila, $compara_digito_validador, $validadores, $compara_data, $data_atendimento, $aPos, $hBitmap, $hHBitmap, $hGUI, $hImage, $hGraphic3, $hGraphic4, $hGraphic
Global $1_digito_n_campo, $2_digito_n_campo, $3_digito_n_campo, $4_digito_n_campo, $5_digito_n_campo, $6_digito_n_campo, $7_digito_n_campo, $8_digito_n_campo, $9_digito_n_campo
Global $1_digito_n_campo_data, $2_digito_n_campo_data, $3_digito_n_campo_data, $4_digito_n_campo_data, $5_digito_n_campo_data, $6_digito_n_campo_data, $7_digito_n_campo_data, $8_digito_n_campo_data

Global $Tolerancia_campo = 150  ; Tolerancia para o campo RG

Global $Tolerancia_hifen = 200;200  ; Tolerancia para o hifen do campo RG

Global $Tolerancia_data = 100  ; Tolerancia para o campo Data de Atendimento

Global $Tolerancia_barra = 225;230  ; Tolerancia para a barra do campo Data de Atendimento

Global $achou_campo = "Não", $achou_data = "Não"

Global $PosJanela[2] = [0,0]

global $posicao_x_load_fic = 100

Global $RG_numero = "00.000.000-0"
Global $RG_numero_nomedoarquivo = "000000000"
Global $digito_verificador_rg = "vazio"

Global $sFilter = "*.JPG" ;extensão dos arquivos a serem listados

Global $imagem_path = ""

Global $data_agora = _NowDate()
Global $hora_agora = _Now()

global $debug, $console, $mensagens, $prints, $autenticacao, $sFile_add_ref, $user_on, $pause

global $lista, $fics_exportadas

global $oMyError = ObjEvent("AutoIt.Error","MyErrFunc")

global $erro_descricao = "", $erro_descricao_detalhado = ""

global $prepara_log, $rg_numero_sem_digito, $data_atendimento_sem_barra, $prepara_log_final

;======================= status bar =============================
Global $hStatus
Global $aParts[2] = [375, 500]
Global $ahIcons[2]
;======================= status bar =============================

