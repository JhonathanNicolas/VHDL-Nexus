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

entity decoder is
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0));
end decoder;

architecture Behavioral of decoder is

begin

    -- Let's try to practice another VHDL trick
    with I select O <=
    "0001" when "00",
    "0010" when "01",
    "0100" when "10",
    "1000" when "11",
    "XXXX" when others;
    
end Behavioral;
