library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;
use IEEE.std_logic_textio.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity top_module_tb is
end top_module_tb;

architecture sim of top_module_tb is
    signal binary_in  : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal gray_out   : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal expect_out : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal started    : boolean := false;
    COMPONENT top_module
    Port ( binary_number : in  STD_LOGIC_VECTOR(3 downto 0);
           gray_number  : out STD_LOGIC_VECTOR(3 downto 0));
    end COMPONENT;
    
    file infile   : TEXT open READ_MODE is "expected_results.txt";
begin

    DUT: top_module PORT MAP (
        binary_number  => binary_in,
        gray_number   => gray_out
    );
    
    process
        variable inline : line; -- line number declaration
        variable vdata: STD_LOGIC_VECTOR(3 downto 0);
    begin
        binary_in <= (others=> '0');
        started <= false;
        wait for 10ns;
        while (not(endfile(infile))) loop
            readline(infile, inline);
            read(inline,vdata);
            expect_out <= vdata;
            
            if(started) then
                binary_in <= binary_in + 1;
            else
                started <= true;
            end if;
            
            wait for 1ns;
            
         end loop;
            assert not endfile(infile) report "Simulation ended" severity warning;
        
        assert FALSE report "Simulation ended" severity NOTE;
        wait;
    end process;

end sim;
