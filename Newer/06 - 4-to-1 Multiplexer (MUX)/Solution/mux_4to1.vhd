--------------------------------------------------------------------------------
-- Project: 4-to-1 Multiplexer (MUX)
-- Author:  Jhonathan Nicolas
-- Date:    10/13/23
-- Description: This module routes one of the four inputs to the output based on 
--              the 2-bit selector. The selected input is then passed to the output.
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

entity mux4to1 is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0); -- Inputs
           S : in STD_LOGIC_VECTOR (1 downto 0); -- Select
           Y : out STD_LOGIC );                   -- Output
end mux4to1;

architecture Behavioral of mux4to1 is

begin

    with S select Y <=
    D(0) when "00",
    D(1) when "01",
    D(2) when "10",
    D(3) when "11",
    'X' when others;

end Behavioral;
