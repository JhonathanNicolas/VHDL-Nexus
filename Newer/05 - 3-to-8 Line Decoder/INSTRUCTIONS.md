# 3-to-8 Line Decoder Challenge
## #generatedByChatGPT

### Objective:
Design a circuit that decodes a 3-bit binary input into one of eight possible outputs. The output corresponding to the binary number will be set to high, while all other outputs remain low. 

### Requirements:

#### Inputs:
- 3-bit Binary number: B[2:0]

#### Outputs:
- Eight individual output lines: O[7:0]. Only one of these will be high based on the input.

### Guidelines:

1. **VHDL File**: Create a dedicated VHDL file for the decoder (e.g., `3_to_8_decoder.vhdl`).

2. **Top Module**: Design a top module (e.g., `top_3_to_8_decoder.vhdl`) where you instantiate the decoder component and connect the inputs and outputs.

3. **Component Breakdown**: Think about how you might break down this decoder into simpler components. Can 2-to-4 decoders be used in any way? While this isn't mandatory, it's an interesting approach to consider.

4. **Testing**: Use the provided testbench (`tb_top_module.vhd`) to verify the decoder's correctness for various 3-bit binary inputs.

### Bonus:
- Write detailed comments and a clear structure in your VHDL code to make it easy for others to understand.
- Consider edge cases: What happens if all inputs are undefined (i.e., all 'U')? 

### Evaluation Criteria:
- Correctness of the 3-to-8 line decoding for all possible 3-bit inputs.
- Proper instantiation and integration in the top module.
- The clarity of VHDL code, readability, and appropriate comments.