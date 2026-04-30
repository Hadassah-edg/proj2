.section .data
input_fmt:  .string "%d"
output_fmt: .string "The double is: %d\n"

.section .text
.globl main

main:
    push %rbp
    mov %rsp, %rbp
    sub $16, %rsp

    lea -4(%rbp), %rsi
    lea input_fmt(%rip), %rdi
    xor %eax, %eax
    call scanf

    mov -4(%rbp), %edi
    add %edi, %edi
    mov %edi, %esi

    lea output_fmt(%rip), %rdi
    xor %eax, %eax
    call printf

    xor %eax, %eax
    leave
    ret
