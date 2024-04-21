.global line

# rdi, rsi, rdx

line:
    movq $0, %rbx # i
    movq $0, %rax # total
    jmp .setPeople

.setPeople:
    cmpq %rdi, %rbx
    je .endSetPeople

    cmpq $0, (%rsi, %rbx, 8) # L
    je .setLeft

    movq %rdi, %r8
    decq %r8
    subq %rbx, %r8

    movq %r8, (%rdx, %rbx, 8) # people[i] = n - 1 - i

    .incrementSetPeople:
    addq (%rdx, %rbx, 8), %rax # total += people[i]
    incq %rbx
    jmp .setPeople

.setLeft:
    movq %rbx, (%rdx, %rbx, 8)
    jmp .incrementSetPeople

.endSetPeople:
    movq $0, %rbx # i
    movq %rdi, %r8
    decq %r8 # r8 = n - 1
    jmp .outerLoop

# Bubble Sort

.outerLoop:
    cmpq %r8, %rbx
    je .updateMax

    movq $0, %r10 # flag

    movq $0, %rcx # j

    movq %r8, %r15
    subq %rbx, %r15 # r15 = n - 1 - i

    jmp .innerLoop

    .incrementOuterLoop:
    incq %rbx
    jmp .outerLoop

.innerLoop:
    cmpq %r15, %rcx
    je .endInnerLoop

    movq (%rdx, %rcx, 8), %r11
    movq 8(%rdx, %rcx, 8), %r12
    cmpq %r12, %r11 # a[i], a[i + 1]
    jg .swap

    .incrementInnerLoop:
    incq %rcx
    jmp .innerLoop

.swap:
    movq %r11, 8(%rdx, %rcx, 8)
    movq %r12, (%rdx, %rcx, 8)

    movq $1, %r10
    jmp .incrementInnerLoop

.endInnerLoop:
    cmpq $0, %r10
    je .updateMax

    jmp .incrementOuterLoop

# End Bubble Sort

.updateMax:
    movq $0, %rbx
    movq %rdi, %r13
    sarq $1, %r13 # r13 = n / 2
    jmp .resLoop

.resLoop:
    cmpq %rdi, %rbx
    je .endAll

    cmpq %r13, (%rdx, %rbx, 8)
    jl .updateTotal

    .updatePeople:
    movq %rax, (%rdx, %rbx, 8)

    incq %rbx
    jmp .resLoop

.updateTotal:
    movq %rdi, %r14
    decq %r14
    subq (%rdx, %rbx, 8), %r14
    subq (%rdx, %rbx, 8), %r14 # r14 = (n - 1 - 2 * people[i])

    addq %r14, %rax

    jmp .updatePeople

.endAll:
    ret
