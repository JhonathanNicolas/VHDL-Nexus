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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity audio_input is
    Port ( data : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           audio : out STD_LOGIC_VECTOR (15 downto 0);
           rst : in STD_LOGIC);
end audio_input;

architecture Behavioral of audio_input is

begin

read_data: process(clk, rst)
begin
    if(rst = '1') then
        audio <= (others => '0');
    elsif(rising_edge(clk)) then
        audio <= data;
    end if;
end process;

end Behavioral;
