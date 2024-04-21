.global ones

# rdi

ones:
    movq $0, %rax
    jmp .onesLoop

.onesLoop:
    cmpq $0, %rdi
    je .endOnesLoop

    test $1, %rdi # Sets condition codes according to %rdi & 1, i.e, the first digit
    jnz .incrementCount

    .rightShift:
    sarq $1, %rdi
    jmp .onesLoop

.incrementCount:
    incq %rax
    jmp .rightShift

.endOnesLoop:
    test $1, %rax
    jz .zero
    movq $1, %rax
    ret

.zero:
    movq $0, %rax
    ret
