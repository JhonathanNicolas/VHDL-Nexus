--------------------------------------------------------------------------------
-- Project: 1-to-4 Demultiplexer (DEMUX)
-- Author:  Jhonathan Nicolas
-- Date:    10/13/23
-- Description: This module routes a single input signal to one of the four outputs 
--              based on the 2-bit selector. The input signal is forwarded to the 
--              selected output channel.
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
    Port ( Y : out STD_LOGIC_VECTOR (3 downto 0);-- Outputs
           S : in STD_LOGIC_VECTOR (1 downto 0); -- Select
           D : in STD_LOGIC );                   -- input
end top_module;

architecture Behavioral of top_module is

    component demux4to1 is port
    (
        Y : out STD_LOGIC_VECTOR (3 downto 0);-- Outputs
        S : in STD_LOGIC_VECTOR (1 downto 0); -- Select
        D : in STD_LOGIC
    );
    end component;


begin

demux: demux4to1 port map (

    D => D,
    S => S,
    Y => Y

);

end Behavioral;
