msg: .ascii "The double is: "
newline: .ascii "\n"

.section .bss
output: .space 2   # digit + newline

.section .text
.global _start

_start:

   mov 16(%rsp), %rsi     # rsi = pointer to argv[1]
    mov (%rsi), %al        # load first character
    sub $48, %al           # '5' → 5
    movzx %al, %eax
    imul $2, %eax
    add $48, %al           # back to ASCII
    mov %al, output
    movb $10, output+1     
    mov $1, %rax
    mov $1, %rdi
    mov $msg, %rsi
    mov $16, %rdx
    syscall
    mov $1, %rax
    mov $1, %rdi
    mov $output, %rsi
    mov $2, %rdx
    syscall

    mov $60, %rax
    xor %rdi, %rdi
    syscall
