### 2-to-4 Line Decoder Challenge
## #generatedByChatGPT

### Objective:
Design a circuit that functions as a 2-to-4 line decoder. A 2-to-4 line decoder takes a 2-bit binary input and selects one of the four possible output lines, setting it to high while the rest remain low.

### Requirements:
#### Inputs:
- 2-bit Binary number: `D[1:0]`

#### Outputs:
- Four output lines: `O[3:0]`. Only one of these lines should be high based on the input.

### Guidelines:

1. **VHDL File**: Create a dedicated VHDL file for the decoder (e.g., `2_to_4_decoder.vhdl`).

2. **Top Module**: Create a top module (e.g., `top_2_to_4_decoder.vhdl`), where you instantiate the decoder component and connect inputs and outputs.

3. **Operation**:
   - If `D[1:0]` = "00", then `O[0]` should be high and all other outputs should be low.
   - If `D[1:0]` = "01", then `O[1]` should be high and all other outputs should be low.
   - If `D[1:0]` = "10", then `O[2]` should be high and all other outputs should be low.
   - If `D[1:0]` = "11", then `O[3]` should be high and all other outputs should be low.

4. **Testing**: Use the provided testbench (`tb_top_module.vhd`) to verify the decoder's correctness for all possible 2-bit binary inputs.

### Evaluation Criteria:
- Correct output line activation for each of the 2-bit binary input combinations.
- Proper instantiation and integration in the top module.
- Clean and readable VHDL code with appropriate comments.