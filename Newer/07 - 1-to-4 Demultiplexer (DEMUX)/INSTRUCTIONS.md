# 1-to-4 Demultiplexer Challenge
## #generatedByChatGPT

### Objective:
Design a circuit that demultiplexes one input signal into one of the four possible output channels based on a 2-bit control signal. Create individual VHDL files for any components you use, and then integrate them in a top module.

### Requirements:
#### Inputs:
- 1-bit Data signal: D
- 2-bit Control signal: S[1:0]

#### Outputs:
- Four 1-bit output channels: Y[3:0]

### Guidelines:

1. **VHDL File**: Create a dedicated VHDL file for the demultiplexer (e.g., `demux_1to4.vhdl`).

2. **Top Module**: Create a top module (e.g., `top_demux_1to4.vhdl`), where you instantiate the demultiplexer component and connect inputs and outputs.

3. **Testing**: Utilize the provided testbench `tb_top_module.vhd` to verify the demultiplexer's functionality. The testbench will utilize seed files and Python scripts to generate inputs and expected outputs. The generated files will be `inputs_data.txt`, `inputs_select.txt`, and `expected_results.txt`.

### Note on Testing:
- `seeds.txt`: Contains a series of seed numbers to generate specific inputs and expected outputs. If you want to add more cases to your tests, simply add more seeds (one per line).
- Utilize the provided Python script to generate input and output vectors based on the seeds. The Python script will create the following files:
  - `inputs_data.txt`: Contains the input data for the demux.
  - `inputs_select.txt`: Contains the select signal to choose which output channel will be active.
  - `expected_results.txt`: Contains the expected outputs based on the input data and select signals.

### Evaluation Criteria:
- Correct routing of the input data to the specified output channel based on the select signals for all combinations.
- Proper instantiation and integration in the top module.
- Clean and readable VHDL code with appropriate comments.