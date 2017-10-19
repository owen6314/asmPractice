;2017.10.17
;Draw Text Colors
;By Owen6314
;to run this, Irvine32.inc need to be in your path
;--------------------------------------------------------------------------------------
include Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
string BYTE 'Color output is easy!', 0dh, 0ah, 0
.code

main PROC
	call Clrscr
	mov edx, OFFSET string
	mov ecx, 4
draw_color:
    mov eax, ecx
	call SetTextColor
	cmp ecx, 0
    jl loop_end
	call WriteString
	loop draw_color
loop_end:
    call WaitMsg
	INVOKE ExitProcess,0
main ENDP
END main