;2017.9.22
;hello world in asm,using three languages
;to run this, Irvine32.inc need to be in your path
;By Owen6314
include Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	greeting_eng BYTE "Qianrui Zhang",0dh,0ah
			  BYTE "Male",0dh,0ah
			  BYTE "Student Number: 2015013226",0dh,0ah
			  BYTE "Software Class 52",0dh,0ah
			  BYTE "Hello world!",0dh,0ah
	greeting_chs BYTE "张迁瑞",0dh,0ah
			  BYTE "男",0dh,0ah
			  BYTE "学号:2015013226",0dh,0ah
			  BYTE "软件52班",0dh,0ah
			  BYTE "你好，世界！",0dh,0ah
	greeting_jps BYTE "张迁瑞です",0dh,0ah
				 BYTE "男",0dh,0ah
				 BYTE  "学籍番号:2015013226", 0dh,0ah
				 BYTE  "ソフトウェア５２組",0dh,0ah
				 BYTE "こんにちは、世界！",0dh,0ah
.code
main PROC
	call Clrscr
	;mov edx, OFFSET greeting_jps
	;call WriteString
	;call WaitMsg
	;call Clrscr
	mov edx, OFFSET greeting_eng
	;call WriteString
	;call WaitMsg
	;call Clrscr
	;mov edx, OFFSET greeting_chs
	call WriteString
	call WaitMsg
	;call Clrscr
	INVOKE ExitProcess,0
main ENDP
END main