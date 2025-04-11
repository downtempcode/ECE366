README
Project 2: Progress Report 1
Fibonacci(n)


Team members: Sierra Bowler, Ailene Rodriguez, Kevin Cervera

NET IDs: sbowl, arodr310, kcerve3

Contribution: Sierra drafted the .asm code using the lecture slides from class and using the MARS help manual. Ailene worked on the code for the loop. Kevin worked on the special case and helped with the main function.

GitHub link: [https://github.com/downtempcode/ECE366](https://github.com/downtempcode/ECE366/blob/main/fib.asm)

How to run the MIPS program to get the nth Fibonacci number for a given n:
Open our file using MARS, then locate this line in the .data section of our code:
n: .word 8    # Change this to any desired input value
Change 8 to the value of n you want to compute, then assemble and run.
After execution, open the Registers pane and look at register $v0 — this holds the final result.

================================================================================

Project 2: Progress Report 2
Odd(n)

Team members: Sierra Bowler, Ailene Rodriguez, Kevin Cervera

NET IDs: sbowl, arodr310, kcerve3

Contribution: Ailene implemented the Odd(m) function using division by repeated subtraction and tested the loop logic. Kevin helped structure the conditional logic for checking the remainder and finalized the return logic. Sierra set up the memory I/O for testing and verified correctness using MARS.

GitHub link: https://github.com/downtempcode/ECE366

How to run the MIPS program to determine if a number m is odd:  
Open our file using MARS, then locate this line in the .data section of our code:  
m: .word 7       # Change this to any desired input value  

Change 7 to the value of m you want to test, then assemble and run.  
After execution, open the Registers pane and look at register $v0 – this holds the final result:  
- "1" means the number is "odd"  
- "0" means the number is "even"

================================================================================

Project 2: Progress Report 3
isFibonacciOdd(n)

Team members: Sierra Bowler, Ailene Rodriguez, Kevin Cervera

NET IDs: sbowl, arodr310, kcerve3

Contribution: Kevin integrated the Fibonacci and Odd functions into a single top-level program. Ailene helped implement the control flow and verified memory logic for correctness. Sierra confirmed proper register usage and validated final results using MARS.

GitHub link: https://github.com/downtempcode/ECE366

How to run the MIPS program to determine if the nth Fibonacci number is odd:
Open our file using MARS, then locate this line in the .data section of our code:
n: .word 7 # Change this to any desired input value

Change 7 to the value of n you want to test, then assemble and run.
After execution, open the Data Segment or Registers pane and check memory location m:

"1" means the Fibonacci result is odd

"0" means it is even
