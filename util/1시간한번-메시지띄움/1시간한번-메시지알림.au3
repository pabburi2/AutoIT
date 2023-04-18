#NoTrayIcon
#cs
------------------------------------------------------------------------------

	특정시간에 알림을 준다.

	@Author:
	@Date  :

	시작 > 실행 > shell:startup
		C:\Users\계정명\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

------------------------------------------------------------------------------
#ce


#include <String.au3>
#include <Date.au3>

;
Global Const $WIN_TITL    = '알림!!'
Global Const $CHK_MIN     = 10          ; 매시간 10분

;
Global $IS_MSG            = True

Local $msg      = ''
While( True )

	If Not WinActive($WIN_TITL) AND @MIN = $CHK_MIN AND $IS_MSG == True Then
		$msg	      = ''
		$msg	     &= '순환' & @CRLF
		$msg	     &= '1' & @CRLF
		$msg	     &= '2' & @CRLF
		$msg	     &= '2' & @CRLF
		$msg	     &= @CRLF
		MsgBox(0, $WIN_TITL, $msg)

		$IS_MSG	    = False
	EndIf

	IF @MIN <> $CHK_MIN Then
    $IS_MSG     = True
  EndIf

	; Amount of time to pause (in milliseconds).
	Sleep(7222)

WEnd