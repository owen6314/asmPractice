;2017.9.29
;calculate the greatest common divisor with a test program, show results on the screen
;to run this, Irvine32.inc need to be in your path
;By Owen6314
;--------------------------------------------------------------------------------------
include Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	errorMsg BYTE 'Integers cannot be zero!',0dh,0ah,0
	logMsg1 BYTE 'gcd(',0
	comma BYTE ',',0
	logMsg2 BYTE ') is ',0
	newLine BYTE 0dh,0ah,0
.code
;-----------------------------------------------------------------
;preprocess
;transform x,y to abs(x) and abs(y),check if any of them is zero,use edx to deliver error message
;receives:ebx = x,ecx = y
;returns:ebx = abs(x),ecx = abs(y),edx = 0 if feasible, 1 if infeasible
;-----------------------------------------------------------------
PreProcess PROC
	mov edx,0
cmp1:
	cmp ebx,0
	jl trans1
	je zeroError
	jg cmp2
trans1:
	neg ebx
cmp2:
	cmp ecx,0
	jl trans2
	je zeroError
	jg compare
trans2:
	neg ecx
	jmp compare
compare:
	cmp ebx, ecx
	jl changeOrder
	ret
changeOrder:
	XCHG ebx, ecx
	ret
zeroError:
	mov edx, 1
	ret
PreProcess ENDP
;-----------------------------------------------------------------
;calculate gcd
;receives:ebx = x,ecx = y
;returns:eax = gcd(x,y)
;requires:x > 0, y > 0,x > y
;-----------------------------------------------------------------
CalculateGcd PROC USES ebx ecx edx
mainLoop:
	xor edx, edx
	mov eax, ebx
	div ecx
	mov ebx, ecx
	mov ecx, edx
	cmp ecx, 0
	je return
	jne mainLoop 
return:
	mov eax, ebx
	ret
CalculateGcd ENDP
;-----------------------------------------------------------------
;show gcd
;print gcd message on screen
;receives:eax=gcd,ebx = x,ecx = y
;-----------------------------------------------------------------
ShowGcd PROC
	mov edx, OFFSET logMsg1
	call WriteString
	mov esi, eax
	mov eax, ebx
	CALL WriteInt
	mov edx, OFFSET comma
	call WriteString
	mov eax, ecx
	call WriteInt
	mov edx, OFFSET logMsg2
	call WriteString
	mov eax, esi
	call WriteInt
	mov edx, OFFSET newLine
	call WriteString
	ret
ShowGcd ENDP
;-----------------------------------------------------------------
;write error message
;print error message(divide by 0) on screen
;-----------------------------------------------------------------
WriteErrorMsg PROC USES edx
	mov edx,OFFSET errorMsg
	call WriteString
	ret
WriteErrorMsg ENDP
;-----------------------------------------------------------------
;get gcd
;main program to get gcd 
;-----------------------------------------------------------------
GetGcd PROC
	push ebx
	push ecx
	call PreProcess
	cmp edx,0
	je cal
	call WriteErrorMsg
	pop ecx
	pop ebx
	ret
cal:
	call CalculateGcd
	pop ecx
	pop ebx
	call ShowGcd
	ret
GetGcd EndP
main PROC
test1:
	mov ebx, 2
	mov ecx, 1
	call GetGcd
test2:
	mov ebx, 0
	mov ecx, 1
	call GetGcd
test3:
	mov ebx, 2
	mov ecx, 0
	call GetGcd
test4:
	mov ebx, 85
	mov ecx, 35
	call GetGcd
test5:
	mov ebx, -18
	mov ecx, -24
	call GetGcd
test6:
	mov ebx, 30000000
	mov ecx, 60000000
	call GetGcd
test7:
	mov ebx, 800
	mov ecx, -600
	call GetGcd
	call WaitMsg
	INVOKE ExitProcess, 0
main ENDP

END main