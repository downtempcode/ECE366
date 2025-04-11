# Fibonacci(n)
# Input: $a0 = n
# Output: $v0 = Fibonacci(n)

.data
n: .word 7   # Change this to any desired input value
m: .word 0
.text
# =======================
# MAIN: Initialize n and m
# =======================
main:	
	# Load n
    	lw   $a0, n          	# $a0 = n
    	jal  Fibonacci         # Call Fibonacci(n), result in $v0

    	move $a0, $v0          # Move Fibonacci result into $a0 for Odd
  	jal  Odd               # Call Odd($a0), result in $v0

    	sw   $v0, m            # Store final result (0 or 1) in memory at label m

stop:
    	nop
    	j stop
	
# =======================
# Fibonacci(n)
# Input: $a0 = n
# Output: $v0 = Fibonacci(n)
# (Your original code preserved)
# =======================
# Fibonacci(n)
# Input: $a0 = n
# Output: $v0 = Fibonacci(n)

# =======================
# MAIN: Initialize n
# =======================
Fibonacci:
	# Define constant = 1
	addi $t5, $zero, 1	# $t5 = 1	 (constant 1)
	
# === Special Case: if n <= 1, return n ===
	sub  $t6, $a0, $t5	# $t6 = n - 1
	bltz $t6, return_n  	# if (n - 1) < 0 ⇒ n <= 0 ⇒ return n
	beq  $a0, $t5, return_n	# if n == 1 ⇒ return n
	
# === Initialize variables: a = 0, b = 1, i = 0 ===	
	# Define a = 0, b = 1
	addi $t0, $zero, 0     # $t0 = 0 	(a = 0)
	addi $t1, $zero, 1     # $t1 = 1 	(b = 1)

	# Loop limit
	sub  $t4, $a0, $t5     # $t4 = $a0 - 1 	(n - 1)
	
	# Initialize i
	addi $t3, $zero, 0     # $t3 = 0 	(i = 0)

# =======================
# LOOP: Fibonacci logic
# =======================
fib_loop:
	
	beq  $t3, $t4, fib_done    # if i == (n - 1), exit loop

	add  $t2, $t1, $zero   # $t2 (temp) = $t1 (b) 	(temp = b)
	add  $t1, $t0, $t1     # $t1 (b) = a + b 	(b = a + b)
	add  $t0, $t2, $zero   # $t0 (a) = temp 	(a = temp)
	addi $t3, $t3, 1       # i++

	# Check loop condition
	bne  $t3, $t4, fib_loop    # loop if i != (n - 1)

# =======================
# DONE: return result: b
# =======================
fib_done:
	add  $v0, $t1, $zero   # $v0 = b (store result in return reg)
	beq  $zero, $zero, fib_end   # simulated jump to end

# =======================
# RETURN_N: return special case: n
# =======================----
return_n:
    	add  $v0, $a0, $zero     # $v0 = n
    	beq  $zero, $zero, fib_end   # simulated jump to end

fib_end:
	jr $ra
    	# program ends
    	

# ================================
# Odd(m): returns 1 if m is odd, 0 if even
# Input: $a0 = m
# Output: $v0 = 1 if odd, 0 if even
# ================================
Odd:
    	li   $t0, 2         # divisor = 2
    	move $t1, $a0       # x = m

div_loop:
    	blt  $t1, $t0, div_done
    	sub  $t1, $t1, $t0
    	j div_loop

div_done:
    	li   $v0, 0
    	beq  $t1, $zero, odd_end
    	li   $v0, 1

odd_end:
	jr   $ra

