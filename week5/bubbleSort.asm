;2017.10.18
;bubble sort
;By Owen6314
;to run this, Irvine32.inc need to be in your path
;Is the "+" necessary or redundant？
;--------------------------------------------------------------------------------------
include Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    testArray1 WORD 3, 1, 7, 5, 2, 9, 4, 3
	testArray2 WORD 1, 2, 3, 3, 3, 3
	testArray3 WORD 10000, 2000, 30000, 4, 1000
	comma BYTE ",", 0
.code
;-----------------------------------------------------------------
;bubble sort 
;receive: pArray:array pointer, Count:element number
;use ebx to represent whether there is changing in one sort
;return: none
;-----------------------------------------------------------------
BubbleSort PROC, pArray: PTR DWORD, Count:DWORD
	mov ecx, Count
	dec ecx
L1:
	xor eax, eax
	xor ebx, ebx
	push ecx
	mov edx, pArray
L2:
	mov ax, [edx]
	cmp [edx + 2], ax
	jg L3
	xchg ax, [edx + 2]
	mov [edx], ax
	mov ebx, 1
L3:
	add edx, 2
	loop L2
	pop ecx
	cmp ebx, 0
	je L4
	loop L1
L4:
	ret
BubbleSort ENDP
;-----------------------------------------------------------------
;print array
;receive: pArray:array pointer, Count:element number
;return: none
;-----------------------------------------------------------------
PrintArray PROC USES eax ebx ecx edx, pArray: DWORD, Count:DWORD
	mov ecx, count
	mov ebx, pArray
	mov eax, 0  
L1:
	mov ax, [ebx]
	call WriteInt
	mov edx, OFFSET comma
	call WriteString
	add ebx, 2
	loop L1
    ret
PrintArray ENDP
;---------------------------------------------------------------------
main PROC
	invoke BubbleSort, ADDR testArray1, LENGTHOF testArray1
	call CrLf
	invoke PrintArray, ADDR testArray1, LENGTHOF testArray1
	invoke BubbleSort, ADDR testArray2, LENGTHOF testArray2
	call CrLf
	invoke PrintArray, ADDR testArray2, LENGTHOF testArray2
	invoke BubbleSort, ADDR testArray3, LENGTHOF testArray3
	call CrLf
	invoke PrintArray, ADDR testArray3, LENGTHOF testArray3
	call WaitMsg
	exit
main ENDP
END main