# 유닉스 타임스탬프

- 실행결과
```autoit
; 현재 시간의 unix timestamp
Local $TimeSec	= _unix_timestamp()
ConsoleWrite('unix time: ' & $TimeSec & @CRLF)
>>> unix time: 1678830083

; unix timestamp to date
ConsoleWrite('unix timestamp to date: ' & _from_unixtime($TimeSec) & @CRLF)
>>> unix timestamp to date: 2023/03/14 21:41:23
```