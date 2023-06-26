----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.06.2023 10:31:19
-- Design Name: 
-- Module Name: counter_4bit_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_4bit_tb is
end counter_4bit_tb;

architecture Behavioral of counter_4bit_tb is

    signal clock: std_logic;
    signal reset: std_logic;
    signal count: std_logic_vector(3 downto 0);

    component counter_4bit is
      port ( 
        clock: in std_logic;
        reset: in std_logic;
        count: out std_logic_vector(3 downto 0)
      );
    end component;

begin

    dut: counter_4bit
    port map(
        clock => clock,
        reset => reset,
        count => count
    
    );
    
    clockGen: process
    begin
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
    end process;
    
    stimGen: process
    begin
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        -- add enable
        -- add updown = 1
        -- add updown = 0
        wait;
    end process;
    
    
    
    


end Behavioral;
