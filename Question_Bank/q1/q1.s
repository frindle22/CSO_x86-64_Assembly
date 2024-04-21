.global operations

# rdi, rsi, rdx

operations:
    movq %rdi, %rax

    cmpq $1, %rdx
    je .add

    cmpq $2, %rdx
    je .subtract

    cmpq $3, %rdx
    je .divide

    cmpq $4, %rdx
    je .power

    cmpq $5, %rdx
    je .mod

.add:
    addq %rsi, %rax
    ret

.subtract:
    subq %rsi, %rax
    ret

.divide:
    cqto
    idivq %rsi
    ret

.power:
    movq $1, %rax
    movq $0, %rbx # Loop variable i
    jmp .powerLoop

.powerLoop:
    cmpq %rsi, %rbx
    je .endPowerLoop

    imulq %rdi, %rax

    incq %rbx
    jmp .powerLoop

.endPowerLoop:
    ret

.mod:
    cqto
    idivq %rsi
    movq %rdx, %rax
    ret
