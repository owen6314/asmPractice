;2017.10.17
;Show Procedure Parameters
;By Owen6314
;to run this, Irvine32.inc need to be in your path
;--------------------------------------------------------------------------------------
include Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    formatMsg BYTE "Stack parameters:", 0dh, 0ah, "----------------------", 0dh, 0ah, 0
	address BYTE "Address ", 0
	equalMark BYTE "=", 0
.code
;-----------------------------------------------------------------
;show procedure parameters
;receives:num: number of parameters
;print parameters' info on screen
;-----------------------------------------------------------------
ShowParams PROC num:DWORD
	mov edx, OFFSET formatMsg
	call WriteString
	mov ecx, num
	mov eax, esp
	add eax, 16
print_param:
	mov edx, OFFSET address
	call WriteString

	add eax, 4
	call WriteHex

	mov edx, OFFSET equalMark
	call WriteString

	mov edx, eax
	mov ebx, [eax]
	mov eax, ebx
	call WriteHex
	mov eax, edx

	call Crlf
	loop print_param
	ret
ShowParams ENDP
;test example 1
;------------------------------------------
MySample1 PROC first:DWORD, second:DWORD, third:DWORD
	paramCount1 = 3h
	invoke ShowParams, paramCount1 
	ret
MySample1 ENDP
;test example 2
;-------------------------------------------
MySample2 PROC first:DWORD, second:DWORD
	paramCount2 = 2h
	invoke ShowParams, paramCount2
	ret
MySample2 ENDP
;------------------------------------------
main PROC
	invoke MySample1, 10h, 20h, 30h
	invoke MySample2, 100h, 200h
	call WaitMsg
	exit
main ENDP
END main