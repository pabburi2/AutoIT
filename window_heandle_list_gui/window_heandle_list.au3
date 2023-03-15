#cs ----------------------------------------------------------------------------

 Windows heandle list

  Author  : pabburi.co.kr
  Date    :

#ce ----------------------------------------------------------------------------


#include <Array.au3>
#Include <Date.au3>
#include <EditConstants.au3>
#include <FontConstants.au3>
#include <GUIConstants.au3>
#include <WindowsConstants.au3>
#include "_UnixTime.au3"

;
Local $TimeSec     = 0      ; 체크하기 위해서 이전에 실행한 시간을 기억 시키기 위한것
Local $ChkSec      = 5      ; 체크하는 기준이 되는초 기본 5초
;ConsoleWrite(_unix_timestamp() & @CRLF )
;Exit


#Region ### START Koda GUI section ### Form=
;~ GUICreate ( "title" [, width [, height [, left = -1 [, top = -1 [, style = -1 [, exStyle = -1 [, parent = 0]]]]]]] )
Local $winWidth	= 1220
Local $startX	= ( @DesktopWidth - $winWidth ) / 2
$Form1          = GUICreate("Window heandle list", $winWidth, 770, $startX, 7)

;~ GUISetFont ( size [, weight [, attribute [, fontname [, winhandle [, quality]]]]] )
GUISetFont(9, $FW_NORMAL, $GUI_FONTNORMAL, "굴림체")
$EditMsgBox	    = GUICtrlCreateEdit("...", 20, 20, 1180, 700, $ES_AUTOVSCROLL + $WS_VSCROLL)
$BtnClose		= GUICtrlCreateButton("Close", 600, 730, 120, 25, 0)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case 0 ; no event
            if ( _unix_timestamp() - $TimeSec > $ChkSec ) Then
                $TimeSec        = _unix_timestamp()
                $winTitlList    = GetHeandleList()
                GUICtrlSetData($EditMsgBox, $winTitlList)
                ;~ ConsoleWrite('time: ' & _from_unixtime($TimeSec) & @CRLF)
            EndIf

		Case $GUI_EVENT_MINIMIZE
		Case $GUI_EVENT_RESTORE
		Case $GUI_EVENT_MAXIMIZE
		Case $GUI_EVENT_MOUSEMOVE
		Case $GUI_EVENT_PRIMARYDOWN
		Case $GUI_EVENT_PRIMARYUP
		Case $GUI_EVENT_SECONDARYDOWN
		Case $GUI_EVENT_SECONDARYUP
		Case $GUI_EVENT_RESIZED
		Case $GUI_EVENT_DROPPED
		Case $GUI_EVENT_CLOSE
			Exit
		Case $BtnClose
			Exit
	EndSwitch

	Sleep(10)
WEnd


Func GetHeandleList()
    ; Retrieve a list of window handles.
    Local $aList 	= WinList()

    ; Loop through the array displaying only visable windows with a title.
    Local $winList 	= ''
    For $num = 1 To $aList[0][0]
        If $aList[$num][0] <> "" And BitAND(WinGetState($aList[$num][1]), 2) Then
            $winTitl 		= $aList[$num][0]
            $winHeandle 	= $aList[$num][1]
            ;MsgBox($MB_SYSTEMMODAL, "", "Title: " & $aList[$i][0] & @CRLF & "Handle: " & $aList[$i][1])
            ;~ if  StringInStr($winTitl, 'window') Then
                $winList		&= $winHeandle & '   ' & $winTitl & @CRLF
            ;~ EndIf
        EndIf
    Next

    Return $winList
EndFunc