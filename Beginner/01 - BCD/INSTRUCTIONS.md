# Binary-Coded Decimal (BCD) Challenge

## Introduction
Binary-Coded Decimal (BCD) is a class of binary encodings of decimal numbers where each decimal digit is represented by a fixed number of binary digits, usually four or eight. It is a way to express decimal numbers in binary form, which can be especially useful in systems where a decimal representation is desired.

## Challenge

You are tasked with creating a VHDL module that performs addition of two BCD numbers. The module should take in two BCD encoded numbers and produce their sum in BCD format.

### Requirements:

1. **Inputs**:
   - Two 8-bit BCD numbers (`BCD_A` and `BCD_B`).

2. **Outputs**:
   - A 9-bit BCD result (`BCD_RESULT`) where the most significant bit will be 0 for a positive result and 1 for a negative result.
   
3. **Constraints**:
   - The maximum value for any BCD input is 99 (i.e., `10011001`).
   - The minimum value for any BCD input is 0 (i.e., `00000000`).
   - If the sum exceeds 99 or goes negative, the output should roll over (modulo arithmetic) and set the MSB to indicate positive or negative. For example, 98 + 3 = 101 should result in 01 (indicating +01) with the MSB set to 1 (indicating negative, or an "underflow").

4. **Features**:
   - The design should be synthesizable.
   - The design should be clocked (i.e., the addition operation should be initiated on a clock edge).

5. **Testbench**:
   - You should also design a testbench to demonstrate that your module works for various inputs, including edge cases.

### Steps:

1. **Design the BCD Adder**:
   - Think about how to handle carry when summing BCD digits.
   - Consider how to detect and handle overflow and underflow conditions.

2. **Implement Testbench**:
   - Test all normal scenarios (e.g., 12 + 34, 56 + 78).
   - Test edge cases (e.g., 99 + 1, 98 + 3, 1 + 99, 3 + 98).
   - Validate the results.

3. **Optimizations** (for advanced users):
   - Can you optimize the design for speed? 
   - Can you reduce the number of logic gates required for the addition?

### Tips:

- Remember that BCD values are not the same as straight binary. Each group of 4 bits represents a decimal number from 0 to 9.
  
- Be careful with carry operations. In binary addition, a carry happens when the sum is 2 (10 in binary). In BCD, a carry happens when the sum is 10 (1010 in binary).

Good luck!