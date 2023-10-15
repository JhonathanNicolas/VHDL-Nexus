----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/14/2023 10:45:15 PM
-- Design Name: 
-- Module Name: tb_top_module - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

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
--  Port ( );
end tb_top_module;

architecture Behavioral of tb_top_module is

component top_module is
    Port ( audio_in : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           audio_out : out STD_LOGIC_VECTOR (15 downto 0);
           rst : in STD_LOGIC);
end component;


signal VALID: boolean := false;
constant clk_period : time := 10 ns;

file infile_result          : TEXT open READ_MODE is "noisy_output.txt";
file outfile_result         : TEXT open WRITE_MODE is "filtered_audio.txt";

signal s_audio_in : STD_LOGIC_VECTOR (15 downto 0);
signal s_audio_out : STD_LOGIC_VECTOR (15 downto 0);
signal s_clk : std_logic := '0';
signal s_rst : std_logic := '1';

begin

read_audio_input: process
    variable inline : line; 
    variable vdata: INTEGER;
begin
    s_audio_in <= (others => '0');
    s_rst <= '1';
    wait for 200 ns;  
    s_rst <= '0';
    wait for 10 ns;
    VALID <= TRUE;
    while (not(endfile(infile_result))) loop
        readline(infile_result, inline);
        read(inline,vdata);
        s_audio_in <= std_logic_vector(to_signed(vdata,s_audio_in'length ));
        wait for 10 ns;
     end loop;
     VALID <= FALSE;
     assert not(VALID) report "Simulation ended" severity warning;
end process;

clk_process :process
   begin
		s_clk <= '0';
		wait for clk_period/2;
		s_clk <= '1';
		wait for clk_period/2;
end process;
   

write_proc: process(s_clk)
    variable out_line : line;
    variable int_value : integer; 
begin
    if rising_edge(s_clk) then
        if s_audio_out /= "UUUUUUUUUUUUUUUU" then 
            file_open(outfile_result, "filtered_audio.txt", append_mode); 

            int_value := to_integer(signed(s_audio_out)); 
            write(out_line, int_value); 
            writeline(outfile_result, out_line); 

            file_close(outfile_result); 
        end if;
    end if;
end process;


dut: top_module port map(
        clk => s_clk,
        rst => s_rst,
        audio_out => s_audio_out,
        audio_in => s_audio_in);
end Behavioral;
