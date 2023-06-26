----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.06.2023 12:12:10
-- Design Name: 
-- Module Name: combo_seq - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity combo_seq is
    port(
            clock: in std_logic;
            a, b, c, d, e: in std_logic; 
            q: out std_logic  -- flip flop
    );
end combo_seq;

architecture Behavioral of combo_seq is 
    signal m: std_logic; -- flip flop
begin

    process(clock)
        variable n : std_logic;   -- this is local to this process block
    begin
        if rising_edge(clock) then
            m <= (a nand b);
            n := c or d;
            q <= not(m or n or e);
        end if;
    end process;
    


end Behavioral;
