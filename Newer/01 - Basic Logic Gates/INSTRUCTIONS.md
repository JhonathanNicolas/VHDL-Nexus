# Basic Logic Gates Challenge
## #generatedByChatGPT

### Objective:
Implement fundamental logic gates using VHDL. Each gate should have its own VHDL file, and all gates will be instantiated in a top module to test their combined functionality.

### Requirements:

#### Inputs:
- A
- B

#### Outputs:
- AND_Y (Result of A AND B)
- OR_Y (Result of A OR B)
- NOT_A_Y (Result of NOT A)
- NOT_B_Y (Result of NOT B)
- XOR_Y (Result of A XOR B)
- NAND_Y (Result of A NAND B)

### Guidelines:

1. **Separate VHDL Files**: Begin by creating a distinct VHDL file for each logic gate. Name them appropriately (e.g., `and_gate.vhdl`, `or_gate.vhdl`).

2. **Entity & Architecture**: Each VHDL file should have:
   - An entity declaration specific to its gate.
   - An architecture body describing the gate's behavior.

3. **Top Module**: Create a top module (e.g., `top_logic_gates.vhdl`) where you will:
   - Instantiate each gate.
   - Connect the common inputs `A` and `B` to each gate instance.
   - Collect the outputs from each gate instance to the top module's outputs.

4. **Testing**: Write a testbench for the top module:
   - Apply various combinations of input values to `A` and `B`.
   - Monitor and verify the multiple outputs for correctness according to each gate's logic.

5. (Optional) If you have access to FPGA hardware, synthesize your designs and test them on actual hardware.

### Evaluation Criteria:

- Correct implementation of each individual gate in its respective VHDL file.
- Proper instantiation of gates in the top module.
- Comprehensive testbench that validates the integrated functionality of all gates.
- Clean and readable VHDL code with appropriate comments.

### Tips:

- In your top module, remember to declare the input signals `A` and `B`, and the multiple output signals.
- When instantiating each gate in the top module, ensure the input and output port connections are mapped correctly.
