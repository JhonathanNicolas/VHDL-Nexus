--------------------------------------------------------------------------------
-- Project: 2-to-4 Line Decoder
-- Author:  Jhonathan Nicolas
-- Date:    10/11/23
-- Description: This module takes a 2-bit binary input and decodes it to one of
--              the four possible output lines. Only one output will be high
--              based on the input while the rest remain low.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
    Port(I : in STD_LOGIC_VECTOR (1 downto 0);
         O : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

signal s_I : std_logic_vector(1 downto 0) := (others => '0');
signal s_O : std_logic_vector(3 downto 0) := (others => '0');
signal s_O_Expected : std_logic_vector(3 downto 0) := (others => '0');

signal VALID: boolean := false;
signal CORRECT_RESULT: boolean := false;
begin

dut: top_module port map (
    I => s_I,
    O => s_O);


get_result: process
begin

    wait for 10 ns;
    VALID <= true;

    s_O_Expected <= "0001";
    s_I <= "00";
    wait for 10 ns;
    s_O_Expected <= "0010";
    s_I <= "01";
    wait for 10 ns;
    s_O_Expected <= "0100";
    s_I <= "10";
    wait for 10 ns;
    s_O_Expected <= "1000";
    s_I <= "11";
    wait for 10 ns;
    VALID <= false;
end process; 

check_result: process
begin
    wait for 10 ns;
    if(VALID) then

        CORRECT_RESULT <= (s_O_Expected = s_O);
    else
        CORRECT_RESULT <= true;
    end if;
end process;

end Behavioral;
