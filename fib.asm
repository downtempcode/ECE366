# Fibonacci(n)
# Input: $a0 = n
# Output: $v0 = Fibonacci(n)

.data
n: .word 5    # Change this to any desired input value
.text
# =======================
# MAIN: Initialize n
# =======================
main:	
	# Load n
	lw   $a0, n       	# $a0 = n
	
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
loop:
	
	beq  $t3, $t4, done    # if i == (n - 1), exit loop

	add  $t2, $t1, $zero   # $t2 (temp) = $t1 (b) 	(temp = b)
	add  $t1, $t0, $t1     # $t1 (b) = a + b 	(b = a + b)
	add  $t0, $t2, $zero   # $t0 (a) = temp 	(a = temp)
	addi $t3, $t3, 1       # i++

	# Check loop condition
	bne  $t3, $t4, loop    # loop if i != (n - 1)

# =======================
# DONE: return result: b
# =======================
done:
	add  $v0, $t1, $zero   # $v0 = b (store result in return reg)
	beq  $zero, $zero, end   # simulated jump to end

# =======================
# RETURN_N: return special case: n
# =======================----
return_n:
    	add  $v0, $a0, $zero     # $v0 = n
    	beq  $zero, $zero, end   # simulated jump to end

end:
    	# program ends

