.global special

# rdi

special:
    movq %rdi, %rax
    movq %rdi, %rcx # rcx = n
    movq $10, %r8
    movq $0, %r10 # Sum of factorials of digits
    jmp .extractDigits

.extractDigits:
    cmpq $0, %rax
    je .last

    cqto
    idivq %r8

    movq %rax, %r9 # r9 = i / 10
    movq %rdx, %rdi # rdi = i % 10

    callq .factorial
    
    addq %rbx, %r10

    jmp .extractDigits

.factorial:
    movq $1, %rbx # ans = 1
    movq $1, %r9 # i = 1
    jmp .factorialLoop

.factorialLoop:
    cmpq %rdi, %r9
    jg .endFactorialLoop

    imulq %r9, %rbx

    incq %r9
    jmp .factorialLoop

.endFactorialLoop:
    ret

.last:
    movq $0, %rax # Default return value 

    cmpq %rcx, %r10
    je .true

    ret

.true:
    movq $1, %rax
    ret
