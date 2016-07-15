
;_ImageMagick_Quality($a, $b)
;_ImageMagick_Addtext($b, $t)
;#include <Date.au3>
;global $data = _nowdate()&"-"& _NowTime()
;global $o_object = ObjCreate("ImageMagickObject.MagickImage.1")

Func _ImageMagick_Quality($infile, $outfile)
local $o_object = ObjCreate("ImageMagickObject.MagickImage.1")

If Not IsObj($o_object) Then

	local $o_object = ObjCreate("ImageMagickObject.MagickImage.1")

endif

	local $ret

    $ret = $o_object.Convert($infile, _
        "-quality","60", _
        "-level", "20%,100%", _
        $outfile)

	;"+sigmoidal-contrast", "3,5%", _
EndFunc


Func _ImageMagick_Addtext($infile, $outfile, $text2)

local $o_object = ObjCreate("ImageMagickObject.MagickImage.1")

If Not IsObj($o_object) Then

	local $o_object = ObjCreate("ImageMagickObject.MagickImage.1")

endif
	;=============carimbo original=========
	;global $data = _nowdate()&"-"& _NowTime()
	;local $posx = 400, $posy = 600, $posx2 = 400, $posy2 = 850
	;local $text = "FIC arquivada por GAFIC"& @CRLF &"em: "& $data
	;local $rc, $c, $d

	;$c="text " & $posx & "," & $posy & " '" &$text &"'" ;
	;$d="text " & $posx2 & "," & $posy2 & " '" &$text2 &"'" ;

	;$rc = $o_object.Convert($infile, _
	;		"-pointsize", "120", _
	;		"-font", "ArialBk", _
	;		"-fill", "red", _
	;		"-stroke", "black", _
	;		"-strokewidth", "2", _
	;		"-draw", $c, _
	;		"-pointsize", "88", _
	;		"-font", "ArialBk", _
	;		"-fill", "red", _
	;		"-stroke", "black", _
	;		"-strokewidth", "2", _
	;		"-draw", $d, _
	;		"-quality","60", _
	;		$outfile)
	;=============carimbo original=========

	;global $data = _nowdate()&"-"& _NowTime()
	local $posx = 400, $posy = 600, $posx2 = 1100, $posy2 = 100
	;local $text = "FIC arquivada por GAFIC"& @CRLF &"em: "& $data
	local $rc, $c, $d

	;$c="text " & $posx & "," & $posy & " '" &$text &"'" ;
	$d="text " & $posx2 & "," & $posy2 & " '" &$text2 &"'" ;

	$rc = $o_object.Convert($infile, _
			"-box", "white", _
			"-pointsize", "60", _
			"-font", "ArialBk", _
			"-fill", "red", _
			"-stroke", "black", _
			"-strokewidth", "2", _
			"-draw", $d, _
			"-quality","60", _
			$outfile)

EndFunc

