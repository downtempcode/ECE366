README
Project 2: Progress Report 1
Fibonacci(n)

Team members: Sierra Bowler, Ailene Rodriguez, Kevin Cervera
NET IDs: sbowl, arodr310, kcerve3
Contribution: Sierra drafted the .asm code using the lecture slides from class and using the MARS help manual.

GitHub link: [https://github.com/downtempcode/ECE366](https://github.com/downtempcode/ECE366/blob/main/fib.asm)

How to run the MIPS program to get the nth Fibonacci number for a given n:
Open our file using MARS, then locate this line in the .data section of our code:
n: .word 8    # Change this to any desired input value
Change 8 to the value of n you want to compute, then assemble and run.
After execution, open the Registers pane and look at register $v0 — this holds the final result.

