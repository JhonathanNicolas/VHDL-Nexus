--------------------------------------------------------------------------------
-- Project: Simple 4 bit comparator
-- Author:  Jhonathan Nicolas
-- Date:    10/10/23
-- Description: This module compares if the input A is equal the input B. If the
--              Inputs are equal the output `equal` will be high, otherwise,
--              `a_greatter_than_b` or `a_less_than_b` will be high.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;
use IEEE.std_logic_textio.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;


entity tb_top_module is
--  Port ( );
end tb_top_module;

architecture Behavioral of tb_top_module is


component top_module is
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               EQUAL : out STD_LOGIC;
               A_GREATTER_THAN_B : out STD_LOGIC;
               A_LESS_THAN_B : out STD_LOGIC);
end component;

signal A : STD_LOGIC_VECTOR (3 downto 0);
signal B : STD_LOGIC_VECTOR (3 downto 0);

signal EQUAL : STD_LOGIC;
signal A_GREATTER_THAN_B : STD_LOGIC;
signal A_LESS_THAN_B : STD_LOGIC;


signal EQUAL_EXPECTED : STD_LOGIC;
signal A_GREATTER_THAN_B_EXPECTED : STD_LOGIC;
signal A_LESS_THAN_B_EXPECTED : STD_LOGIC;

file infile_A                   : TEXT open READ_MODE is "input_a.txt";
file infile_B                   : TEXT open READ_MODE is "input_b.txt";
file infile_EQUAL               : TEXT open READ_MODE is "EQUAL.txt";
file infile_A_LESS_THAN_B       : TEXT open READ_MODE is "A_LESS_THAN_B.txt";
file infile_A_GREATTER_THAN_B   : TEXT open READ_MODE is "A_GREATTER_THAN_B.txt";


begin


read_a_input: process
        variable inline : line; 
        variable vdata: STD_LOGIC_VECTOR(3 downto 0);
    begin
        A <= (others=> '0');
        started <= false;
        wait for 10ns;
        while (not(endfile(infile_A))) loop
            readline(infile, inline);
            read(inline,vdata);
            A <= vdata;
            wait for 10ns;
         end loop;
    end process;

read_b_input: process
        variable inline : line; 
        variable vdata: STD_LOGIC_VECTOR(3 downto 0);
    begin
        B <= (others=> '0');
        started <= false;
        wait for 10ns;
        while (not(endfile(infile_B))) loop
            readline(infile, inline);
            read(inline,vdata);
            B <= vdata;
            wait for 10ns;
         end loop;
    end process;

read_equal_output: process
        variable inline : line; 
        variable vdata: STD_LOGIC_VECTOR(3 downto 0);
    begin
        EQUAL_EXPECTED <= (others=> '0');
        started <= false;
        wait for 10ns;
        while (not(endfile(infile_B))) loop
            readline(infile, inline);
            read(inline,vdata);
            EQUAL_EXPECTED <= vdata;
            wait for 10ns;
         end loop;
    end process;

read_a_greatter_than_b_expected: process
        variable inline : line; 
        variable vdata: STD_LOGIC_VECTOR(3 downto 0);
    begin
        A_GREATTER_THAN_B_EXPECTED <= (others=> '0');
        started <= false;
        wait for 10ns;
        while (not(endfile(infile_B))) loop
            readline(infile, inline);
            read(inline,vdata);
            A_GREATTER_THAN_B_EXPECTED <= vdata;
            wait for 10ns;
         end loop;
    end process;

read_a_less_than_b_expected: process
        variable inline : line; 
        variable vdata: STD_LOGIC_VECTOR(3 downto 0);
    begin
        A_LESS_THAN_B_EXPECTED <= (others=> '0');
        started <= false;
        wait for 10ns;
        while (not(endfile(infile_B))) loop
            readline(infile, inline);
            read(inline,vdata);
            A_LESS_THAN_B_EXPECTED <= vdata;
            wait for 10ns;
         end loop;
    end process;



uut: top_module port map(
    A <= A,
    B <= B,
    EQUAL <= EQUAL,
    A_GREATTER_THAN_B <= A_GREATTER_THAN_B,
    A_LESS_THAN_B <= A_LESS_THAN_B
);

end Behavioral;
