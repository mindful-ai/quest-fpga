----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.06.2023 09:50:23
-- Design Name: 
-- Module Name: counter_4bit - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_4bit is
  port ( 
    clock: in std_logic;
    reset: in std_logic;
    count: out std_logic_vector(3 downto 0)
  );
end counter_4bit;

architecture Behavioral of counter_4bit is
    signal upcount: std_logic_vector (3 downto 0);
begin

    counterProcess: process(clock)
    begin
        if(rising_edge(clock)) then
            if(reset = '1') then
                upcount <= (others => '0');
            else
                upcount <= upcount + "1";
            end if;
        end if;
    end process;
    
    count <= upcount;

end Behavioral;
