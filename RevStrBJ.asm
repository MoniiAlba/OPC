TITLE Program Template          (RevStr.asm)

; Este programa revierte (invierte) un String.

; Irvine Library procedures and functions
INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib
; End Irvine

.DATA
texto BYTE "Las quince letras", 0
mnsg BYTE 0Ah, 0Dh, "Texto invertido: ", 0
lonTxt WORD LENGTHOF texto - 1
vc SDWORD 0
nc SDWORD ?

.CODE
main PROC

    ; Imprime el texto.
      mov edx, OFFSET texto
	call WriteString
	call CrLf

    ; Invertir el texto del String.
    ;ahora vamos a invertir el arreglo
        mov eax, lonTxt
        sub edx, edx
        mov ebx, 2
        div ebx
        mov nc, eax
        mov esi, nc
        
        .WHILE vc < SDWORD PTR esi
            
            mov edx, lonTxt
            mov ebx, vc
            
            mov eax, byte ptr [texto+ebx] 
            dec edx
            sub edx, ebx
            mov ecx, byte ptr [texto+edx]
            mov byte ptr [texto+ebx], ecx
            mov byte ptr [texto+edx], eax

            inc vc

            
            
        .ENDW
        mov ESI, OFFSET texto
        mov ECX, lonTxt
        mov EBX, 1
        call DumpMem
        call Crlf
        
     ; mov texto, "Z"    ; una prueba de modificacion

    ; Despliega el texto invertido.
	mov edx,OFFSET mnsg
	call Writestring
	mov edx,OFFSET texto
	call Writestring
	call CrLf

	exit
main ENDP

END main