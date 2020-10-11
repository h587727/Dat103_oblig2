section .bss
    i resb 1

section .data
    crlf db 13,10
    crlflen equ $ - crlf

section .text

global _start

_start:
    mov eax,0
    mov [i],eax
    mov ecx,0

lokke:    cmp ecx, 10
    jb oek
    call minsk

mindreenntyve: 
    cmp ecx,19

    inc ecx
    jb lokke
    call skrivut
    mov eax,1
    mov ebx,0
    int 0x80


oek:    mov eax,[i] ;Øker verdi på i med 1
    inc eax
    mov [i], eax
    jmp mindreenntyve


minsk:    mov eax,[i] ;Minsker verdi på i med 1
    dec eax
    mov [i], eax
    jmp mindreenntyve


skrivut:
    push ebp
    mov ebp,esp
    mov edx,1
    mov ecx,[i]
    add ecx,'0'
    mov [i],ecx
    mov ecx,i
    mov ebx,1
    mov eax,4
    int 0x80
    pop ebp
    ret
