.global missing

# rdi, rsi

missing:
    movq $0, %rbx # i
    movq %rdi, %r8
    incq %r8 # r8 = n + 1
    jmp .modify

.modify:
    cmpq %rdi, %rbx
    je .endModify

    cmpq $0, (%rsi, %rbx, 8)
    jle .setNonPositive

    .incrementModify:
    incq %rbx
    jmp .modify

.setNonPositive:
    movq %r8, (%rsi, %rbx, 8)
    jmp .incrementModify

.endModify:
    movq $0, %rbx
    jmp .makeHash

.makeHash:
    cmpq %rdi, %rbx
    je .endMakeHash

    movq (%rsi, %rbx, 8), %r9
    cmpq %rdi, %r9 # If a[i] > n don't do anything
    jg .increment

    cmpq $0, %r9
    jl .makeAbs

    .setIndex:
    decq %r9
    cmpq $0, (%rsi, %r9, 8)
    jl .increment

    movq (%rsi, %r9, 8), %rcx
    imulq $-1, %rcx
    movq %rcx, (%rsi, %r9, 8)

    .increment:
    incq %rbx
    jmp .makeHash

.makeAbs:
    imulq $-1, %r9
    jmp .setIndex

.endMakeHash:
    movq $0, %rbx
    movq %rdi, %rax
    incq %rax # Default answer = n + 1
    jmp .checkMissing

.checkMissing:
    cmpq %rdi, %rbx
    je .endCheckMissing

    cmpq $0, (%rsi, %rbx, 8)
    jg .setMissingValue

    incq %rbx
    jmp .checkMissing

.endCheckMissing:
    ret

.setMissingValue:
    movq %rbx, %rax
    incq %rax
    ret
