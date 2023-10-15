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

entity FIR16bit is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0));
end FIR16bit;

architecture Behavioral of FIR16bit is



constant FIR_WORD_SIZE : NATURAL := 16;
constant FIR_STEP_SIZE : NATURAL := 64;

type coeffs_type is array (0 to FIR_STEP_SIZE/2 -1) of INTEGER;
type fir_signal is array (0 to FIR_STEP_SIZE) of STD_LOGIC_VECTOR(FIR_WORD_SIZE-1 downto 0);

constant COEFFICIENTS: coeffs_type := (
    2*16#FFE9#, 2*16#FFEA#, 2*16#FFEA#, 2*16#FFEA#, 2*16#FFEB#, 2*16#FFEE#, 2*16#FFF3#, 2*16#FFFA#,
    2*16#0007#, 2*16#0018#, 2*16#0030#, 2*16#004E#, 2*16#0074#, 2*16#00A3#, 2*16#00D9#, 2*16#0118#,
    2*16#015F#, 2*16#01AD#, 2*16#0201#, 2*16#025A#, 2*16#02B8#, 2*16#0317#, 2*16#0376#, 2*16#03D3#,
    2*16#042D#, 2*16#0481#, 2*16#04CD#, 2*16#050F#, 2*16#0547#, 2*16#0571#, 2*16#058E#, 2*16#059D#);


signal fir_signals_in : fir_signal;
signal fir_signals_out : fir_signal;
signal sum_signals : STD_LOGIC_VECTOR (FIR_WORD_SIZE-1 downto 0);

component FIR16bits_1step is
    Generic (
            DATA_WIDTH: INTEGER := FIR_WORD_SIZE;
            COEFFICIENT: INTEGER := 0);
    Port ( clk : in STD_LOGIC;
            rst : in STD_LOGIC;
            data_in : in STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
            data_out : out STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0));
end component;


begin

    generate_FIRs: for i in 0 to (FIR_STEP_SIZE/2) - 1 generate
    uFIR: FIR16bits_1step
        generic map(
            DATA_WIDTH => FIR_WORD_SIZE,
            COEFFICIENT => COEFFICIENTS(i) )
        port map (
            clk => clk,
            rst => rst,
            data_in => fir_signals_in(i),
            data_out => fir_signals_out(i)
        );
end generate;

-- Shift process
shift_process: process(clk, rst)
begin
    if (rst = '1') then
        for idx in 0 to FIR_STEP_SIZE-1 loop
            fir_signals_in(idx) <= (others => '0');
        end loop;
    elsif rising_edge(clk) then
        fir_signals_in(0) <= data_in;
        for idx in 0 to (FIR_STEP_SIZE/2) - 2 loop
            fir_signals_in(idx+1) <= fir_signals_out(idx);
            fir_signals_in(FIR_STEP_SIZE - idx - 1) <= fir_signals_out(FIR_STEP_SIZE - idx - 2);
        end loop;
    end if;
end process;

-- Summation process
summation_process: process(clk, rst)
    variable sum: integer := 0;
begin
    if rst = '1' then
        sum_signals <= (others => '0');
    elsif rising_edge(clk) then
        sum := 0;
        for idx in 0 to FIR_STEP_SIZE - 1 loop
            sum := sum + to_integer(signed(fir_signals_out(idx)));
        end loop;
        sum_signals <= std_logic_vector(to_signed(sum, FIR_WORD_SIZE));
    end if;
end process;


data_out <= sum_signals;

end Behavioral;
