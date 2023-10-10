--------------------------------------------------------------------------------
-- Project: Basic Logic Gates Exercise
-- Engineer:  Jhonathan Nicolas
-- Date:   10/10/23
-- Description: This module contains the implementation for the basic logic 
--              gates including AND, OR, XOR, and others.
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

entity nandGate is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           y : out STD_LOGIC);
end nandGate;

architecture Behavioral of nandGate is

begin

y <= a nand b;

end Behavioral;
