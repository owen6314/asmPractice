;2017.9.28
;calculate first 15 values in Fibonacci array,print these 15 values
;to run this, Irvine32.inc need to be in your path
;By Owen6314
;--------------------------------------------------------------------------------------
include Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data

.code
main PROC
	call Clrscr
	mov eax,1 ;n
	mov ebx,1 ;n - 1
	mov edx,0 ;n - 2
	mov ecx,14
	call WriteInt
L1:
	mov eax,0
	add eax,ebx
	add eax,edx
	call WriteInt
	mov edx,ebx
	mov ebx,eax
	loop L1
	call WaitMsg
	INVOKE ExitProcess,0
main ENDP
END main