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

entity top_module is
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0));
end top_module;

architecture Behavioral of top_module is

    component decoder is
    Port(I : in STD_LOGIC_VECTOR (1 downto 0);
         O : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

signal s_I : std_logic_vector(1 downto 0) := (others => '0');
signal s_O : std_logic_vector(3 downto 0) := (others => '0');

begin

decoder_2to4: decoder Port map(
    I => s_I,
    O => s_O);

s_I <= I;
O <= s_O;

end Behavioral;
