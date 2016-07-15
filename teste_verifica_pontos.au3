#include <Constants.au3>
#include <GUIConstantsEx.au3>
#include <GuiConstants.au3>
#include <GDIPlus.au3>
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


Global $pontos_digitos[60][4];=================dimensão 60x4 por termos 6 pontos para cada digito

;============= P1 do "0" =============
$pontos_digitos[0][0] = "0"
$pontos_digitos[0][1] = "P1"
$pontos_digitos[0][2] = 0
$pontos_digitos[0][3] = 0
;============= P2 do "0" =============
$pontos_digitos[1][0] = "0"
$pontos_digitos[1][1] = "P2"
$pontos_digitos[1][2] = 10
$pontos_digitos[1][3] = -4
;============= P3 do "0" =============
$pontos_digitos[2][0] = "0"
$pontos_digitos[2][1] = "P3"
$pontos_digitos[2][2] = 21
$pontos_digitos[2][3] = 0
;============= P4 do "0" =============
$pontos_digitos[3][0] = "0"
$pontos_digitos[3][1] = "P4"
$pontos_digitos[3][2] = 21
$pontos_digitos[3][3] = 18
;============= P5 do "0" =============
$pontos_digitos[4][0] = "0"
$pontos_digitos[4][1] = "P5"
$pontos_digitos[4][2] = 10
$pontos_digitos[4][3] = 22
;============= P6 do "0" =============
$pontos_digitos[5][0] = "0"
$pontos_digitos[5][1] = "P6"
$pontos_digitos[5][2] = 0
$pontos_digitos[5][3] = 18


;============= P1 do "1" =============
$pontos_digitos[6][0] = "1"
$pontos_digitos[6][1] = "P1"
$pontos_digitos[6][2] = 0
$pontos_digitos[6][3] = 0
;============= P2 do "1" =============
$pontos_digitos[7][0] = "1"
$pontos_digitos[7][1] = "P2"
$pontos_digitos[7][2] = 8
$pontos_digitos[7][3] = -5
;============= P3 do "1" =============
$pontos_digitos[8][0] = "1"
$pontos_digitos[8][1] = "P3"
$pontos_digitos[8][2] = 15
$pontos_digitos[8][3] = 21
;============= P4 do "1" =============
$pontos_digitos[9][0] = "1"
$pontos_digitos[9][1] = "P4"
$pontos_digitos[9][2] = 1
$pontos_digitos[9][3] = 21
;============= P5 do "1" =============
$pontos_digitos[10][0] = "1"
$pontos_digitos[10][1] = "P5"
$pontos_digitos[10][2] = 8
$pontos_digitos[10][3] = 14
;============= P6 do "1" =============
$pontos_digitos[11][0] = "1"
$pontos_digitos[11][1] = "P6"
$pontos_digitos[11][2] = 8
$pontos_digitos[11][3] = 1


;============= P1 do "2" =============
$pontos_digitos[12][0] = "2"
$pontos_digitos[12][1] = "P1"
$pontos_digitos[12][2] = 0
$pontos_digitos[12][3] = 0
;============= P2 do "2" =============
$pontos_digitos[13][0] = "2"
$pontos_digitos[13][1] = "P2"
$pontos_digitos[13][2] = 11
$pontos_digitos[13][3] = -5
;============= P3 do "2" =============
$pontos_digitos[14][0] = "2"
$pontos_digitos[14][1] = "P3"
$pontos_digitos[14][2] = 21
$pontos_digitos[14][3] = 2
;============= P4 do "2" =============
$pontos_digitos[15][0] = "2"
$pontos_digitos[15][1] = "P4"
$pontos_digitos[15][2] = 11
$pontos_digitos[15][3] = 8
;============= P5 do "2" =============
$pontos_digitos[16][0] = "2"
$pontos_digitos[16][1] = "P5"
$pontos_digitos[16][2] = 21
$pontos_digitos[16][3] = 21
;============= P6 do "2" =============
$pontos_digitos[17][0] = "2"
$pontos_digitos[17][1] = "P6"
$pontos_digitos[17][2] = 0
$pontos_digitos[17][3] = 22


;============= P1 do "3" =============
$pontos_digitos[18][0] = "3"
$pontos_digitos[18][1] = "P1"
$pontos_digitos[18][2] = 0
$pontos_digitos[18][3] = 0
;============= P2 do "3" =============
$pontos_digitos[19][0] = "3"
$pontos_digitos[19][1] = "P2"
$pontos_digitos[19][2] = 18
$pontos_digitos[19][3] = 4
;============= P3 do "3" =============
$pontos_digitos[20][0] = "3"
$pontos_digitos[20][1] = "P3"
$pontos_digitos[20][2] = 7
$pontos_digitos[20][3] = 13
;============= P4 do "3" =============
$pontos_digitos[21][0] = "3"
$pontos_digitos[21][1] = "P4"
$pontos_digitos[21][2] = 18
$pontos_digitos[21][3] = 19
;============= P5 do "3" =============
$pontos_digitos[22][0] = "3"
$pontos_digitos[22][1] = "P5"
$pontos_digitos[22][2] = 7
$pontos_digitos[22][3] = 26
;============= P6 do "3" =============
$pontos_digitos[23][0] = "3"
$pontos_digitos[23][1] = "P6"
$pontos_digitos[23][2] = -3
$pontos_digitos[23][3] = 22


;============= P1 do "4" =============
$pontos_digitos[24][0] = "4"
$pontos_digitos[24][1] = "P1"
$pontos_digitos[24][2] = 0
$pontos_digitos[24][3] = 0
;============= P2 do "4" =============
$pontos_digitos[25][0] = "4"
$pontos_digitos[25][1] = "P2"
$pontos_digitos[25][2] = 15
$pontos_digitos[25][3] = -18
;============= P3 do "4" =============
$pontos_digitos[26][0] = "4"
$pontos_digitos[26][1] = "P3"
$pontos_digitos[26][2] = 18
$pontos_digitos[26][3] = 9
;============= P4 do "4" =============
$pontos_digitos[27][0] = "4"
$pontos_digitos[27][1] = "P4"
$pontos_digitos[27][2] = 22
$pontos_digitos[27][3] = 0
;============= P5 do "4" =============
$pontos_digitos[28][0] = "4"
$pontos_digitos[28][1] = "P5"
$pontos_digitos[28][2] = 14
$pontos_digitos[28][3] = 0
;============= P6 do "4" =============
$pontos_digitos[29][0] = "4"
$pontos_digitos[29][1] = "P6"
$pontos_digitos[29][2] = 18
$pontos_digitos[29][3] = -9


;============= P1 do "5" =============
$pontos_digitos[30][0] = "5"
$pontos_digitos[30][1] = "P1"
$pontos_digitos[30][2] = 0
$pontos_digitos[30][3] = 0
;============= P2 do "5" =============
$pontos_digitos[31][0] = "5"
$pontos_digitos[31][1] = "P2"
$pontos_digitos[31][2] = 20
$pontos_digitos[31][3] = 1
;============= P3 do "5" =============
$pontos_digitos[32][0] = "5"
$pontos_digitos[32][1] = "P3"
$pontos_digitos[32][2] = 21
$pontos_digitos[32][3] = 18
;============= P4 do "5" =============
$pontos_digitos[33][0] = "5"
$pontos_digitos[33][1] = "P4"
$pontos_digitos[33][2] = 16
$pontos_digitos[33][3] = 27
;============= P5 do "5" =============
$pontos_digitos[34][0] = "5"
$pontos_digitos[34][1] = "P5"
$pontos_digitos[34][2] = 0
$pontos_digitos[34][3] = 22
;============= P6 do "5" =============
$pontos_digitos[35][0] = "5"
$pontos_digitos[35][1] = "P6"
$pontos_digitos[35][2] = 0
$pontos_digitos[35][3] = 9


;============= P1 do "6" =============
$pontos_digitos[36][0] = "6"
$pontos_digitos[36][1] = "P1"
$pontos_digitos[36][2] = 0
$pontos_digitos[36][3] = 0
;============= P2 do "6" =============
$pontos_digitos[37][0] = "6"
$pontos_digitos[37][1] = "P2"
$pontos_digitos[37][2] = 7
$pontos_digitos[37][3] = 1
;============= P3 do "6" =============
$pontos_digitos[38][0] = "6"
$pontos_digitos[38][1] = "P3"
$pontos_digitos[38][2] = 0
$pontos_digitos[38][3] = 13
;============= P4 do "6" =============
$pontos_digitos[39][0] = "6"
$pontos_digitos[39][1] = "P4"
$pontos_digitos[39][2] = 14
$pontos_digitos[39][3] = 20
;============= P5 do "6" =============
$pontos_digitos[40][0] = "6"
$pontos_digitos[40][1] = "P5"
$pontos_digitos[40][2] = 3
$pontos_digitos[40][3] = 26
;============= P6 do "6" =============
$pontos_digitos[41][0] = "6"
$pontos_digitos[41][1] = "P6"
$pontos_digitos[41][2] = -6
$pontos_digitos[41][3] = 14


;============= P1 do "7" =============
$pontos_digitos[42][0] = "7"
$pontos_digitos[42][1] = "P1"
$pontos_digitos[42][2] = 0
$pontos_digitos[42][3] = 0
;============= P2 do "7" =============
$pontos_digitos[43][0] = "7"
$pontos_digitos[43][1] = "P2"
$pontos_digitos[43][2] = 14
$pontos_digitos[43][3] = 0
;============= P3 do "7" =============
$pontos_digitos[44][0] = "7"
$pontos_digitos[44][1] = "P3"
$pontos_digitos[44][2] = 20
$pontos_digitos[44][3] = 2
;============= P4 do "7" =============
$pontos_digitos[45][0] = "7"
$pontos_digitos[45][1] = "P4"
$pontos_digitos[45][2] = 17
$pontos_digitos[45][3] = 10
;============= P5 do "7" =============
$pontos_digitos[46][0] = "7"
$pontos_digitos[46][1] = "P5"
$pontos_digitos[46][2] = 10
$pontos_digitos[46][3] = 18
;============= P6 do "7" =============
$pontos_digitos[47][0] = "7"
$pontos_digitos[47][1] = "P6"
$pontos_digitos[47][2] = 7
$pontos_digitos[47][3] = 27


;============= P1 do "8" =============
$pontos_digitos[48][0] = "8"
$pontos_digitos[48][1] = "P1"
$pontos_digitos[48][2] = 0
$pontos_digitos[48][3] = 0
;============= P2 do "8" =============
$pontos_digitos[49][0] = "8"
$pontos_digitos[49][1] = "P2"
$pontos_digitos[49][2] = 7
$pontos_digitos[49][3] = 0
;============= P3 do "8" =============
$pontos_digitos[50][0] = "8"
$pontos_digitos[50][1] = "P3"
$pontos_digitos[50][2] = 3
$pontos_digitos[50][3] = 14
;============= P4 do "8" =============
$pontos_digitos[51][0] = "8"
$pontos_digitos[51][1] = "P4"
$pontos_digitos[51][2] = 14
$pontos_digitos[51][3] = 19
;============= P5 do "8" =============
$pontos_digitos[52][0] = "8"
$pontos_digitos[52][1] = "P5"
$pontos_digitos[52][2] = -7
$pontos_digitos[52][3] = 19
;============= P6 do "8" =============
$pontos_digitos[53][0] = "8"
$pontos_digitos[53][1] = "P6"
$pontos_digitos[53][2] = 2
$pontos_digitos[53][3] = 14


;============= P1 do "9" =============
$pontos_digitos[54][0] = "9"
$pontos_digitos[54][1] = "P1"
$pontos_digitos[54][2] = 0
$pontos_digitos[54][3] = 0
;============= P2 do "9" =============
$pontos_digitos[55][0] = "9"
$pontos_digitos[55][1] = "P2"
$pontos_digitos[55][2] = 11
$pontos_digitos[55][3] = 8
;============= P3 do "9" =============
$pontos_digitos[56][0] = "9"
$pontos_digitos[56][1] = "P3"
$pontos_digitos[56][2] = 11
$pontos_digitos[56][3] = 17
;============= P4 do "9" =============
$pontos_digitos[57][0] = "9"
$pontos_digitos[57][1] = "P4"
$pontos_digitos[57][2] = -3
$pontos_digitos[57][3] = 26
;============= P5 do "9" =============
$pontos_digitos[58][0] = "9"
$pontos_digitos[58][1] = "P5"
$pontos_digitos[58][2] = -3
$pontos_digitos[58][3] = 13
;============= P6 do "9" =============
$pontos_digitos[59][0] = "9"
$pontos_digitos[59][1] = "P6"
$pontos_digitos[59][2] = -10
$pontos_digitos[59][3] = 9

;_arraydisplay($pontos_digitos, "tabela de pontos")

#Region ### START Koda GUI section ### Form=C:\Users\wscheidegger\Desktop\Gerenciador de Arquivamento de FIC\Autoit\GAFIC_beta 1.8\teste_verificação_pontos.kxf

global $Form1 = GUICreate("Form1", 823, 363, 192, 124)
global $x_imagem = 16, $y_imagem = 24
global $w_imagem = 494, $h_imagem = 90
$Pic1 = GUICtrlCreatePic("C:\Users\wscheidegger\Desktop\Gerenciador de Arquivamento de FIC\Autoit\GAFIC_beta 1.8\Temp\rg.jpg", $x_imagem, $y_imagem, $w_imagem, $h_imagem)
$1_digito_n_campo = GUICtrlCreateInput("", 536, 48, 25, 21)
$2_digito_n_campo = GUICtrlCreateInput("", 562, 48, 25, 21)
$3_digito_n_campo = GUICtrlCreateInput("", 596, 48, 25, 21)
$4_digito_n_campo = GUICtrlCreateInput("", 622, 48, 25, 21)
$5_digito_n_campo = GUICtrlCreateInput("", 649, 48, 25, 21)
$6_digito_n_campo = GUICtrlCreateInput("", 683, 48, 25, 21)
$7_digito_n_campo = GUICtrlCreateInput("", 709, 48, 25, 21)
$8_digito_n_campo = GUICtrlCreateInput("", 735, 48, 25, 21)
$9_digito_n_campo = GUICtrlCreateInput("", 769, 48, 25, 21)
global $shader = GUICtrlCreateInput("10", 700, 100, 55, 21)
$Button1 = GUICtrlCreateButton("Button1", 24, 192, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
global $cor[12]
$cor[0] = "0x323337"
$cor[1] = "0x0a0a0a"
$cor[2] = "0x141414"
$cor[3] = "0x1E1E1E"
$cor[4] = "0x282828"
$cor[5] = "0x323232"
$cor[6] = "0x3c3c3c"
$cor[7] = "0x464646"
$cor[8] = "0x505050"
$cor[9] = "0x5a5a5a"
$cor[10] = "0x646464"
$cor[11] = "0x000000"


global $p1, $p2, $p3, $p4, $p5, $p6

global $variacao, $hGraphic_d, $hPen
global $debug = "No"

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

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			procura_pixel5()
	EndSwitch

WEnd

func procura_pixel()
	$variacao = GUICtrlRead($shader,0)
	Global $posJanela = WinGetPos("Form1")
	Local $hWnd = WinGetHandle("Form1")
	local $digitos[0][3]
	;ConsoleWrite("pos janela x="&$posJanela[0]&", pos janela y="&$posJanela[1]&", final quadro busca x="&$x_f_busca&", final quadro busca y="&$y_f_busca&@crlf)

	For $i = 1 to 19 step 1 ;===== inicio da busca horizontal ======

		local $a_b = $posJanela[0]+$x_imagem+70+($i*20)
		local $c_b = $posJanela[1]+$y_imagem+35
		local $b_b = $a_b+30 ;$posJanela[0]+$x_imagem+$w_imagem
		local $d_b = $c_b+80 ;$posJanela[1]+$y_imagem+$h_imagem+20
		;ConsoleWrite("left="&$x_i_busca_p1&",right="&$x_f_busca_p1&@CRLF)
		;ConsoleWrite("top="&$y_i_busca_p1&",button="&$y_f_busca_p1&@CRLF)
		;=======================retangulo onde está buscando o p1 ===========
		desenha_busca($a_b,$b_b,$c_b,$d_b)
		;=======================retangulo onde está buscando o p1 ===========

		for $c = 0 to Ubound($cor)-1
			global $aCoord_p1 = PixelSearch($a_b, $c_b, $b_b, $d_b, $cor[$c], $variacao, 1, $hWnd)
			If Not @error Then
;				consolewrite("P1 X e Y: " & $aCoord_p1[0] & "," & $aCoord_p1[1]&"-cor: "&hex($cor[$c])&@CRLF)

				;================desenha o p1=====================
				local $a = $aCoord_p1[0]-1, $c = $aCoord_p1[1]-1
				local $b = $a+3, $d = $c+3
				desenha_p($a,$b,$c,$d)
				;================desenha o p1=====================

				ExitLoop
			EndIf
			;return $aCoord_p1
		Next

		;MsgBox(0,"",$acoord_p1[0])
		if isarray($aCoord_p1) = true Then
			For $j = 1 to 60 step 6 ;===== inicio da busca p2 ======

				;===============retangulo onde está buscando o p2 ==========
				local $a_b_p2 = $aCoord_p1[0]+$pontos_digitos[$j][2]-1
				local $c_b_p2 = $aCoord_p1[1]+$pontos_digitos[$j][3]-1
				local $b_b_p2 = $a_b_p2+3
				local $d_b_p2 = $c_b_p2+3
				desenha_busca($a_b_p2,$b_b_p2,$c_b_p2,$d_b_p2)
				;===============retangulo onde está buscando o p2 ==========

				for $c = 0 to Ubound($cor)-1
					local $aCoord_p2 = PixelSearch($a_b_p2, $c_b_p2, $b_b_p2, $d_b_p2, $cor[$c], $variacao, 1, $hWnd)
					If Not @error Then
;						consolewrite("P2 X e Y: " & $aCoord_p2[0] & "," & $aCoord_p2[1]&"-j="&$j&"-cor: "&hex($cor[$c])&@CRLF)

						;================desenha o p2=====================
						local $a_p2 = $aCoord_p2[0]-1, $c_p2 = $aCoord_p2[1]-1
						local $b_p2 = $a_p2+3, $d_p2 = $c_p2+3
						desenha_p($a_p2,$b_p2,$c_p2, $d_p2)

						;================desenha o p2=====================
						;return $aCoord_p2
						ExitLoop
					else
						;Consolewrite("cor procurada no p2: "& Hex($cor[$c])&"erro: "&@error&@CRLF)
					EndIf

				Next

				if isarray($aCoord_p2) = true Then
					;===============retangulo onde está buscando o p3 ==========
					local $a_b_p3 = $aCoord_p1[0]+$pontos_digitos[$j+1][2]-1
					local $c_b_p3 = $aCoord_p1[1]+$pontos_digitos[$j+1][3]-1
					local $b_b_p3 = $a_b_p3+3
					local $d_b_p3 = $c_b_p3+3
					desenha_busca($a_b_p3,$b_b_p3,$c_b_p3,$d_b_p3)
					;===============retangulo onde está buscando o p3 ==========

					for $c = 0 to Ubound($cor)-1
						local $aCoord_p3 = PixelSearch($a_b_p3, $c_b_p3, $b_b_p3, $d_b_p3, $cor[$c], $variacao, 1, $hWnd)
						If Not @error Then
;							consolewrite("P3 X e Y: " & $aCoord_p3[0] & "," & $aCoord_p3[1]&"-j="&$j+1&"-valor da variavel:"&$pontos_digitos[$j+1][2]&"-cor: "&hex($cor[$c])&@CRLF)

							;================desenha o p3=====================
							local $a_p3 = $aCoord_p3[0]-1, $c_p3 = $aCoord_p3[1]-1
							local $b_p3 = $a_p3+3, $d_p3 = $c_p3+3
							desenha_p($a_p3,$b_p3,$c_p3, $d_p3)
							;================desenha o p3=====================
							;return $aCoord_p3
							ExitLoop
						else
							;Consolewrite("cor procurada no p3: "& Hex($cor[$c])&"erro: "&@error&@CRLF)
						EndIf
					Next

					if isarray($aCoord_p3) = true then
						;===============retangulo onde está buscando o p4 ==========
						local $a_b_p4 = $aCoord_p1[0]+$pontos_digitos[$j+2][2]-1
						local $c_b_p4 = $aCoord_p1[1]+$pontos_digitos[$j+2][3]-1
						local $b_b_p4 = $a_b_p4+3
						local $d_b_p4 = $c_b_p4+3
						desenha_busca($a_b_p4,$b_b_p4,$c_b_p4,$d_b_p4)
						;===============retangulo onde está buscando o p4 ==========

						for $c = 0 to Ubound($cor)-1
							local $aCoord_p4 = PixelSearch($a_b_p4, $c_b_p4, $b_b_p4, $d_b_p4, $cor[$c], $variacao, 1, $hWnd)
							If Not @error Then
;								consolewrite("P4 X e Y: " & $aCoord_p4[0] & "," & $aCoord_p4[1]&"-j="&$j+2&"-valor da variavel:"&$pontos_digitos[$j+2][2]&"-cor: "&hex($cor[$c])&@CRLF)

								;================desenha o p4=====================
								local $a_p4 = $aCoord_p4[0]-1, $c_p4 = $aCoord_p4[1]-1
								local $b_p4 = $a_p4+3, $d_p4 = $c_p4+3
								desenha_p($a_p4,$b_p4,$c_p4, $d_p4)
								;================desenha o p4=====================
								;return $aCoord_p4
								ExitLoop
							else
								;Consolewrite("cor procurada no p4: "& Hex($cor[$c])&"erro: "&@error&@CRLF)
							EndIf
						Next

						if isarray($aCoord_p4) = true then
							;===============retangulo onde está buscando o p5 ==========
							local $a_b_p5 = $aCoord_p1[0]+$pontos_digitos[$j+3][2]-1
							local $c_b_p5 = $aCoord_p1[1]+$pontos_digitos[$j+3][3]-1
							local $b_b_p5 = $a_b_p5+3
							local $d_b_p5 = $c_b_p5+3
							desenha_busca($a_b_p5,$b_b_p5,$c_b_p5,$d_b_p5)
							;===============retangulo onde está buscando o p5 ==========

							for $c = 0 to Ubound($cor)-1
								local $aCoord_p5 = PixelSearch($a_b_p5, $c_b_p5, $b_b_p5, $d_b_p5, $cor[$c], $variacao, 1, $hWnd)
								If Not @error Then
;									consolewrite("P5 X e Y: " & $aCoord_p5[0] & "," & $aCoord_p5[1]&"-j="&$j+3&"-valor da variavel:"&$pontos_digitos[$j+3][2]&"-cor: "&hex($cor[$c])&@CRLF)

									;================desenha o p5=====================
									local $a_p5 = $aCoord_p5[0]-1, $c_p5 = $aCoord_p5[1]-1
									local $b_p5 = $a_p5+3, $d_p5 = $c_p5+3
									desenha_p($a_p5,$b_p5,$c_p5, $d_p5)
									;================desenha o p5=====================
									;return $aCoord_p5
									ExitLoop
								else
									;Consolewrite("cor procurada no p5: "& Hex($cor[$c])&"erro: "&@error&@CRLF)
								EndIf
							Next

							if isarray($aCoord_p5) = true then
								;===============retangulo onde está buscando o p6 ==========
								local $a_b_p6 = $aCoord_p1[0]+$pontos_digitos[$j+4][2]-1
								local $c_b_p6 = $aCoord_p1[1]+$pontos_digitos[$j+4][3]-1
								local $b_b_p6 = $a_b_p6+3
								local $d_b_p6 = $c_b_p6+3
								desenha_busca($a_b_p6,$b_b_p6,$c_b_p6,$d_b_p6)
								;===============retangulo onde está buscando o p5 ==========

								for $c = 0 to Ubound($cor)-1
									local $aCoord_p6 = PixelSearch($a_b_p6, $c_b_p6, $b_b_p6, $d_b_p6, $cor[$c], $variacao, 1, $hWnd)
									If Not @error Then
										consolewrite("P6 X e Y: " & $aCoord_p6[0] & "," & $aCoord_p6[1]&"-j="&$j+4&"-possivel valor: "&$pontos_digitos[$j+4][0]&@CRLF)

										;================desenha o p6=====================
										local $a_p6 = $aCoord_p6[0]-1, $c_p6 = $aCoord_p6[1]-1
										local $b_p6 = $a_p6+3, $d_p6 = $c_p6+3
										desenha_p($a_p6,$b_p6,$c_p6, $d_p6)
										;================desenha o p5=====================
										;return $aCoord_p6
										local $digitos_add = $pontos_digitos[$j+4][0]&"|"&$aCoord_p6[0]&"|"&$aCoord_p6[1]
										_ArrayAdd($digitos, $digitos_add, 0, "|")

										ExitLoop
									else
										;Consolewrite("cor procurada no p6: "& Hex($cor[$c])&"erro: "&@error&@CRLF)
									EndIf
								Next





						Endif ; p5


					Endif ; p4


				EndIf ; p3

			EndIf ; p2

			Next
		Endif ; p1



	Next ;fim da busca horizontal

	;_ArrayDisplay($digitos, "Array Digitos")
	$digitos_linhas = UBound($digitos)

	for $i = 0 to $digitos_linhas step 1
		consolewrite("i= "&$i&@CRLF)
		consolewrite("total de linhas "&$digitos_linhas&@CRLF)
		if $i < $digitos_linhas Then
			$index = _ArraySearch($digitos, $digitos[$i][1], $i+1)
			if Not @error Then
				_ArrayDelete($digitos, $index)
				;_ArrayDisplay($digitos, "Array digitos após apagar repetidos.")
				$digitos_linhas -= 1
			EndIf
		EndIf


	Next


	;$digitos_final = _ArrayUnique($digitos)
	;_ArrayDisplay($digitos, "final")
	for $i = 0 to UBound($digitos)-1 step 1
		consolewrite("i="&$i&@CRLF)
		consolewrite("input="&$input_name[$i+1]&@CRLF)
		consolewrite("eval="&$digitos[$i][0]&@CRLF)

		GUICtrlSetData($input_name[$i+1], $digitos[$i][0])
	Next

EndFunc


func procura_pixel3()
	$variacao = GUICtrlRead($shader,0)
	Global $posJanela = WinGetPos("Form1")
	Local $hWnd = WinGetHandle("Form1")
	local $digitos[0][3]
	;ConsoleWrite("pos janela x="&$posJanela[0]&", pos janela y="&$posJanela[1]&", final quadro busca x="&$x_f_busca&", final quadro busca y="&$y_f_busca&@crlf)

	For $i = 1 to 19 step 1 ;===== inicio da busca horizontal ======

		local $a_b = $posJanela[0]+$x_imagem+70+($i*20)
		local $c_b = $posJanela[1]+$y_imagem+35
		local $b_b = $a_b+30 ;$posJanela[0]+$x_imagem+$w_imagem
		local $d_b = $c_b+80 ;$posJanela[1]+$y_imagem+$h_imagem+20
		;ConsoleWrite("left="&$x_i_busca_p1&",right="&$x_f_busca_p1&@CRLF)
		;ConsoleWrite("top="&$y_i_busca_p1&",button="&$y_f_busca_p1&@CRLF)
		;=======================retangulo onde está buscando o p1 ===========
		desenha_busca($a_b,$b_b,$c_b,$d_b)
		;=======================retangulo onde está buscando o p1 ===========

		for $c = 0 to Ubound($cor)-1
			global $aCoord_p1 = PixelSearch($a_b, $c_b, $b_b, $d_b, $cor[$c], $variacao, 1, $hWnd)
			If Not @error Then
;				consolewrite("P1 X e Y: " & $aCoord_p1[0] & "," & $aCoord_p1[1]&"-cor: "&hex($cor[$c])&@CRLF)

				;================desenha o p1=====================
				local $a = $aCoord_p1[0]-1, $c = $aCoord_p1[1]-1
				local $b = $a+3, $d = $c+3
				desenha_p($a,$b,$c,$d)
				;================desenha o p1=====================

				For $j = 1 to 60 step 6 ;===== inicio da busca p2 ======

					;===============retangulo onde está buscando o p2 ==========
					local $a_b_p2 = $aCoord_p1[0]+$pontos_digitos[$j][2]-1
					local $c_b_p2 = $aCoord_p1[1]+$pontos_digitos[$j][3]-1
					local $b_b_p2 = $a_b_p2+3
					local $d_b_p2 = $c_b_p2+3
					desenha_busca($a_b_p2,$b_b_p2,$c_b_p2,$d_b_p2)
					;===============retangulo onde está buscando o p2 ==========

					for $c = 0 to Ubound($cor)-1
						local $aCoord_p2 = PixelSearch($a_b_p2, $c_b_p2, $b_b_p2, $d_b_p2, $cor[$c], $variacao, 1, $hWnd)
						If Not @error Then
	;						consolewrite("P2 X e Y: " & $aCoord_p2[0] & "," & $aCoord_p2[1]&"-j="&$j&"-cor: "&hex($cor[$c])&@CRLF)

							;================desenha o p2=====================
							local $a_p2 = $aCoord_p2[0]-1, $c_p2 = $aCoord_p2[1]-1
							local $b_p2 = $a_p2+3, $d_p2 = $c_p2+3
							;desenha_p($a_p2,$b_p2,$c_p2, $d_p2)
							desenha_l($b, $a_p2, $d, $c_p2)
							;================desenha o p2=====================

							;===============retangulo onde está buscando o p3 ==========
							local $a_b_p3 = $aCoord_p1[0]+$pontos_digitos[$j+1][2]-1
							local $c_b_p3 = $aCoord_p1[1]+$pontos_digitos[$j+1][3]-1
							local $b_b_p3 = $a_b_p3+3
							local $d_b_p3 = $c_b_p3+3
							desenha_busca($a_b_p3,$b_b_p3,$c_b_p3,$d_b_p3)
							;===============retangulo onde está buscando o p3 ==========

							for $c = 0 to Ubound($cor)-1
								local $aCoord_p3 = PixelSearch($a_b_p3, $c_b_p3, $b_b_p3, $d_b_p3, $cor[$c], $variacao, 1, $hWnd)
								If Not @error Then
		;							consolewrite("P3 X e Y: " & $aCoord_p3[0] & "," & $aCoord_p3[1]&"-j="&$j+1&"-valor da variavel:"&$pontos_digitos[$j+1][2]&"-cor: "&hex($cor[$c])&@CRLF)

									;================desenha o p3=====================
									local $a_p3 = $aCoord_p3[0]-1, $c_p3 = $aCoord_p3[1]-1
									local $b_p3 = $a_p3+3, $d_p3 = $c_p3+3
									;desenha_p($a_p3,$b_p3,$c_p3, $d_p3)
									desenha_l($b_p2, $a_p3, $d_p2, $c_p3)
									;================desenha o p3=====================

									;===============retangulo onde está buscando o p4 ==========
									local $a_b_p4 = $aCoord_p1[0]+$pontos_digitos[$j+2][2]-1
									local $c_b_p4 = $aCoord_p1[1]+$pontos_digitos[$j+2][3]-1
									local $b_b_p4 = $a_b_p4+3
									local $d_b_p4 = $c_b_p4+3
									desenha_busca($a_b_p4,$b_b_p4,$c_b_p4,$d_b_p4)
									;===============retangulo onde está buscando o p4 ==========

									for $c = 0 to Ubound($cor)-1
										local $aCoord_p4 = PixelSearch($a_b_p4, $c_b_p4, $b_b_p4, $d_b_p4, $cor[$c], $variacao, 1, $hWnd)
										If Not @error Then
			;								consolewrite("P4 X e Y: " & $aCoord_p4[0] & "," & $aCoord_p4[1]&"-j="&$j+2&"-valor da variavel:"&$pontos_digitos[$j+2][2]&"-cor: "&hex($cor[$c])&@CRLF)

											;================desenha o p4=====================
											local $a_p4 = $aCoord_p4[0]-1, $c_p4 = $aCoord_p4[1]-1
											local $b_p4 = $a_p4+3, $d_p4 = $c_p4+3
											;desenha_p($a_p4,$b_p4,$c_p4, $d_p4)
											desenha_l($b_p3, $a_p4, $d_p3, $c_p4)
											;================desenha o p4=====================

											;===============retangulo onde está buscando o p5 ==========
											local $a_b_p5 = $aCoord_p1[0]+$pontos_digitos[$j+3][2]-1
											local $c_b_p5 = $aCoord_p1[1]+$pontos_digitos[$j+3][3]-1
											local $b_b_p5 = $a_b_p5+3
											local $d_b_p5 = $c_b_p5+3
											desenha_busca($a_b_p5,$b_b_p5,$c_b_p5,$d_b_p5)
											;===============retangulo onde está buscando o p5 ==========

											for $c = 0 to Ubound($cor)-1
												local $aCoord_p5 = PixelSearch($a_b_p5, $c_b_p5, $b_b_p5, $d_b_p5, $cor[$c], $variacao, 1, $hWnd)
												If Not @error Then
				;									consolewrite("P5 X e Y: " & $aCoord_p5[0] & "," & $aCoord_p5[1]&"-j="&$j+3&"-valor da variavel:"&$pontos_digitos[$j+3][2]&"-cor: "&hex($cor[$c])&@CRLF)

													;================desenha o p5=====================
													local $a_p5 = $aCoord_p5[0]-1, $c_p5 = $aCoord_p5[1]-1
													local $b_p5 = $a_p5+3, $d_p5 = $c_p5+3
													;desenha_p($a_p5,$b_p5,$c_p5, $d_p5)
													desenha_l($b_p4, $a_p5, $d_p4, $c_p5)
													;================desenha o p5=====================

													;===============retangulo onde está buscando o p6 ==========
													local $a_b_p6 = $aCoord_p1[0]+$pontos_digitos[$j+4][2]-1
													local $c_b_p6 = $aCoord_p1[1]+$pontos_digitos[$j+4][3]-1
													local $b_b_p6 = $a_b_p6+3
													local $d_b_p6 = $c_b_p6+3
													desenha_busca($a_b_p6,$b_b_p6,$c_b_p6,$d_b_p6)
													;===============retangulo onde está buscando o p5 ==========

													for $c = 0 to Ubound($cor)-1
														local $aCoord_p6 = PixelSearch($a_b_p6, $c_b_p6, $b_b_p6, $d_b_p6, $cor[$c], $variacao, 1, $hWnd)
														If Not @error Then
															consolewrite("P6 X e Y: " & $aCoord_p6[0] & "," & $aCoord_p6[1]&"-j="&$j+4&"-possivel valor: "&$pontos_digitos[$j+4][0]&@CRLF)

															;================desenha o p6=====================
															local $a_p6 = $aCoord_p6[0]-1, $c_p6 = $aCoord_p6[1]-1
															local $b_p6 = $a_p6+3, $d_p6 = $c_p6+3
															;desenha_p($a_p6,$b_p6,$c_p6, $d_p6)
															desenha_l($b_p5, $a_p6, $d_p5, $c_p6)
															;================desenha o p5=====================
															;return $aCoord_p6
															local $digitos_add = $pontos_digitos[$j+4][0]&"|"&$aCoord_p6[0]&"|"&$aCoord_p6[1]
															_ArrayAdd($digitos, $digitos_add, 0, "|")
															ExitLoop
														EndIf ;fim do if do p6
													Next ;fim do loop p6
													ExitLoop
												EndIf ;fim do if do p5
											Next ; fim do loop p5
											ExitLoop
										EndIf ; fim do if do p4
									Next ; fim do loop p4
									ExitLoop
								EndIf ; fim do if do p3
							Next ;fim do loop do p3
							ExitLoop
						EndIf ; fim do if do p2
					Next ; fim do loop do p2
					;ExitLoop
				Next ; fim do loop dos pontos
			EndIf ;fim do if do p1
			_GDIPlus_GraphicsDispose($hGraphic_d)
			_GDIPlus_Shutdown()
		Next ; fim do loop do p1
	Next ;fim da busca horizontal

	;_ArrayDisplay($digitos, "Array Digitos")
	$digitos_linhas = UBound($digitos)

	for $i = 0 to $digitos_linhas step 1
		consolewrite("i= "&$i&@CRLF)
		consolewrite("total de linhas "&$digitos_linhas&@CRLF)
		if $i < $digitos_linhas Then
			$index = _ArraySearch($digitos, $digitos[$i][1], $i+1)
			if Not @error Then
				_ArrayDelete($digitos, $index)
				;_ArrayDisplay($digitos, "Array digitos após apagar repetidos.")
				$digitos_linhas -= 1
			EndIf
		EndIf


	Next


	;$digitos_final = _ArrayUnique($digitos)
	;_ArrayDisplay($digitos, "final")
	for $i = 0 to UBound($digitos)-1 step 1
		consolewrite("i="&$i&@CRLF)
		consolewrite("input="&$input_name[$i+1]&@CRLF)
		consolewrite("eval="&$digitos[$i][0]&@CRLF)

		GUICtrlSetData($input_name[$i+1], $digitos[$i][0])
	Next

EndFunc


func procura_pixel2()
	$variacao = GUICtrlRead($shader,0)
	Global $posJanela = WinGetPos("Form1")
	Local $hWnd = WinGetHandle("Form1")
	local $digitos[0][3]
	;ConsoleWrite("pos janela x="&$posJanela[0]&", pos janela y="&$posJanela[1]&", final quadro busca x="&$x_f_busca&", final quadro busca y="&$y_f_busca&@crlf)

	For $i = 1 to 19 step 1 ;===== inicio da busca horizontal ======
		local $a_b = $posJanela[0]+$x_imagem+70+($i*20)
		local $c_b = $posJanela[1]+$y_imagem+35
		local $b_b = $a_b+30 ;$posJanela[0]+$x_imagem+$w_imagem
		local $d_b = $c_b+80 ;$posJanela[1]+$y_imagem+$h_imagem+20
		;ConsoleWrite("left="&$x_i_busca_p1&",right="&$x_f_busca_p1&@CRLF)
		;ConsoleWrite("top="&$y_i_busca_p1&",button="&$y_f_busca_p1&@CRLF)
		;=======================retangulo onde está buscando o p1 ===========
		desenha_busca($a_b,$b_b,$c_b,$d_b)
		;=======================retangulo onde está buscando o p1 ===========
		for $k = 0 to Ubound($cor)-1 step 1
			;consolewrite("k = "&$k&@CRLF)

			For $j = 1 to 60 step 6 ;===== inicio da busca dos pontos ======
			;consolewrite("j = "&$j&@CRLF&@CRLF)

				global $aCoord_p1 = PixelSearch($a_b, $c_b, $b_b, $d_b, $cor[$k], $variacao, 1, $hWnd)
				If Not @error Then
					;consolewrite("P1 X e Y: " & $aCoord_p1[0] & "," & $aCoord_p1[1]&"-cor: "&hex($cor[$k])&@CRLF)
					$p1 = "ok"
					;================desenha o p1=====================
					local $a = $aCoord_p1[0]-1, $c = $aCoord_p1[1]-1
					local $b = $a+3, $d = $c+3
					desenha_p($a,$b,$c,$d)
					;================desenha o p1=====================
					;===============retangulo onde está buscando o p2 ==========
					local $a_b_p2 = $aCoord_p1[0]+$pontos_digitos[$j][2]-1
					local $c_b_p2 = $aCoord_p1[1]+$pontos_digitos[$j][3]-1
					local $b_b_p2 = $a_b_p2+3
					local $d_b_p2 = $c_b_p2+3
					desenha_busca($a_b_p2,$b_b_p2,$c_b_p2,$d_b_p2)
					;===============retangulo onde está buscando o p2 ==========
					local $aCoord_p2 = PixelSearch($a_b_p2, $c_b_p2, $b_b_p2, $d_b_p2, $cor[$k], $variacao, 1, $hWnd)
					If Not @error Then
						;consolewrite("P2 X e Y: " & $aCoord_p2[0] & "," & $aCoord_p2[1]&"-j="&$j&"-cor: "&hex($cor[$k])&@CRLF)
						$p2 = "ok"
						;================desenha o p2=====================
						local $a_p2 = $aCoord_p2[0]-1, $c_p2 = $aCoord_p2[1]-1
						local $b_p2 = $a_p2+3, $d_p2 = $c_p2+3
						desenha_p($a_p2,$b_p2,$c_p2, $d_p2)
						;desenha_l($b, $a_p2, $d, $c_p2)
						;================desenha o p2=====================
						;===============retangulo onde está buscando o p3 ==========
						local $a_b_p3 = $aCoord_p1[0]+$pontos_digitos[$j+1][2]-1
						local $c_b_p3 = $aCoord_p1[1]+$pontos_digitos[$j+1][3]-1
						local $b_b_p3 = $a_b_p3+3
						local $d_b_p3 = $c_b_p3+3
						desenha_busca($a_b_p3,$b_b_p3,$c_b_p3,$d_b_p3)
						;===============retangulo onde está buscando o p3 ==========
						local $aCoord_p3 = PixelSearch($a_b_p3, $c_b_p3, $b_b_p3, $d_b_p3, $cor[$k], $variacao, 1, $hWnd)
						If Not @error Then
							;consolewrite("P3 X e Y: " & $aCoord_p3[0] & "," & $aCoord_p3[1]&"-j="&$j+1&"-cor: "&hex($cor[$k])&@CRLF)
							$p3 = "ok"
							;================desenha o p3=====================
							local $a_p3 = $aCoord_p3[0]-1, $c_p3 = $aCoord_p3[1]-1
							local $b_p3 = $a_p3+3, $d_p3 = $c_p3+3
							desenha_p($a_p3,$b_p3,$c_p3, $d_p3)
							;desenha_l($b_p2, $a_p3, $d_p2, $c_p3)
							;================desenha o p3=====================
							;===============retangulo onde está buscando o p4 ==========
							local $a_b_p4 = $aCoord_p1[0]+$pontos_digitos[$j+2][2]-1
							local $c_b_p4 = $aCoord_p1[1]+$pontos_digitos[$j+2][3]-1
							local $b_b_p4 = $a_b_p4+3
							local $d_b_p4 = $c_b_p4+3
							desenha_busca($a_b_p4,$b_b_p4,$c_b_p4,$d_b_p4)
							;===============retangulo onde está buscando o p4 ==========
							local $aCoord_p4 = PixelSearch($a_b_p4, $c_b_p4, $b_b_p4, $d_b_p4, $cor[$k], $variacao, 1, $hWnd)
							If Not @error Then
								;consolewrite("P4 X e Y: " & $aCoord_p4[0] & "," & $aCoord_p4[1]&"-j="&$j+2&"-cor: "&hex($cor[$k])&@CRLF)
								$p4 = "ok"
								;================desenha o p4=====================
								local $a_p4 = $aCoord_p4[0]-1, $c_p4 = $aCoord_p4[1]-1
								local $b_p4 = $a_p4+3, $d_p4 = $c_p4+3
								desenha_p($a_p4,$b_p4,$c_p4, $d_p4)
								;desenha_l($b_p3, $a_p4, $d_p3, $c_p4)
								;================desenha o p4=====================
								;===============retangulo onde está buscando o p5 ==========
								local $a_b_p5 = $aCoord_p1[0]+$pontos_digitos[$j+3][2]-1
								local $c_b_p5 = $aCoord_p1[1]+$pontos_digitos[$j+3][3]-1
								local $b_b_p5 = $a_b_p5+3
								local $d_b_p5 = $c_b_p5+3
								desenha_busca($a_b_p5,$b_b_p5,$c_b_p5,$d_b_p5)
								;===============retangulo onde está buscando o p5 ==========
								local $aCoord_p5 = PixelSearch($a_b_p5, $c_b_p5, $b_b_p5, $d_b_p5, $cor[$k], $variacao, 1, $hWnd)
								If Not @error Then
									;consolewrite("P5 X e Y: " & $aCoord_p5[0] & "," & $aCoord_p5[1]&"-j="&$j+3&"-cor: "&hex($cor[$k])&@CRLF)
									$p5 = "ok"
									;================desenha o p5=====================
									local $a_p5 = $aCoord_p5[0]-1, $c_p5 = $aCoord_p5[1]-1
									local $b_p5 = $a_p5+3, $d_p5 = $c_p5+3
									desenha_p($a_p5,$b_p5,$c_p5, $d_p5)
									;desenha_l($b_p4, $a_p5, $d_p4, $c_p5)
									;================desenha o p5=====================
									;===============retangulo onde está buscando o p6 ==========
									local $a_b_p6 = $aCoord_p1[0]+$pontos_digitos[$j+4][2]-1
									local $c_b_p6 = $aCoord_p1[1]+$pontos_digitos[$j+4][3]-1
									local $b_b_p6 = $a_b_p6+3
									local $d_b_p6 = $c_b_p6+3
									desenha_busca($a_b_p6,$b_b_p6,$c_b_p6,$d_b_p6)
									;===============retangulo onde está buscando o p6 ==========
									local $aCoord_p6 = PixelSearch($a_b_p6, $c_b_p6, $b_b_p6, $d_b_p6, $cor[$k], $variacao, 1, $hWnd)
									If Not @error Then
										consolewrite("P6 X e Y: " & $aCoord_p6[0] & "," & $aCoord_p6[1]&"-j="&$j+4&"-possivel valor: "&$pontos_digitos[$j+4][0]&@CRLF)
										$p6 = "ok"
										;================desenha o p6=====================
										local $a_p6 = $aCoord_p6[0]-1, $c_p6 = $aCoord_p6[1]-1
										local $b_p6 = $a_p6+3, $d_p6 = $c_p6+3
										desenha_p($a_p6,$b_p6,$c_p6, $d_p6)
										;desenha_l($b_p5, $a_p6, $d_p5, $c_p6)
										;================desenha o p5=====================

										if BitAND($p1 = "ok", $p2 = "ok", $p3 = "ok", $p4 = "ok", $p5 = "ok", $p6 = "ok") Then
											local $digitos_add = $pontos_digitos[$j+4][0]&"|"&$aCoord_p6[0]&"|"&$aCoord_p6[1]
											_ArrayAdd($digitos, $digitos_add, 0, "|")
											ExitLoop
										EndIf ; fim da verificação dos pontos
									Else
										;ExitLoop
									EndIf ;fim do if do p6
								Else
									;ExitLoop
								EndIf ;fim do if do p5
							Else
								;ExitLoop
							EndIf ; fim do if do p4
						Else
							;ExitLoop
						EndIf ; fim do if do p3
					Else
					;	ExitLoop
					EndIf ; fim do if do p2
				Else
					ExitLoop
				EndIf ;fim do if do p1
			Next ; fim do loop dos pontos
		_GDIPlus_GraphicsDispose($hGraphic_d)
		_GDIPlus_PenDispose($hPen)
		_GDIPlus_GraphicsClear($hGraphic_d, 0xFF000000)
		_GDIPlus_Shutdown()
		Next ; fim do loop dos pontos
	Next ;fim da busca horizontal


	;_ArrayDisplay($digitos, "Array Digitos")
	$digitos_linhas = UBound($digitos)

	for $i = 0 to $digitos_linhas step 1
		consolewrite("i= "&$i&@CRLF)
		consolewrite("total de linhas "&$digitos_linhas&@CRLF)
		if $i < $digitos_linhas then
			$index = _ArraySearch($digitos, $digitos[$i][1], 0)
			if Not @error Then
				For $i2 = 0 to $index step 1
					consolewrite("i2= "&$i2&@CRLF)
					if $digitos[$i2][1] = $digitos[$index][1] Then
						consolewrite($digitos[$i2][1]&"="&$digitos[$index][1]&", valor do index="&$index&@CRLF)
						_ArrayDelete($digitos, $index)
						_ArrayDisplay($digitos, "Array digitos após apagar repetidos.")
						$digitos_linhas -= 1

					ElseIf $digitos[$i2][1]-5 < $digitos[$index][1] and $digitos[$i2][1]+5 > $digitos[$index][1] then
						consolewrite($digitos[$i2][1]-5&"<"&$digitos[$index][1]&"<"&$digitos[$i2][1]+5&", valor do index="&$index&@CRLF)
						_ArrayDelete($digitos, $index)
						_ArrayDisplay($digitos, "Array digitos após apagar repetidos.")
						$digitos_linhas -= 1
					EndIf

				Next


			EndIf
		EndIf
	Next


	;$digitos_final = _ArrayUnique($digitos)
	_ArrayDisplay($digitos, "final")
	for $i = 0 to 8 step 1
		consolewrite("i="&$i&@CRLF)
		consolewrite("input="&$input_name[$i+1]&@CRLF)
		consolewrite("eval="&$digitos[$i][0]&@CRLF)

		GUICtrlSetData($input_name[$i+1], $digitos[$i][0])
	Next

EndFunc

func procura_pixel4()
	$variacao = GUICtrlRead($shader,0)
	Global $posJanela = WinGetPos("Form1")
	Local $hWnd = WinGetHandle("Form1")
	local $digitos[0][3]

	For $i = 1 to 19 step 1 ;===== inicio da busca horizontal ======

		local $a_b = $posJanela[0]+$x_imagem+70+($i*20)
		local $c_b = $posJanela[1]+$y_imagem+35
		local $b_b = $a_b+30 ;$posJanela[0]+$x_imagem+$w_imagem
		local $d_b = $c_b+80 ;$posJanela[1]+$y_imagem+$h_imagem+20
		consolewrite("i = "&$i&@CRLF)
		;=======================retangulo onde está buscando o p1 ===========
		desenha_busca($a_b,$b_b,$c_b,$d_b)
		;=======================retangulo onde está buscando o p1 ===========

			For $j = 1 to 60 step 6 ;===== inicio da busca dos pontos ======
			;consolewrite("j = "&$j&@CRLF&@CRLF)
			local $cor_max = 0xececec ;0xB4B4B6
			local $cor_min = 0x000000

				global $aCoord_p1 = PixelSearch($a_b, $c_b, $b_b, $d_b, $cor_min, $variacao, 1, $hWnd)
				If Not @error Then
					;================desenha o p1=====================
					local $a = $aCoord_p1[0]-1, $c = $aCoord_p1[1]-1
					local $b = $a+3, $d = $c+3
					desenha_p($a,$b,$c,$d)
					;================desenha o p1=====================
					consolewrite("P1 X e Y: " & $aCoord_p1[0] & "," & $aCoord_p1[1]&@CRLF)
					$p1 = "ok"

					local $x_p2 = $aCoord_p1[0]+$pontos_digitos[$j][2]
					local $y_p2 = $aCoord_p1[1]+$pontos_digitos[$j][3]
					local $aCoord_p2 = "0x"&Hex(PixelGetColor($x_p2, $y_p2), 6)
					if $aCoord_p2 < $cor_max Then
						;================desenha o p1=====================
						local $a = $x_p2-1, $c = $y_p2-1
						local $b = $a+3, $d = $c+3
						desenha_p($a,$b,$c,$d)
						;================desenha o p1=====================
						;consolewrite("cor encontrada no p2 quando o j é:"&$j&", "&$aCoord_p2&@CRLF)
						$p2 = "ok"

						local $x_p3 = $aCoord_p1[0]+$pontos_digitos[$j+1][2]
						local $y_p3 = $aCoord_p1[1]+$pontos_digitos[$j+1][3]
						local $aCoord_p3 = "0x"&Hex(PixelGetColor($x_p3, $y_p3), 6)
						if $aCoord_p3 < $cor_max Then
							;================desenha o p1=====================
							local $a = $x_p3-1, $c = $y_p3-1
							local $b = $a+3, $d = $c+3
							desenha_p($a,$b,$c,$d)
							;================desenha o p1=====================
							;consolewrite("cor encontrada no p3 quando o j é:"&$j+1&", "&$aCoord_p3&@CRLF)
							$p3 = "ok"

							local $x_p4 = $aCoord_p1[0]+$pontos_digitos[$j+2][2]
							local $y_p4 = $aCoord_p1[1]+$pontos_digitos[$j+2][3]
							local $aCoord_p4 = "0x"&Hex(PixelGetColor($x_p4, $y_p4), 6)
							if $aCoord_p4 < $cor_max Then
								;================desenha o p1=====================
								local $a = $x_p4-1, $c = $y_p4-1
								local $b = $a+3, $d = $c+3
								desenha_p($a,$b,$c,$d)
								;================desenha o p1=====================
								;consolewrite("cor encontrada no p4 quando o j é:"&$j+2&", "&$aCoord_p4&@CRLF)
								$p4 = "ok"

								local $x_p5 = $aCoord_p1[0]+$pontos_digitos[$j+3][2]
								local $y_p5 = $aCoord_p1[1]+$pontos_digitos[$j+3][3]
								local $aCoord_p5 = "0x"&Hex(PixelGetColor($x_p5, $y_p5), 6)
								if $aCoord_p5 < $cor_max Then
									;================desenha o p1=====================
									local $a = $x_p5-1, $c = $y_p5-1
									local $b = $a+3, $d = $c+3
									desenha_p($a,$b,$c,$d)
									;================desenha o p1=====================
									;consolewrite("cor encontrada no p5 quando o j é:"&$j+3&", "&$aCoord_p5&@CRLF)
									$p5 = "ok"

									local $x_p6 = $aCoord_p1[0]+$pontos_digitos[$j+4][2]
									local $y_p6 = $aCoord_p1[1]+$pontos_digitos[$j+4][3]
									local $aCoord_p6 = "0x"&Hex(PixelGetColor($x_p6, $y_p6), 6)
									if $aCoord_p6 < $cor_max Then
										;================desenha o p1=====================
										local $a = $x_p6-1, $c = $y_p6-1
										local $b = $a+3, $d = $c+3
										desenha_p($a,$b,$c,$d)
										;================desenha o p1=====================
										consolewrite("cor encontrada no p6 quando o j é:"&$j+4&", "&$aCoord_p6&@CRLF)
										consolewrite("possivel digito:"&$pontos_digitos[$j+4][0]&@CRLF)
										$p6 = "ok"
										ExitLoop


									endif ; fim da busca do p6
								EndIf ; fim da busca do p5
							EndIf ; fim da busca do p4
						EndIf ; fim da busca do p3
					EndIf ; fim da busca do p2
				EndIf ; fim da busca do p1

			Next ; fim do loop dos pontos
			;if BitAND($p1="ok", $p2="ok", $p3="ok", $p4="ok", $p5="ok", $p6="ok") Then ExitLoop
	Next ; fim do loop horizontal





EndFunc

func procura_pixel5()
	$variacao = GUICtrlRead($shader,0)
	Global $posJanela = WinGetPos("Form1")
	Local $hWnd = WinGetHandle("Form1")
	local $digitos[0][3]
	local $cor_max = 0xececec ;0xB4B4B6
	local $cor_min = 0x000000

	;For $i = 1 to 19 step 1 ;===== inicio da busca horizontal ======

		local $a_b = $posJanela[0]+$x_imagem+70+(20);($i*20)
		local $c_b = $posJanela[1]+$y_imagem+35
		local $b_b = $a_b+30 ;$posJanela[0]+$x_imagem+$w_imagem
		local $d_b = $c_b+80 ;$posJanela[1]+$y_imagem+$h_imagem+20
		;consolewrite("i = "&$i&@CRLF)
		;=======================retangulo onde está buscando o p1 ===========
		desenha_busca($a_b,$b_b,$c_b,$d_b)
		;=======================retangulo onde está buscando o p1 ===========

		global $aCoord = PixelSearch($a_b, $c_b, $b_b, $d_b, $cor_min, $variacao, 1, $hWnd)
		If Not @error Then
			For $j = 1 to 60 step 6 ;===== inicio da busca dos pontos p2 ======
				local $x_p = $aCoord[0]+$pontos_digitos[$j][2]
				local $y_p = $aCoord[1]+$pontos_digitos[$j][3]
				local $aCoord_p2 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
				if $aCoord_p2 < $cor_max Then
					;================desenha o p1=====================
					local $a = $x_p-1, $c = $y_p-1
					local $b = $a+3, $d = $c+3
					desenha_p($a,$b,$c,$d)
					;================desenha o p1=====================
					;consolewrite("cor encontrada no p2 quando o j é:"&$j&", "&$aCoord_p2&@CRLF)
					$p2 = "ok"
						local $x_p = $aCoord[0]+$pontos_digitos[$j+1][2]
						local $y_p = $aCoord[1]+$pontos_digitos[$j+1][3]
						local $Coord_p3 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
						if $Coord_p3 < $cor_max Then
							;consolewrite("$p3 = ok"&@CRLF)
							$p3 = "ok"
						EndIf

						local $x_p = $aCoord[0]+$pontos_digitos[$j+2][2]
						local $y_p = $aCoord[1]+$pontos_digitos[$j+2][3]
						local $Coord_p4 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
						if $Coord_p4 < $cor_max Then
							;consolewrite("$p4 = ok"&@CRLF)
							$p4 = "ok"
						EndIf

						local $x_p = $aCoord[0]+$pontos_digitos[$j+3][2]
						local $y_p = $aCoord[1]+$pontos_digitos[$j+3][3]
						local $Coord_p5 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
						if $Coord_p5 < $cor_max Then
							;consolewrite("$p5 = ok"&@CRLF)
							$p5 = "ok"
						EndIf

						local $x_p = $aCoord[0]+$pontos_digitos[$j+4][2]
						local $y_p = $aCoord[1]+$pontos_digitos[$j+4][3]
						local $Coord_p6 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
						if $Coord_p6 < $cor_max Then
							;consolewrite("$p6 = ok"&@CRLF)
							$p6 = "ok"
						EndIf

						if BitAND($p2="ok", $p3="ok", $p4="ok", $p5="ok", $p6="ok") Then
							ConsoleWrite("p2 Digito : "&$pontos_digitos[$j][0]&@CRLF)
							ExitLoop
						EndIf


				Else
					local $x_p = $aCoord[0]+($pontos_digitos[$j][2]-$pontos_digitos[$j+1][2])
					local $y_p = $aCoord[1]+($pontos_digitos[$j][3]-$pontos_digitos[$j+1][3])
					local $aCoord_p3 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
					if $aCoord_p3 < $cor_max Then
						;================desenha o p1=====================
						local $a = $x_p-1, $c = $y_p-1
						local $b = $a+3, $d = $c+3
						desenha_p($a,$b,$c,$d)
						;================desenha o p1=====================
						;consolewrite("cor encontrada no p3 quando o j é:"&$j&", "&$aCoord_p3&@CRLF)
						$p3 = "ok"

						local $x_p = $aCoord[0]+$pontos_digitos[$j][2]
						local $y_p = $aCoord[1]+$pontos_digitos[$j][3]
						local $Coord_p2 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
						if $Coord_p2 < $cor_max Then
							;consolewrite("$p2 = ok"&@CRLF)
							$p2 = "ok"
						EndIf

						local $x_p = $aCoord[0]+$pontos_digitos[$j+2][2]
						local $y_p = $aCoord[1]+$pontos_digitos[$j+2][3]
						local $Coord_p4 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
						if $Coord_p4 < $cor_max Then
							;consolewrite("$p4 = ok"&@CRLF)
							$p4 = "ok"
						EndIf

						local $x_p = $aCoord[0]+$pontos_digitos[$j+3][2]
						local $y_p = $aCoord[1]+$pontos_digitos[$j+3][3]
						local $Coord_p5 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
						if $Coord_p5 < $cor_max Then
							;consolewrite("$p5 = ok"&@CRLF)
							$p5 = "ok"
						EndIf

						local $x_p = $aCoord[0]+$pontos_digitos[$j+4][2]
						local $y_p = $aCoord[1]+$pontos_digitos[$j+4][3]
						local $Coord_p6 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
						if $Coord_p6 < $cor_max Then
							;consolewrite("$p6 = ok"&@CRLF)
							$p6 = "ok"
						EndIf

						if BitAND($p2="ok", $p3="ok", $p4="ok", $p5="ok", $p6="ok") Then
							ConsoleWrite("p3 Digito : "&$pontos_digitos[$j][0]&@CRLF)
							ExitLoop
						EndIf


					Else
						local $x_p = $aCoord[0]+($pontos_digitos[$j+1][2]-$pontos_digitos[$j+2][2])
						local $y_p = $aCoord[1]+($pontos_digitos[$j+1][3]-$pontos_digitos[$j+2][3])
						local $aCoord_p4 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
						if $aCoord_p4 < $cor_max Then
							;================desenha o p1=====================
							local $a = $x_p-1, $c = $y_p-1
							local $b = $a+3, $d = $c+3
							desenha_p($a,$b,$c,$d)
							;================desenha o p1=====================
							;consolewrite("cor encontrada no p4 quando o j é:"&$j&", "&$aCoord_p4&@CRLF)
							$p4 = "ok"

							local $x_p = $aCoord[0]+$pontos_digitos[$j][2]
							local $y_p = $aCoord[1]+$pontos_digitos[$j][3]
							local $Coord_p2 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
							if $Coord_p2 < $cor_max Then
								;consolewrite("$p2 = ok"&@CRLF)
								$p2 = "ok"
							EndIf

							local $x_p = $aCoord[0]+$pontos_digitos[$j+1][2]
							local $y_p = $aCoord[1]+$pontos_digitos[$j+1][3]
							local $Coord_p3 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
							if $Coord_p3 < $cor_max Then
								;consolewrite("$p3 = ok"&@CRLF)
								$p3 = "ok"
							EndIf

							local $x_p = $aCoord[0]+$pontos_digitos[$j+3][2]
							local $y_p = $aCoord[1]+$pontos_digitos[$j+3][3]
							local $Coord_p5 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
							if $Coord_p5 < $cor_max Then
								;consolewrite("$p5 = ok"&@CRLF)
								$p5 = "ok"
							EndIf

							local $x_p = $aCoord[0]+$pontos_digitos[$j+4][2]
							local $y_p = $aCoord[1]+$pontos_digitos[$j+4][3]
							local $Coord_p6 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
							if $Coord_p6 < $cor_max Then
								;consolewrite("$p6 = ok"&@CRLF)
								$p6 = "ok"
							EndIf

							if BitAND($p2="ok", $p3="ok", $p4="ok", $p5="ok", $p6="ok") Then
								ConsoleWrite("p4 Digito : "&$pontos_digitos[$j][0]&@CRLF)
								ExitLoop
							EndIf

						Else
							local $x_p = $aCoord[0]+($pontos_digitos[$j+2][2]-$pontos_digitos[$j+3][2])
							local $y_p = $aCoord[1]+($pontos_digitos[$j+2][3]-$pontos_digitos[$j+3][3])
							local $aCoord_p5 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
							if $aCoord_p5 < $cor_max Then
								;================desenha o p1=====================
								local $a = $x_p-1, $c = $y_p-1
								local $b = $a+3, $d = $c+3
								desenha_p($a,$b,$c,$d)
								;================desenha o p1=====================
								;consolewrite("cor encontrada no p5 quando o j é:"&$j&", "&$aCoord_p5&@CRLF)
								$p5 = "ok"

								local $x_p = $aCoord[0]+$pontos_digitos[$j][2]
								local $y_p = $aCoord[1]+$pontos_digitos[$j][3]
								local $Coord_p2 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
								if $Coord_p2 < $cor_max Then
									;consolewrite("$p2 = ok"&@CRLF)
									$p2 = "ok"
								EndIf

								local $x_p = $aCoord[0]+$pontos_digitos[$j+1][2]
								local $y_p = $aCoord[1]+$pontos_digitos[$j+1][3]
								local $Coord_p3 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
								if $Coord_p3 < $cor_max Then
									;consolewrite("$p3 = ok"&@CRLF)
									$p3 = "ok"
								EndIf

								local $x_p = $aCoord[0]+$pontos_digitos[$j+2][2]
								local $y_p = $aCoord[1]+$pontos_digitos[$j+2][3]
								local $Coord_p4 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
								if $Coord_p4 < $cor_max Then
									;consolewrite("$p4 = ok"&@CRLF)
									$p4 = "ok"
								EndIf

								local $x_p = $aCoord[0]+$pontos_digitos[$j+4][2]
								local $y_p = $aCoord[1]+$pontos_digitos[$j+4][3]
								local $Coord_p6 = "0x"&Hex(PixelGetColor($x_p, $y_p), 6)
								if $Coord_p6 < $cor_max Then
									;consolewrite("$p6 = ok"&@CRLF)
									$p6 = "ok"
								EndIf

								if BitAND($p2="ok", $p3="ok", $p4="ok", $p5="ok", $p6="ok") Then
									ConsoleWrite("p5 Digito : "&$pontos_digitos[$j][0]&@CRLF)
									ExitLoop
								EndIf



							EndIf
						EndIf
					EndIf
				EndIf

			Next ; fim da busca dos pontos
		EndIf

	;Next ; fim da busca horizontal




EndFunc






func desenha_p($a,$b,$c,$d)
	;if $debug = "Yes" Then
	_GDIPlus_Startup ()
	local $hDC_d = _WinAPI_GetWindowDC(0)
	global $hGraphic_d = _GDIPlus_GraphicsCreateFromHDC($hDC_d)
	local $Color = 0xFFFF0000
	local $hPen = _GDIPlus_PenCreate($Color,2)
	local $x_inicial = $a
	local $x_final = $b
	local $y_inicial = $c
	local $y_final = $d

	_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_final, $y_inicial, $hPen)
	_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_inicial, $y_final, $hPen)
	_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_final, $x_final, $y_final, $hPen)
	_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_final, $y_inicial, $x_final, $y_final, $hPen)
	$Color += Hex(2)
	_GDIPlus_PenSetColor($hPen, $Color)
	;EndIf
EndFunc

func desenha_l($a,$b,$c,$d)
	if $debug = "Yes" Then
	_GDIPlus_Startup ()
	local $hDC_d = _WinAPI_GetWindowDC(0)
	local $hGraphic_d = _GDIPlus_GraphicsCreateFromHDC($hDC_d)
	local $Color = 0xFFFF0000
	local $hPen = _GDIPlus_PenCreate($Color,2)
	local $x_inicial = $a
	local $x_final = $b
	local $y_inicial = $c
	local $y_final = $d

	_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_final, $y_final, $hPen)
	$Color += Hex(2)
	_GDIPlus_PenSetColor($hPen, $Color)
	EndIf
EndFunc

func desenha_busca($a,$b,$c,$d)
	if $debug = "Yes" Then
		_GDIPlus_Startup ()
		local $hDC_d = _WinAPI_GetWindowDC(0)
		local $hGraphic_d = _GDIPlus_GraphicsCreateFromHDC($hDC_d)
		local $Color = 0xFFFFFF00
		local $hPen = _GDIPlus_PenCreate($Color,2)
		local $x_inicial = $a
		local $x_final = $b
		local $y_inicial = $c
		local $y_final = $d

		_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_final, $y_inicial, $hPen)
		_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_inicial, $y_final, $hPen)
		_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_final, $x_final, $y_final, $hPen)
		_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_final, $y_inicial, $x_final, $y_final, $hPen)
		$Color += Hex(2)
		_GDIPlus_PenSetColor($hPen, $Color)
	EndIf

EndFunc


