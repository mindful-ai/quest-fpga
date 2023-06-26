----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.06.2023 12:22:55
-- Design Name: 
-- Module Name: mux_4_to_1 - Behavioral
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
 
entity mux4_1 is
    port(
     
        A,B,C,D : in STD_LOGIC;
        S0,S1: in STD_LOGIC;
        Z: out STD_LOGIC
    );
end mux4_1;
 
architecture Behavioral of mux4_1 is
    component mux_2_1
        port( a,b : in STD_LOGIC;
                s: in STD_LOGIC;
                o: out STD_LOGIC);
    end component;
    signal temp1, temp2: std_logic;
 
begin
    m1: mux_2_1 port map(A,B,S0,temp1);
    m2: mux_2_1 port map(C,D,S0,temp2);
    m3: mux_2_1 port map(temp1,temp2,S1,Z);
 
end Behavioral;
