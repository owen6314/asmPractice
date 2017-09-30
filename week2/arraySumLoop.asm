;2017.9.28
;int array sum with loop
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
	sum WORD 0h
.code
main PROC
    mov eax,0
	mov ebx,OFFSET intArray
	mov ecx,LENGTHOF intArray
L1:
	mov eax, [ebx]
	add sum,ax
	add ebx,TYPE intArray
	loop L1	

	movzx eax, sum
	call WriteInt
	call WaitMsg
	INVOKE ExitProcess,0
main ENDP
END main