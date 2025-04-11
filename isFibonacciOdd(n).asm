        .data
n:      .word 8           # Input value (change as desired)
result: .word 0           # Output: 1 if Fibonacci(n) is odd, 0 if even

        .text
        # Main Program: Compute IsFibonacciOdd(n)
main:
        # Load n from memory into register $t0
        lw      $t0, n           # t0 <- n

        # --- Compute Fibonacci(n) iteratively ---
        # If n <= 1, then Fibonacci(n) = n.
        addi    $t1, $zero, 1    # t1 = 1 (constant 1)
        sub     $t2, $t0, $t1    # t2 = n - 1
        bltz    $t2, fib_return_direct   # if (n - 1) < 0, branch
        beq     $t0, $t1, fib_return_direct   # if n == 1, branch

        # Otherwise, initialize registers for iterative Fibonacci:
        addi    $t3, $zero, 0    # t3 = 0 ; will serve as "a"
        addi    $t4, $zero, 1    # t4 = 1 ; will serve as "b"
        sub     $t5, $t0, $t1    # t5 = n - 1 ; loop counter
fib_loop:
        beq     $t5, $zero, fib_done   # if loop counter == 0, done
        add     $t6, $t3, $t4    # t6 = a + b (temporary sum)
        add     $t3, $zero, $t4   # a = b  (simulate move: t3 = t4)
        add     $t4, $zero, $t6   # b = temp (simulate move: t4 = t6)
        addi    $t5, $t5, -1     # decrement loop counter
        j       fib_loop
fib_done:
        add     $t7, $zero, $t4   # t7 holds the Fibonacci result
        j       odd_calc
fib_return_direct:
        add     $t7, $zero, $t0   # Fibonacci result = n (special case)

        # --- Determine if Fibonacci(n) is odd ---
odd_calc:
        addi    $t8, $zero, 2     # t8 = 2 (divisor for modulo)
        add     $t9, $zero, $t7   # t9 = Fibonacci result (copy for modulo calculation)
odd_loop:
        blt     $t9, $t8, odd_check   # if t9 < 2, then remainder is found
        sub     $t9, $t9, $t8    # t9 = t9 - 2
        j       odd_loop
odd_check:
        beq     $t9, $zero, even     # if remainder == 0, then even
        addi    $t0, $zero, 1    # result = 1 (Fibonacci(n) is odd)
        j       store_result
even:
        addi    $t0, $zero, 0    # result = 0 (Fibonacci(n) is even)
store_result:
        sw      $t0, result     # Store the result in memory

        # Terminate program by looping indefinitely.
end_loop:
        j       end_loop
