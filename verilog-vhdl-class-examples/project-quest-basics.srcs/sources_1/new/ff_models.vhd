----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.06.2023 10:30:05
-- Design Name: 
-- Module Name: ff_models - Behavioral
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

entity ff_models is
    port(
        clock, reset : in std_logic;
        a, b, c, d   : in std_logic;
        e, f, g, h   : in bit;
        aq, bq, cq, dq: out std_logic;
        eq, fq, gq, hq: out bit
    );
end ff_models;

architecture Behavioral of ff_models is
begin
    
    P1: process(clock, reset)
    begin
        if(clock'event and clock = '1') then -- positive edge
            if(reset = '1') then
                aq <= '0';
            else
                aq <= a;
            end if;
        end if;
    
        if(clock'event and clock = '0') then -- negative edge
            if(reset = '1') then
                bq <= '0';
            else
                bq <= b;
            end if;
        end if;
    end process;
    
    P2: process 
    begin
        -- cannot have sensitivity list if you have a wait until statement
        wait until(clock'event and clock = '1');
            cq <= c;
    end process;
    
    P3: process 
    begin
        -- cannot have sensitivity list if you have a wait until statement
        wait until(clock'event and clock = '0');
            if(reset = '1') then
                dq <= '0';
            else
                dq <= d;
            end if;
    end process;
    
    P4: process(clock, reset)
    begin
        if rising_edge(clock) then -- positive edge
            if(reset = '1') then
                eq <= '0';
            else
                eq <= e;
            end if;
        end if;
    end process;
    
    P5: process(clock, reset)
    begin
        if falling_edge(clock) then -- positive edge
            if(reset = '1') then
                fq <= '0';
            else
                fq <= f;
            end if;
        end if;
    end process;
    
    P6: process 
    begin
        -- cannot have sensitivity list if you have a wait until statement
        wait until rising_edge(clock);
            gq <= g;
    end process;
    
    P7: process 
    begin
        -- cannot have sensitivity list if you have a wait until statement
        wait until falling_edge(clock);
            hq <= h;
    end process;

end Behavioral;
