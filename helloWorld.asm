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
	greeting_chs BYTE "��Ǩ��",0dh,0ah
			  BYTE "��",0dh,0ah
			  BYTE "ѧ��:2015013226",0dh,0ah
			  BYTE "���52��",0dh,0ah
			  BYTE "��ã����磡",0dh,0ah
	greeting_jps BYTE "��Ǩ��Ǥ�",0dh,0ah
				 BYTE "��",0dh,0ah
				 BYTE  "ѧ������:2015013226", 0dh,0ah
				 BYTE  "���եȥ����������M",0dh,0ah
				 BYTE "����ˤ��ϡ����磡",0dh,0ah
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