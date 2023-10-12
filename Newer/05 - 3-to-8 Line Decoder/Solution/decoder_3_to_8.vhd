--------------------------------------------------------------------------------
-- Project: 3-to-8 Line Decoder
-- Author:  Jhonathan Nicolas
-- Date:    10/12/23
-- Description: This module takes a 3-bit binary input and decodes it to one of
--              the eight possible output lines. Only one output will be high
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

entity decoder is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (7 downto 0));
end decoder;

architecture Behavioral of decoder is

begin

    -- Let's try to practice another VHDL trick
    with I select O <=
    "00000001" when "000",
    "00000010" when "001",
    "00000100" when "010",
    "00001000" when "011",
    "00010000" when "100",
    "00100000" when "101",
    "01000000" when "110",
    "10000000" when "111",
    "XXXXXXXX" when others;
    
end Behavioral;
