.global wave

# rdi, rsi

wave:
    movq $0, %rbx # i

    movq %rdi, %rdx
    decq %rdx # rdx = n - 1
    
    jmp .poseidon

.poseidon:
    cmpq %rdi, %rbx
    jge .endPoseidon

    movq (%rsi, %rbx, 8), %r9 # r9 = a[i]

    cmpq $0, %rbx
    je .secondSwap

    movq -8(%rsi, %rbx, 8), %r8 # r8 = a[i - 1] if i > 0
    
    cmpq %r8, %r9
    jl .swapPrev

    .secondSwap:
    cmpq %rdx, %rbx
    je .increment

    movq 8(%rsi, %rbx, 8), %r10 # r10 = a[i + 1] if i < n - 1

    cmpq %r10, %r9
    jl .swapNext

    .increment:
    addq $2, %rbx
    jmp .poseidon

.endPoseidon:
    ret

.swapPrev:
    movq %r8, (%rsi, %rbx, 8)
    movq %r9, -8(%rsi, %rbx, 8)
    jmp .secondSwap

.swapNext:
    movq %r10, (%rsi, %rbx, 8)
    movq %r9, 8(%rsi, %rbx, 8)
    jmp .increment
