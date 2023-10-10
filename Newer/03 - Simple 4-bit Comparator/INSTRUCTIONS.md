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

### Instructions to Test Your Solution:

1. **Testbench File**: Use the provided testbench file `tb_top_module.vhdl` for testing your design. This file uses the `input_a.txt`, `input_b.txt`, and the output files (`EQUAL.txt`, `A_GREATTER_THAN_B.txt`, and `A_LESS_THAN_B.txt`) to run through all the test cases.

2. **Simulation**: Run the simulation using your preferred VHDL simulation tool. Ensure that your solution passes all the test cases provided in the testbench.

3. **Adding More Test Cases**:
   - If you wish to test with more cases, simply add more seed values to the `SEEDS_TEST.txt` file. 
   - After adding the seeds, run the Python script provided earlier to generate new sets of inputs and expected results based on these seeds.
   - Rerun the simulation with the testbench to include these new test cases.

4. **Comparing Results**: After the simulation is completed, look to the signal `VALID` when it is *TRUE* The signals: `EQUAL_result`, `A_GREATTER_THAN_B_result` and `A_LESS_THAN_B_result` must be *TRUE* otherwise your solution is not correct. In this case, look to the values of inputs and the respective _EXPECTED_ value to try figure out the issue(s) of your code.

### Note:
- Always ensure you've correctly connected the ports of the comparator component in your top module.
- Regularly save and backup your VHDL files to avoid loss of work.

Good luck with your design, and always ensure to verify against the provided test cases and any additional ones you create!


### Evaluation Criteria:
- Accurate outputs for every possible pair of 4-bit inputs.
- Proper integration in the top module.
- Clean and comprehensive VHDL code.