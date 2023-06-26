----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.05.2023 12:26:31
-- Design Name: 
-- Module Name: fulladder - Behavioral
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
use IEEE.std_logic_signed.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fulladder is
  Port (
        cin : in std_logic;
        x,y : in std_logic_vector(3 downto 0);
        s   : out std_logic_vector(3 downto 0);
        cout: out std_logic
  );
end fulladder;

architecture Behavioral of fulladder is
    signal sum : std_logic_vector(4 downto 0);
begin
    sum <= ('0' & x) + ('0' & y) + cin;
    s   <= sum(3 downto 0);
    cout <= sum(4);

end Behavioral;
