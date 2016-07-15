#include <WindowsConstants.au3>
#include <WinAPI.au3>
#Include <GDIPlus.au3>

_GDIPlus_Startup ()

local $hDC_d = _WinAPI_GetWindowDC(0)

local $hGraphic_d = _GDIPlus_GraphicsCreateFromHDC($hDC_d)
local $Color = 0xFFff0000
local $hPen = _GDIPlus_PenCreate($Color,2)
local $x_inicial = 100
local $x_final = 300
local $y_inicial = 100
local $y_final = 300

;For $t = 0 to 300
        _GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_final, $y_inicial, $hPen)
		_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_inicial, $x_inicial, $y_final, $hPen)
        _GDIPlus_GraphicsDrawLine($hGraphic_d, $x_inicial, $y_final, $x_final, $y_final, $hPen)
		_GDIPlus_GraphicsDrawLine($hGraphic_d, $x_final, $y_inicial, $x_final, $y_final, $hPen)
		$Color += Hex(2)
        _GDIPlus_PenSetColor($hPen, $Color)
;Next


;_WinAPI_RedrawWindow(_WinAPI_GetDesktopWindow(), 0, 0, $RDW_INVALIDATE+$RDW_ALLCHILDREN)
;_WinAPI_ReleaseDC(0, $hDC)
;_GDIPlus_Shutdown()