;2017.9.28
;int array sum without loop
;to run this, Irvine32.inc need to be in your path
;By Owen6314
;--------------------------------------------------------------------------------------
include Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	intArray WORD 600h,500h,400h,300h,200h
	sum DWORD 0h
.code
main PROC
    mov eax,0
    movzx ebx, intArray
    add eax, ebx
    movzx ebx, intArray + 2
    add eax, ebx
    movzx ebx, intArray + 4
    add eax, ebx
    movzx ebx, intArray + 6
    add eax, ebx
    movzx ebx, intArray + 8
    add eax, ebx
	mov sum, eax
	call WriteInt
    call WaitMsg		
	INVOKE ExitProcess,0
main ENDP
END main