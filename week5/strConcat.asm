;2017.10.18
;string concat procedure
;By Owen6314
;to run this, Irvine32.inc need to be in your path
;--------------------------------------------------------------------------------------
include Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    targetStr BYTE "ABCDE", 10 DUP(0)
	sourceStr BYTE "FGH", 0
.code
;-----------------------------------------------------------------
;stirng concat 
;receives: targetStr and sourceStr's address
;add source string to target string
;-----------------------------------------------------------------
Str_concat PROC target:DWORD, source:DWORD
	mov esi, source
	mov edi, target
find_end:
    cmp BYTE PTR[edi], 0
	je concat
	inc edi
	jmp find_end
concat:
    mov al, [esi]
	mov [edi], al
	cmp al, 0
	je end_proc
	inc edi
	inc esi
	jmp concat
end_proc:
    ;mov al, 0
	;mov [edi], al
	ret
Str_concat ENDP

main PROC
	INVOKE Str_concat, ADDR targetStr, ADDR sourceStr
	;mov edx, OFFSET targetStr
	;call WriteString
	call WaitMsg
	exit
main ENDP
END main