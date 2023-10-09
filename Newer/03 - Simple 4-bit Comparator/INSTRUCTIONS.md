# Simple 4-bit Comparator Challenge
## #generatedByChatGPT

### Objective:
Create a 4-bit comparator that determines if two 4-bit numbers are equal, or if one is greater or less than the other.

### Requirements:
#### Inputs:
- A[3:0]
- B[3:0]
  
#### Outputs:
- EQUAL
- A_GREATER_THAN_B
- A_LESS_THAN_B

### Guidelines:

1. **VHDL File**: Create a distinct VHDL file for the comparator (e.g., `comparator_4bit.vhdl`).

2. **Top Module**: Instantiate the comparator component in a top module (e.g., `top_comparator.vhdl`).

3. **Testing**: Write a testbench to verify the comparator's function across all possible 4-bit input combinations.

### Evaluation Criteria:
- Accurate outputs for every possible pair of 4-bit inputs.
- Proper integration in the top module.
- Clean and comprehensive VHDL code.