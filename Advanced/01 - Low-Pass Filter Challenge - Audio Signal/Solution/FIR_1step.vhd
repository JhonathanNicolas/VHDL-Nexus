----------------------------------------------------------------------------------
-- Company: VHDL- NEXUS Project
-- Engineer: Jhonathan Nicolas
-- 
-- Create Date: 10/14/2023 04:52:51 PM
-- Design Name: Low-Pass FIR Audio Filter
-- Module Name: audio_input - Behavioral
-- Project Name: VHDL Nexus Challenge - Audio Processing
-- Target Devices: Generic FPGA/ASIC Platforms
-- Tool Versions: [Specify VHDL/Tool Version if necessary]
-- Description: 
--   This module implements a low-pass FIR filter designed to attenuate
--   frequencies above 1kHz from an audio input. The primary intention is 
--   to focus on bass frequencies, providing clarity and removing high-frequency noise.
--   
-- Dependencies: 
--   Requires 16-bit quantized FIR coefficients for filtering.
--   
-- Revision:
-- Revision 0.01 - File Created
-- Revision 0.02 - Filter coefficients quantized and tested.
-- Revision 0.03 - Optimized for target device.
-- Additional Comments:
--   This filter was designed using Python for coefficient calculation and
--   was tested against real-world audio samples with added high-frequency noise.
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIR16bits_1step is
    Generic (
            DATA_WIDTH: INTEGER := 16;
            COEFFICIENT: INTEGER := -570);
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
           data_out : out STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0));
end FIR16bits_1step;

architecture Behavioral of FIR16bits_1step is

constant MAX_VAL : INTEGER := 2**DATA_WIDTH-1; -- hexadecimal representation
signal s_partial_result_integer : INTEGER range 0 to MAX_VAL;

begin

generate_response: process(clk, rst)

begin

    if(rst = '1') then
        s_partial_result_integer <= 0;
    elsif(rising_edge(clk)) then
        s_partial_result_integer <= COEFFICIENT * to_integer(signed(data_in));
    end if;
end process;

data_out <= std_logic_vector(to_signed(s_partial_result_integer, data_out'length));

end Behavioral;
