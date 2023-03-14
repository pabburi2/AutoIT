;===============================================================================
;
; AutoIt Version: 3.2.3.0
; Language:       English
; Description:
; Requirement(s):
; Notes:
;
;===============================================================================

#include "_UnixTime.au3"

; 현재 시간의 unix timestamp
Local $TimeSec	= _unix_timestamp()
ConsoleWrite('unix time: ' & $TimeSec & @CRLF)

; unix timestamp to date
ConsoleWrite('unix timestamp to date: ' & _from_unixtime($TimeSec) & @CRLF)