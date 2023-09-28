
#ATIVIDADE PRÁTICA 2 - QUESTÃO 1
#Yuri Freitas Hughes - 220115570


bits 64

global main

extern printf, scanf


section .text
    main:


    push rdi
    push rsi

    mov rdi, escreva_palavra
    lea rsi, [palavra]

    call scanf
    pop rsi
    pop rdi 


    push rdi
    push rsi 
    mov rdi, escreva_letra
    lea rsi, [letra]
    call scanf 
    pop rsi 
    pop rdi


 inicio_fim:
    xor rcx, rcx 

    .loop:
      mov al,[rdi+rcx]
      test al, al
      jz .done 
      inc rcx
      jmp .loop

    .done:
      mov rax, rcx
      ret 

  letra_palavra:
    xor rcx, rcx

  .loop:
    mov al,[letra+rcx]
    test al, al
    jz  .nao 
    cmp al, [letra]
    je  .sim
    inc rcx
    jmp .loop

  .sim:
    ret
  .nao:
    ret
    

  mov rdi, palavra
  call inicio_fim
  call letra_palavra

  mov rdi, output
  mov rax, [palavra]
  mov rbx, [palavra + rsi]
  mov rcx, [letra]
  mov rdx, rax
  mov rsi, rbx 
  call printf

  mov rax, 60
  xor rdi, rdi
  syscall
    

section .data 
    input db "%s", 0
    output  db  "Primeira letra: %c, ultima: %c e %s.",10,0"

    escreva_palavra db "digite uma palavra: ", 0;
    escreva_letra db "digite uma letra: ", 0;   

section .bss
    palavra resb 20
    letra resb 1