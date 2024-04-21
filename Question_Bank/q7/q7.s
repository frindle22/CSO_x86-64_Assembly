.global maxCornerSum

# rdi, rsi, rdx

maxCornerSum:
    movq $0, %r8 # l = 0
    movq %rdi, %r9
    subq %rsi, %r9 # r = n - k
    movq $0, %rax

    movq %r9, %rbx # i = r
    jmp .lastKSum

.lastKSum:
    cmpq %rdi, %rbx
    je .endLastKSum

    addq (%rdx, %rbx, 8), %rax

    incq %rbx
    jmp .lastKSum

.endLastKSum:
    movq %rax, %rcx # total = res
    jmp .slidingWindow

.slidingWindow:
    cmpq %rdi, %r9
    je .endSlidingWindow

    addq (%rdx, %r8, 8), %rcx
    subq (%rdx, %r9, 8), %rcx

    cmpq %rcx, %rax
    jl .updateMax

    .increment:
    incq %r8
    incq %r9
    jmp .slidingWindow

.endSlidingWindow:
    ret

.updateMax:
    movq %rcx, %rax
    jmp .increment
