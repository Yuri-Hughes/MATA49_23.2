#ATIVIDADE PRÁTICA 2 - QUESTÃO 2
#Yuri Freitas Hughes - 220115570


bits 64

global main

extern printf, scanf

section .data
  message_anos db "Quantos anos %d", 0
  message_dias db "Quantos meses %d ", 0
  message_meses db "Quantod dias %d", 0

  reposta db "total de %d dias", 10, 0

section .bss 
 anos resq 2
 meses resq 1
 dias resq 1 

section .text
    main:  

      mov rdi, messade_anos ;
      call scanf
      mov rdi, anos 

      mov rdi, messade_meses ;
      call scanf 
      mov rdi, meses

      mov rdi, messade_dias ;
      call scanf 
      mov rdi, dias 

      
      xor rax , rax 
      imul rax, [years], 365 + [months] * 30 + [days]

      mov rdi, resultado ;
      mov rsi, rax
      call printf

      pop rdi
      pop rax
      ret

      
    mov rax, 60             
    xor rdi, rdi            
    syscall   
