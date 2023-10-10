# Binary to Gray Code Converter Challenge
### Objective:
Design a circuit that takes a 4-bit binary number as input and outputs its corresponding Gray code. Create individual VHDL files for any components you use, then integrate them in a top module.

### Requirements:
#### Inputs:
- 4-bit Binary number: B[3:0]
  
#### Outputs:
- 4-bit Gray code: G[3:0]

### Guidelines:

1. **VHDL File**: Create a dedicated VHDL file for the converter (e.g., `binary_to_gray.vhdl`).

2. **Top Module**: Create a top module (e.g., `top_module.vhdl`), where you instantiate the converter component and connect inputs and outputs.

3. **Testing**: 
   - Utilize the provided testbench named `tb_top_module.vhd` in the challenge directory. Make sure your converter component's entity matches the expected entity in the testbench.
   - The testbench will read and compare the output of your converter with the `expected_result.txt` file. Ensure that your design works correctly with the testbench using simulators like XSIM.

### Evaluation Criteria:
- Correct implementation and Gray code output for all 16 binary input combinations.
- Proper instantiation and integration in the top module.
- Successful validation against the provided testbench (`tb_top_module.vhd`) and `expected_result.txt` file.
- Clean and readable VHDL code with appropriate comments.