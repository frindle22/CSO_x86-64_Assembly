.global palindrome

# rdi

palindrome:
    movq %rdi, %rax
    movq $0, %rcx
    movq $10, %r8

.palindromeLoop:
    cmpq $0, %rax
    je .endPalindromeLoop

    cqto
    idivq %r8

    imulq $10, %rcx
    addq %rdx, %rcx
    
    jmp .palindromeLoop

.endPalindromeLoop:
    cmpq %rdi, %rcx
    je .true
    
    ret

.true:
    movq $1, %rax
    ret
