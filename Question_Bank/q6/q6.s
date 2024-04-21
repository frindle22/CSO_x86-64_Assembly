.global gcd

# rdi, rsi

gcd:
    pushq %rbx
    pushq %rbp

    movq %rdi, %rbx
    movq %rsi, %rbp

    movq %rdi, %rax # Return value for base case

    cmpq $0, %rsi
    je .endGcd

    movq %rdi, %r8 # temp = a
    movq %rsi, %rdi # rdi = b
    
    cqto
    idivq %rsi
    
    movq %rdx, %rsi

    callq gcd

.endGcd:
    popq %rbp
    popq %rbx
    ret
