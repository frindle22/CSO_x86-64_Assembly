.global oddSort

# rdi, rsi

oddSort:
    movq $0, %rbx # i
    movq $0, %r8
    movq $0, %r9
    jmp .testOdd

.testOdd:
    cmpq %rdi, %rbx
    je .checkParity

    testq $1, (%rsi, %rbx, 8)
    jnz .oddThere
    jz .evenThere

    .incrementTestOdd:
    incq %rbx
    jmp .testOdd

.oddThere:
    movq $1, %r8
    jmp .incrementTestOdd

.evenThere:
    movq $1, %r9
    jmp .incrementTestOdd

.checkParity:
    testq %r9, %r8
    jz .endAll

    jmp .odd

# If there's even one odd value the answer is the sorted array
# Bubble sort

.odd:
    movq $0, %rbx # i
    movq %rdi, %r8
    decq %r8 # r8 = n - 1
    jmp .outerLoop

.outerLoop:
    cmpq %r8, %rbx
    je .endAll

    movq $0, %r10 # flag

    movq $0, %rcx # j

    movq %r8, %rdx
    subq %rbx, %rdx # rdx = n - 1 - i

    jmp .innerLoop

    .incrementOuterLoop:
    incq %rbx
    jmp .outerLoop

.innerLoop:
    cmpq %rdx, %rcx
    je .endInnerLoop

    movq (%rsi, %rcx, 8), %r11
    movq 8(%rsi, %rcx, 8), %r12
    cmpq %r12, %r11 # a[i], a[i + 1]
    jg .swap

    .incrementInnerLoop:
    incq %rcx
    jmp .innerLoop

.swap:
    movq %r11, 8(%rsi, %rcx, 8)
    movq %r12, (%rsi, %rcx, 8)

    movq $1, %r10
    jmp .incrementInnerLoop

.endInnerLoop:
    cmpq $0, %r10
    je .endAll

    jmp .incrementOuterLoop

.endAll:
    ret
