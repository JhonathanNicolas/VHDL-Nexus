--------------------------------------------------------------------------------
-- Project: 4-to-1 Multiplexer (MUX)
-- Author:  Jhonathan Nicolas
-- Date:    10/13/23
-- Description: This module routes one of the four inputs to the output based on 
--              the 2-bit selector. The selected input is then passed to the output.
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;
use IEEE.std_logic_textio.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_top_module is
   -- Port ( );
end tb_top_module;

architecture Behavioral of tb_top_module is

    component top_module is
        Port ( D : in STD_LOGIC_VECTOR (3 downto 0); -- Inputs
               S : in STD_LOGIC_VECTOR (1 downto 0); -- Select
               Y : out STD_LOGIC );                   -- Output
    end component;

signal s_D : std_logic_vector(3 downto 0) := (others => '0');
signal s_S : std_logic_vector(1 downto 0) := (others => '0');
signal s_Y : std_logic;
signal s_Y_Expected : std_logic;

signal VALID: boolean := false;
signal CORRECT_RESULT: boolean := false;

file infile_result          : TEXT open READ_MODE is "expected_results.txt";
file infile_inputs_select   : TEXT open READ_MODE is "inputs_select.txt";
file infile_inputs_data     : TEXT open READ_MODE is "inputs_data.txt";

begin

dut: top_module port map (
    D => s_D,
    S => s_S,
    Y => s_Y);


read_select_input: process
    variable inline : line; 
    variable vdata: STD_LOGIC_VECTOR(3 downto 0);
begin
    s_S <= (others=> '0');
    wait for 10 ns;
    while (not(endfile(infile_inputs_select))) loop
        readline(infile_inputs_select, inline);
        read(inline,vdata);
        s_S <= vdata;
        wait for 10 ns;
     end loop;
     VALID <= false;
end process;

read_data_input: process
    variable inline : line; 
    variable vdata: STD_LOGIC_VECTOR(3 downto 0);
begin
    s_D <= (others=> '0');
    wait for 10 ns;
    while (not(endfile(infile_inputs_data))) loop
        readline(infile_inputs_data, inline);
        read(inline,vdata);
        s_D <= vdata;
        wait for 10 ns;
     end loop;
     VALID <= false;
end process;

read_result_expected_output: process
    variable inline : line; 
    variable vdata: STD_LOGIC;
begin
    s_Y_Expected <= '0';
    wait for 10 ns;
    while (not(endfile(infile_result))) loop
        readline(infile_result, inline);
        read(inline,vdata);
        s_Y_Expected <= vdata;
        wait for 10 ns;
     end loop;
     VALID <= false;
end process;

CORRECT_RESULT <= (s_y = s_Y_Expected);

end Behavioral;
