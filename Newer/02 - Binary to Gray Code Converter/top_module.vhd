--------------------------------------------------------------------------------
-- Project: Binary to Gray Code Converter
-- Author:  Jhonathan Nicolas
-- Date:    10/10/23
-- Description: This module converts a given 4-bit binary number into its 
--              corresponding Gray code representation.
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

entity top_module is
    Port ( binary_number : in STD_LOGIC_VECTOR (3 downto 0);
           gray_number : out STD_LOGIC_VECTOR (3 downto 0));
end top_module;

architecture Behavioral of top_module is

begin

    -- To convert a binary number to its Gray code equivalent, you can use the following logic for each bit:

    -- The most significant bit (MSB) of the Gray code is the same as the original MSB.
    -- The remaining bits of the Gray code are found by the exclusive OR (XOR) of the adjacent binary bits.

    -- The most significant bit (MSB) is the same as original MSG binary format.
    gray_number(3) <= binary_number(3);

    -- The G2 is equal B3 XOR B2
    gray_number(2) <= binary_number(3) xor binary_number(2);

    -- The G1 is equal B2 XOR B1
    gray_number(1) <= binary_number(2) xor binary_number(1);

    -- The G0 is equal B1 XOR B0
    gray_number(0) <= binary_number(1) xor binary_number(0);

end Behavioral;
