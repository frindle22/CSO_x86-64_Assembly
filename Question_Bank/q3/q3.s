.global modify

# rdi, rsi

modify:
    movq $0, %rbx # i = 0
    jmp .setAll

.setAll:
    cmpq %rdi, %rbx
    je .endSetAll

    movq %rbx, %rcx
    incq %rcx # rcx = i + 1

    movq %rcx, (%rsi, %rbx, 8) # a[i] = i + 1

    incq %rbx
    jmp .setAll

.endSetAll:
    movq $2, %rbx # i = 2
    jmp .setThrees

# Multiples of 3 = -1

.setThrees:
    cmpq %rdi, %rbx
    jge .endSetThrees

    movq $-1, (%rsi, %rbx, 8)

    addq $3, %rbx
    jmp .setThrees

.endSetThrees:
    movq $4, %rbx # i = 4
    jmp .setFives

# Multiples of 5 = -2

.setFives:
    cmpq %rdi, %rbx
    jge .endSetFives

    movq $-2, (%rsi, %rbx, 8)

    addq $5, %rbx
    jmp .setFives

.endSetFives:
    movq $14, %rbx # i = 14
    jmp .setFifteens

# Multiples of 15 = -3
.setFifteens:
    cmpq %rdi, %rbx
    jge .endSetFifteens

    movq $-3, (%rsi, %rbx, 8)

    addq $15, %rbx
    jmp .setFifteens

.endSetFifteens:
    ret
