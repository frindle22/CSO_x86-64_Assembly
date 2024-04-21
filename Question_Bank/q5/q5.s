.global arrange

# rdi, rsi

arrange:
    movq $0, %rcx # 0 count
    movq $0, %rbx # i = 0
    jmp .countLoop

.countLoop:
    cmpq %rdi, %rbx
    je .endCountLoop
    cmpq $0, (%rsi, %rbx, 8)
    jz .incZeroes

    incq %rdx

    .increment:
    incq %rbx
    jmp .countLoop

.incZeroes:
    incq %rcx
    jmp .increment

.endCountLoop:
    movq $0, %rbx # Fill zero count
    jmp .fillZeroes

.fillZeroes:
    cmpq %rcx, %rbx
    je .fillOnes

    movq $0, (%rsi, %rbx, 8)

    incq %rbx
    jmp .fillZeroes

.fillOnes:
    cmpq %rdi, %rbx
    je .endAll

    movq $1, (%rsi, %rbx, 8)

    incq %rbx
    jmp .fillOnes

.endAll:
    ret
