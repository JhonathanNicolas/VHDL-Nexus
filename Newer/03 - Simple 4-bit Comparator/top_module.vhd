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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_module is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           EQUAL : out STD_LOGIC;
           A_GREATTER_THAN_B : out STD_LOGIC;
           A_LESS_THAN_B : out STD_LOGIC);
end top_module;

architecture Behavioral of top_module is

begin

equal_p: process(A,B)

begin
    if( A = B) then
        equal <= '1';
    else
        equal <= '0';
    end if;
end process;

a_greatter_than_b_p: process(A,B)

begin
    if( A > B) then
        A_GREATTER_THAN_B <= '1';
    else
        A_GREATTER_THAN_B <= '0';
    end if;
end process;

a_less_than_b_p: process(A,B)

begin
    if( A > B) then
        A_LESS_THAN_B <= '1';
    else
        A_LESS_THAN_B <= '0';
    end if;
end process;

end Behavioral;
