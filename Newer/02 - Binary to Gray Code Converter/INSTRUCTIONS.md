# Binary to Gray Code Converter Challenge
## #generatedByChatGPT

### Objective:
Design a circuit that takes a 4-bit binary number as input and outputs its corresponding Gray code. Create individual VHDL files for any components you use, then integrate them in a top module.

### Requirements:
#### Inputs:
- 4-bit Binary number: B[3:0]
  
#### Outputs:
- 4-bit Gray code: G[3:0]

### Guidelines:

1. **VHDL File**: Create a dedicated VHDL file for the converter (e.g., `binary_to_gray.vhdl`).

2. **Top Module**: Create a top module (e.g., `top_binary_to_gray.vhdl`), where you instantiate the converter component and connect inputs and outputs.

3. **Testing**: Write a testbench for the top module to verify the converter's correctness using various 4-bit binary inputs.

### Evaluation Criteria:
- Correct implementation and Gray code output for all 16 binary input combinations.
- Proper instantiation and integration in the top module.
- Clean and readable VHDL code with appropriate comments.