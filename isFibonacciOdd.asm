        .data
n:      .word 8          # Input: change this value to test different n
result: .word 0          # Location to store the odd/even result

        .text
        .globl main

#--------------------------------------------------
# Main Program: Compute if Fibonacci(n) is odd
#--------------------------------------------------
main:
        # Load the input value 'n'
        lw      $a0, n           # $a0 <- n

        # Call the Fibonacci function
        jal     fibonacci        # Result returned in $v0

        # Save the nth Fibonacci number in a temporary register
        move    $t0, $v0         # $t0 now holds Fibonacci(n)

        # Now check if Fibonacci(n) is odd: call the isOdd function
        move    $a0, $t0         # Set up parameter: m = Fibonacci(n)
        jal     isOdd            # isOdd returns 1 if odd, 0 if even in $v0

        # Store the result back into memory at 'result'
        sw      $v0, result

        # Exit the program
        li      $v0, 10
        syscall

#--------------------------------------------------
# Function: fibonacci
# Computes the nth Fibonacci number iteratively.
# Pseudo-code reference: Figure 1 in project PDF :contentReference[oaicite:3]{index=3}
# Parameter: n is in $a0. Returns Fibonacci(n) in $v0.
#--------------------------------------------------
fibonacci:
        # If n <= 1, return n
        ble     $a0, 1, fib_return_direct

        # Initialize registers:
        li      $t1, 0           # a = 0
        li      $t2, 1           # b = 1
        addi    $t3, $a0, -1     # t3 = n - 1 (iteration counter)

fib_loop:
        beq     $t3, $zero, fib_done  # If counter == 0, loop finished
        move    $t4, $t2         # temp = b
        add     $t2, $t1, $t2    # b = a + b
        move    $t1, $t4         # a = temp
        addi    $t3, $t3, -1     # decrement counter
        j       fib_loop

fib_done:
        move    $v0, $t2         # Return Fibonacci number in $v0
        jr      $ra

fib_return_direct:
        move    $v0, $a0         # Return n (if n is 0 or 1)
        jr      $ra

#--------------------------------------------------
# Function: isOdd
# Determines if a number m is odd by calculating m % 2
# using repeated subtraction.
# Pseudo-code reference: Figures 2 and 3 in project PDF :contentReference[oaicite:4]{index=4}
# Parameter: m in $a0. Returns 1 in $v0 if m is odd, 0 if even.
#--------------------------------------------------
isOdd:
        # Copy m into $t5 for manipulation (computing m % 2)
        move    $t5, $a0
        li      $t6, 2           # Divisor: constant 2

odd_loop:
        blt     $t5, $t6, odd_check   # If m < 2, remainder found
        sub     $t5, $t5, $t6         # m = m - 2
        j       odd_loop

odd_check:
        beq     $t5, $zero, even      # if remainder == 0, number is even
        li      $v0, 1                # Non-zero remainder: odd, return 1
        jr      $ra

even:
        li      $v0, 0                # Even, return 0
        jr      $ra
