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

entity top_module is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           and_out : out STD_LOGIC;
           xor_out : out STD_LOGIC;
           or_out : out STD_LOGIC;
           not_a_out : out STD_LOGIC;
           not_b_out : out STD_LOGIC;
           nand_out : out STD_LOGIC);
end top_module;

architecture Behavioral of top_module is

    component andGate is
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

    component nandGate is
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

    component notGate is
        Port ( a : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

    component orGate is
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

    component xorGate is
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;
    
begin


and_c: andGate port map(
        a => a,
        b => b,
        y => and_out

    );

or_c: orGate port map(
        a => a,
        b => b,
        y => or_out

    );

xor_c: xorGate port map(
        a => a,
        b => b,
        y => xor_out

    );

not_a_c: notGate port map(
        a => a,
        y => not_a_out

    );

not_b_c: notGate port map(
        a => b,
        y => not_b_out

    );
    
nand_c: nandGate port map(
        a => a,
        b => b,
        y => nand_out

    );

end Behavioral;