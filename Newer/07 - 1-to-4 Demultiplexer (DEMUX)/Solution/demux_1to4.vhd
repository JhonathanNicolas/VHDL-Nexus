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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity demux4to1 is
    Port ( Y : out STD_LOGIC_VECTOR (3 downto 0);-- Outputs
           S : in STD_LOGIC_VECTOR (1 downto 0); -- Select
           D : in STD_LOGIC );                   -- Output
end demux4to1;

architecture Behavioral of demux4to1 is

begin

--PS: There are a lot of ways to do that withot HARDCODED the index, but let's do it on the simplest way, and 
--    in the future we can test news solutions.

    -- This is a safe approach
    process(S, D)
    begin
        case S is
            when "00" =>
                Y(0) <= '0';
                Y(1) <= '0';
                Y(2) <= '0';
                Y(3) <=  D;
            when "01" =>
                Y(0) <= '0';
                Y(1) <= '0';
                Y(2) <=  D;
                Y(3) <= '0';
            when "10" =>
                Y(0) <= '0';
                Y(1) <=  D;
                Y(2) <= '0';
                Y(3) <= '0';                
            when "11" =>
                Y(0) <=  D;
                Y(1) <= '0';
                Y(2) <= '0';
                Y(3) <= '0';
            when others =>
                Y <= (others => '0');
            end case;
    end process;
   
    -- econimics aproach
--    process(S, D)
--    begin
--        case S is
--            when "00" =>
--                Y(0) <= 'X';
--                Y(1) <= 'X';
--                Y(2) <= 'X';
--                Y(3) <=  D;
--            when "01" =>
--                Y(0) <= 'X';
--                Y(1) <= 'X';
--                Y(2) <=  D;
--                Y(3) <= 'X';
--            when "10" =>
--                Y(0) <= 'X';
--                Y(1) <=  D;
--                Y(2) <= 'X';
--                Y(3) <= 'X';                
--            when "11" =>
--                Y(0) <=  D;
--                Y(1) <= 'X';
--                Y(2) <= 'X';
--                Y(3) <= 'X';
--            when others =>
--                Y <= (others => 'X');
--            end case;
--    end process;
   
end Behavioral;
