;2017.10.18
;studnet records
;output:student_info.txt in same directory, text file is encoded in GBK
;By Owen6314
;to run this, Irvine32.inc need to be in your path
;--------------------------------------------------------------------------------------
include Irvine32.inc
BUFFER_SIZE = 500
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
fileName BYTE "student_info.txt", 0
fileHandler DWORD ?
buffer BYTE BUFFER_SIZE DUP(0)
continueInputHelp BYTE "Do you want to continue to enter student info(Y/N,case sensitive): ", 0
studentNumHelp BYTE "Please enter student number: ", 0
studentNameHelp BYTE "Please enter student name: ", 0
studentBirthHelp BYTE "Please enter student's birthday with format yyyy-mm-dd: ", 0

comma BYTE ",", 0
newLine BYTE 0dh, 0ah, 0
.code
;-----------------------------------------------------------------
;create a new file named student_info.txt
;requires:none
;returns:eax:file handler
;-----------------------------------------------------------------
CreateNewFile PROC
	mov edx, OFFSET fileName
	call CreateOutputFile
	mov fileHandler, eax
	ret
CreateNewFile ENDP
;-----------------------------------------------------------------
;read and write one part of input
;requires:a pointer to tips
;returns: none
;-----------------------------------------------------------------
WriteOnePart PROC USES edx ecx eax tip:DWORD
	mov edx, tip
	call WriteString
	mov ecx, BUFFER_SIZE
	mov edx, OFFSET buffer
	call ReadString
	invoke Str_length, ADDR buffer
	mov ecx, eax
	mov eax, fileHandler
	mov edx, OFFSET buffer
	call WriteToFile
	ret
WriteOnePart ENDP
;-----------------------------------------------------------------
;write certain string to file
;requires:stirng address, count of string
;returns:none
;-----------------------------------------------------------------
WriteStringToFile PROC USES eax ecx edx, address:DWORD, count:DWORD
	mov ecx, count
	mov eax, fileHandler
	mov edx, address
	call WriteToFile
	ret
WriteStringToFile ENDP
;-----------------------------------------------------------------
;main proc
;requires:none
;-----------------------------------------------------------------
GetInput PROC
input_loop:
	mov edx, OFFSET continueInputHelp
	call WriteString
	mov ecx, BUFFER_SIZE
	mov edx, OFFSET buffer
	call ReadString

	.if buffer=='N'
		jmp input_end
	.else 
	    .if buffer=='Y'
	        jmp input_student_num
	    .else
		    jmp input_loop
		.endif
	.endif
input_student_num:
	invoke WriteOnePart, ADDR studentNumHelp
	invoke WriteStringToFile, ADDR comma, 1
input_student_name:
	invoke WriteOnePart, ADDR studentNameHelp
	invoke WriteStringToFile, ADDR comma, 1
input_student_birth:
	invoke WriteOnePart, ADDR studentBirthHelp
	invoke WriteStringToFile, ADDR newLine, 2

    jmp input_loop	
input_end:
	ret
GetInput ENDP
main PROC
	call CreateNewFile
	call GetInput
	mov eax, fileHandler
	call CloseFile
	call WaitMsg
	exit
main ENDP
END main