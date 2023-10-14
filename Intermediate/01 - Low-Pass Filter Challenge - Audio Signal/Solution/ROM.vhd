----------------------------------------------------------------------------------
-- Company: VHDL- NEXUS Prokect
-- Engineer: Jhonathan Nicolas
-- 
-- Create Date: 10/14/2023 04:52:51 PM
-- Design Name: Low-Pass FIR Audio Filter
-- Module Name: audio_input - Behavioral
-- Project Name: VHDL Nexus Challenge - Audio Processing
-- Target Devices: Generic FPGA/ASIC Platforms
-- Tool Versions: [Specify VHDL/Tool Version if necessary]
-- Description: 
--   This module implements a low-pass FIR filter designed to attenuate
--   frequencies above 1kHz from an audio input. The primary intention is 
--   to focus on bass frequencies, providing clarity and removing high-frequency noise.
--   
-- Dependencies: 
--   Requires 16-bit quantized FIR coefficients for filtering.
--   
-- Revision:
-- Revision 0.01 - File Created
-- Revision 0.02 - Filter coefficients quantized and tested.
-- Revision 0.03 - Optimized for target device.
-- Additional Comments:
--   This filter was designed using Python for coefficient calculation and
--   was tested against real-world audio samples with added high-frequency noise.
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Generic( WIDTH_SIZE : NATURAL := 16;
             DEEPTH_SIZE: NATURAL := 32
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           addr : in STD_LOGIC_VECTOR (DEEPTH_SIZE downto 0);
           data_out : out STD_LOGIC_VECTOR (WIDTH_SIZE-1 downto 0));
end ROM;

architecture Behavioral of ROM is

    type RomType is array(0 to DEEPTH_SIZE-1) of bit_vector(WIDTH_SIZE-1 downto 0);
    impure function InitRamFromFile (RomFileName : in string) return RomType is
    FILE RomFile : text is in RomFileName;
    variable RomFileLine : line;
    variable ROM : RomType;
    
begin
    
    for I in RomType'range loop
        readline (RomFile, RomFileLine);
        read (RomFileLine, ROM(I));
    end loop;
    return ROM;
    end function;
    
    signal ROM : RomType := InitRamFromFile("rom_init.data");
    begin
    process (clk)
    begin
    
    if(rst = '1') then
    
        data_out <= (others => '0');
    
    elsif(rising_edge(clk)) then
        
        data_out <= to_stdlogicvector(ROM(conv_integer(addr)));
        
    end if;
    end process;
    

end Behavioral;
