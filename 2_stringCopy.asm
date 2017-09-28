;2017.9.28
;copy source string to target
;to run this, Irvine32.inc need to be in your path
;By Owen6314
include Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	source BYTE 'Please copy this source string', 0
	target BYTE SIZEOF source DUP(0)
.code
main PROC
	mov esi,0
	mov ecx,SIZEOF source
	call Clrscr
L1:
	mov al,source[esi]
	mov target[esi],al
	inc esi
	loop L1
	mov edx, OFFSET target
	call WriteString
	call WaitMsg
	INVOKE ExitProcess,0
main ENDP
END main