# 4-to-1 MUX Challenge
## #generatedByChatGPT

### Objective:
Design a circuit that selects one of four input signals based on a 2-bit selector and routes it to the single output. This is the fundamental behavior of a 4-to-1 multiplexer.

### Requirements:

#### Inputs:
- Four data inputs: D[3:0]
- 2-bit Selector: S[1:0]

#### Outputs:
- Single output line: Y

### Guidelines:

1. **VHDL File**: Construct a dedicated VHDL file for the multiplexer (e.g., `4_to_1_mux.vhdl`).

2. **Top Module**: Design a top module (e.g., `top_4_to_1_mux.vhdl`) where you instantiate the MUX component and wire the inputs and outputs.

3. **Component Breakdown**: Consider how you might decompose this MUX into simpler components, such as 2-to-1 MUXs. Breaking down complex entities into simpler parts can be an effective approach to tackle larger designs.

4. **Testing**: Utilize the provided testbench (`tb_top_module.vhd`) to assess the MUX's accuracy for a variety of input scenarios and selector values.

### Automated Testing and Verification:

To streamline the testing process and ensure consistent, unbiased results, we employ a Python script that auto-generates test vectors (seed files). These seed files provide a range of input scenarios that your MUX design must handle. 

##### Test Files:
- `seeds.txt`: This file houses a sequence of seed numbers, each responsible for generating distinct inputs and corresponding expected outputs. To expand your test coverage, simply append additional seeds, one per line.
- `input_vectors.txt`: Contains a series of input combinations for the data inputs and selectors.
- `expected_output.txt`: Contains the expected outputs corresponding to the input vectors, serving as a reference for the correct behavior.

##### Python Script:
- `generate_test_vectors.py`: This script generates the `input_vectors.txt` and `expected_output.txt` by simulating all possible combinations of inputs and selectors and their respective expected outputs. You can run this script to generate fresh test vectors.

##### Testbench Usage:
- The provided testbench (`tb_top_module.vhd`) is configured to read the input vectors from `input_vectors.txt` and stimulate your 4-to-1 MUX design. It then captures the outputs and compares them against `expected_output.txt`.
- Discrepancies between your design's outputs and the expected outputs are logged and flagged for your review.

#### How to Use:
1. Run `generate_test_vectors.py` to produce the `input_vectors.txt` and `expected_output.txt` files.
2. Implement your design in `4_to_1_mux.vhdl`.
3. Use the `tb_top_module.vhd` testbench to test your design, pointing it to the correct input and expected output files.
4. Observe the test results to identify any discrepancies and refine your design as needed.


### Bonus:
- Implement a comprehensive commenting approach in your VHDL code to enhance readability and understanding for others.
- Think about potential edge cases: For instance, what should occur if the selector inputs are ambiguous (e.g., both 'U')? 

### Evaluation Criteria:
- Precise 4-to-1 multiplexing for all possible input and selector combinations.
- Proper component instantiation and assembly within the top module.
- VHDL code clarity, readability, and the inclusion of relevant comments.
